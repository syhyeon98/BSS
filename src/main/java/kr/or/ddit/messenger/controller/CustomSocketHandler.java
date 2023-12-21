package kr.or.ddit.messenger.controller;

import java.security.Principal;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import javax.inject.Inject;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.edApproval.service.SignpathService;
import kr.or.ddit.edApproval.vo.SignpathDetailVO;
import kr.or.ddit.edApproval.vo.SignpathVO;
import kr.or.ddit.edDocument.dao.DocumentDao;
import kr.or.ddit.edDocument.service.DocumentService;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import kr.or.ddit.messenger.dao.ChatReadDAO;
import kr.or.ddit.messenger.dao.ChatRecordDAO;
import kr.or.ddit.messenger.service.ChatRoomService;
import kr.or.ddit.messenger.vo.ChatReadVO;
import kr.or.ddit.messenger.vo.ChatRecordVO;
import kr.or.ddit.messenger.vo.ChatRoomVO;
import kr.or.ddit.messenger.vo.ChatUserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class CustomSocketHandler extends TextWebSocketHandler{
	@Inject
	private ChatRoomService chatRoomService;
	
	@Inject
	private ChatRecordDAO chatRecordDao;
	
	@Inject
	private ChatReadDAO chatReadDao;
	
	@Inject
	private DocumentDao documentDao;
	
	Map<String, List<WebSocketSession>> users = new ConcurrentHashMap<String, List<WebSocketSession>>();
	
	// 클라이언트가 서버로 연결시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String, String> userInfo = getEmpCd(session);
		String senderCd = userInfo.get("empCd");
		String senderNm = userInfo.get("empName");
		if(senderCd != null) {
			// 첫 연결 수립이라면 List<WebSocketSession> 생성해서 value에 넣어주기
			if (!users.containsKey(senderCd)) {
				log.info("{} users", users.get(senderCd));
				List<WebSocketSession> sessions = new ArrayList<>();
				users.put(senderCd, sessions);
			}
			users.get(senderCd).add(session);
			log.info("{} 사원이 {} 세션 연결하였습니다. 현재 세션 개수 : {}", senderNm, session, users.get(senderCd).size());
		}else {
			log.info("{} 사원이 {} 세션 연결에 실패하였습니다. 현재 세션 개수 : {}", senderNm, session, users.get(senderCd).size());
		}
	}
	
	// 클라이언트가 데이터 전송 시
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Map<String, String> userInfo = getEmpCd(session);
		String senderId  = userInfo.get("empCd");
		String empNm  = userInfo.get("empName");
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		// 송신자가 보낸 내용
		Map<String, Object> mapReceive = objectMapper.readValue(message.getPayload(), Map.class);
		
		String type = (String) mapReceive.get("type");
		String msg = (String) mapReceive.get("msg");
		
		if(msg == null) return;
		
		// 수신자에게 보낼 내용
		Map<String, Object> mapToSend = new HashedMap<String, Object>();
		
		String jsonStr = null;
		
		switch(type) {
		case "CHAT_REQ":
			mapToSend.put("type", "chat");
			//같은 채팅방에 메시지 전송
			LocalDateTime now = LocalDateTime.now();
			// 소수점 삭제
			LocalDateTime sendTime = now.truncatedTo(ChronoUnit.SECONDS);
			String getSendTime = sendTime.toString();
			
			// 채팅방 아이디로 정보 가져오기
			Integer chrId = (Integer) mapReceive.get("roomNo");
			ChatRoomVO chatRoomInfo = chatRoomService.retrieveChatRoomDetail(chrId.toString());
			if(chatRoomInfo == null) return;
			String roomName = chatRoomService.getRoomName(chrId);
			
			mapToSend.put("roomNo", chrId);
			mapToSend.put("sender", senderId);
			mapToSend.put("sendTime", sendTime.toString());
			mapToSend.put("msg", empNm + " : " + mapReceive.get("msg") + " [" + sendTime + "]");
			mapToSend.put("empNm", empNm);
			mapToSend.put("msgContent", mapReceive.get("msg"));
			mapToSend.put("getSendTime", getSendTime);
			mapToSend.put("senderId", senderId);
			mapToSend.put("roomName", roomName);
			mapToSend.put("Type", type);
			jsonStr = objectMapper.writeValueAsString(mapToSend);
			
			// 채팅방 소속 멤버들 중에 현재 접속되어 있는 사람들에게 실시간 메시지 전송 
			for(ChatUserVO chatUser : chatRoomInfo.getChatUserList()) {
				String accId = chatUser.getEmpCd();
				//if(!senderId.equals(accId)) {
					if(users.containsKey(accId)) {
						// 모든 소켓 세션에 전송 보내기
						chatUser.getRoomNo();
						for(WebSocketSession targetSession : users.get(accId)) {
							targetSession.sendMessage(new TextMessage(jsonStr));
							log.info("{} 세션에 전송하였습니다.", targetSession);
						}
					}
				//}
			}
			
			// chatRoomMsgVO 생성해서 저장하기
			// 필요정보 내용, 누가 보냈는지
			String chatRecodeNo = UUID.randomUUID().toString().substring(0, 30);
			
			ChatRecordVO chatRecord = new ChatRecordVO();
			chatRecord.setRecodeNo(chatRecodeNo);
			chatRecord.setMessengerContent(msg);
			chatRecord.setMessengerTime(sendTime);
			chatRecord.setRoomNo(chrId);
			chatRecord.setEmpCd(senderId);
			
			// 메시지 전송시 삽입
			chatRecordDao.insertMsg(chatRecord);
			ChatReadVO chatRead = new ChatReadVO();
			// 채팅방 유져마다 읽었는지 여부를 확인하기 위해서
			for(ChatUserVO chatUser : chatRoomInfo.getChatUserList()) {
				if(!chatUser.getEmpCd().equals(senderId)) {
					chatRead.setRecoreEmp(chatUser.getEmpCd());
					chatRead.setRecodeNo(chatRecodeNo);
					chatRead.setRecoreRoomno(chrId);
					chatRead.setChatRead(chatRead);
					
					chatReadDao.insertRead(chatRead);
				}
			}
			
			break;
		
		// 알맞는 결재자에게 결재 요청 웹소캣을 통해서 보내기
		case "DOC_REQ":
			mapToSend.put("type", "chat");
			
			int signPathNo = Integer.parseInt((String)mapReceive.get("signpathNo")) ;
			SignpathDetailVO signPath = new SignpathDetailVO();
			signPath.setSignpathNo(signPathNo);
			signPath.setEmpCd2(senderId);
			
			mapToSend.put("msg", mapReceive.get("msg"));
			mapToSend.put("senderId", senderId);
			mapToSend.put("Type", type);
			mapToSend.put("empNm", empNm);
			
			jsonStr = objectMapper.writeValueAsString(mapToSend);
			
			List<SignpathDetailVO> signPathInfo = documentDao.selectSignPathDetailList(signPath);
			if(signPathInfo == null) return;
			
//			for(int i = 0; i < signPathInfo.size(); i++) {
//			}
			for(SignpathDetailVO signPathDetail : signPathInfo) {
				String accId = signPathDetail.getEmpCd();
				if(users.containsKey(accId)) {
					for(WebSocketSession targetSession : users.get(accId)) {
						targetSession.sendMessage(new TextMessage(jsonStr));
						log.info("{} 세션에 결제 요청을 전송하였습니다.", targetSession);
					}
				}
			}
			
			break;
		}
	}
	
	  // 연결 해제될 때
	   @Override
	   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	      Map<String, String> userInfo = getEmpCd(session);
	      String senderId = userInfo.get("empCd");
	      if(senderId != null) {   // 로그인 값이 있는 경우만
	         log(senderId + " 연결 종료됨");
	         if (users.get(senderId).remove(session)) {
	            log.info("{} 세션 종료 성공 : ", session);
	            // 만약 저장하고 있는 세션이 없으면 users에서 해당 아이디 삭제하기
	            if (users.get(senderId).size() == 0) {
	               users.remove(senderId);
	               log.info("{} 모든 세션 종료 성공", senderId);
	            }
	         } else {
	            log.info("{} 세션 종료 실패: ", session);
	         }
	      }
	   }

	
	private void log(String logmsg) {
		System.out.println(new Date() + ":" + logmsg);
	}
	
	// 에러 발생시
@Override
public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
	log(session.getId() + " 익셉션 발생: " + exception.getMessage());
}
	
	private Map<String, String> getEmpCd(WebSocketSession session){
		Map<String, String> userInfo = new HashedMap<>();
		String empCd = null;
		String empName = null;
		
		Authentication authentication = (Authentication) session.getPrincipal();
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		
		EmployeeVO employee = wrapper.getRealUser();
		empCd = employee.getEmpCd();
		empName = employee.getEmpName();
		
		userInfo.put("empCd", empCd);
		userInfo.put("empName", empName);
		
		return userInfo;
	}
}
