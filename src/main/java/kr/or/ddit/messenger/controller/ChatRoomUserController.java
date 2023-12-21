package kr.or.ddit.messenger.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.employee.service.EmployeeService;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import kr.or.ddit.messenger.service.ChatReadService;
import kr.or.ddit.messenger.service.ChatRecordService;
import kr.or.ddit.messenger.service.ChatRoomService;
import kr.or.ddit.messenger.service.ChatRoomUserService;
import kr.or.ddit.messenger.vo.ChatReadVO;
import kr.or.ddit.messenger.vo.ChatRecordVO;
import kr.or.ddit.messenger.vo.ChatRoomVO;
import kr.or.ddit.messenger.vo.ChatUserVO;
import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.pagingVO.SimpleCondition;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/chatUser/")
public class ChatRoomUserController {
	private final EmployeeService employeeService;
	private final ChatRoomUserService chatRoomUserService;
	private final ChatRoomService chatRoomService;
	private final ChatRoomUserService userService;
	private final ChatRecordService recordService;
	private final ChatReadService readService;
	
	@RequestMapping("inviteEmpList.do")
	public String inviteEmpList(
			Model model
			, @RequestParam("empCds") String empCds
			, @RequestParam("roomNo") int roomNo
			, @RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			, Authentication authentication
			) {
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO employee= wrapper.getRealUser();
		String empCd = employee.getEmpCd(); // 로그인한사람
		
		PaginationInfo<EmployeeVO> paging = new PaginationInfo<>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		String roomName = chatRoomService.getRoomName(roomNo);
		String empName = employee.getEmpName();
		
		ChatRoomVO chatRoom = new ChatRoomVO();
		chatRoom.setEmpCd(empCd);
		 
		String[] empCdArray = empCds.split(",");
		ChatUserVO chatUser = new ChatUserVO();
		chatUser.setRoomNo(roomNo);
		
		List<ChatRoomVO> chatRoomList = chatRoomService.retrieveChatRoomList(empCd);
		List<ChatRecordVO> lastChatList = new ArrayList<>();
		List<ChatReadVO> chatReadList = new ArrayList<>();
		
		for(int i=0; i < chatRoomList.size(); i++) {
			int roomNos = chatRoomList.get(i).getRoomNo();
			String roomNames = chatRoomService.getRoomName(roomNos);
			int cntEmp = userService.countEmp(roomNos);
			if(chatRoomList.get(i).getRoomNo() == roomNo) {
				chatRoomList.get(i).setCntEmp(cntEmp+empCdArray.length);
			}else {
				chatRoomList.get(i).setCntEmp(cntEmp);
			}
			chatRoomList.get(i).setRoomName(roomNames);
		}
		
		for(int i=0; i < chatRoomList.size(); i++) {
			ChatReadVO chatRead = new ChatReadVO();
			roomNo = chatRoomList.get(i).getRoomNo();
			roomName = chatRoomService.getRoomName(roomNo);
			String lastChat = recordService.getLastChat(roomNo);
			ChatRecordVO lastChatRecord = new ChatRecordVO();
			chatRead.setRecoreEmp(empCd);
			chatRead.setRecoreRoomno(roomNo);
			chatReadList.add(chatRead);
			
			String readNo = readService.getNotReadNo(chatRead);
			chatRead.setNotReadChatNo(readNo);
			
			lastChatRecord.setRoomNo(roomNo);
			lastChatRecord.setLastChat(lastChat);
			lastChatList.add(lastChatRecord);
			
			int cntEmp = userService.countEmp(roomNo);
			chatRoomList.get(i).setCntEmp(cntEmp);
			chatRoomList.get(i).setRoomName(roomName);
		}

		for(String getEmpCd : empCdArray) {
			chatUser.setEmpCd(getEmpCd);
			
			if(userService.findEmpCd(chatUser) == true) {
				
			}else {
				chatRoomUserService.insertEmpCds(chatUser);
			}
		}
		
		List<EmployeeVO> empList = employeeService.empListNotPaging(paging);
		List<ChatUserVO> chatUserList = userService.getEmpcds(roomNo);
		
		List<EmployeeVO> empInfo = new ArrayList<EmployeeVO>();
		
		for(int i= 0; i < chatUserList.size(); i++) {
			chatUserList.get(i).getEmpCd();
			 EmployeeVO empDetail = employeeService.retrieveEmpDetail(chatUserList.get(i).getEmpCd());
			 empInfo.add(empDetail);
		}
		
		paging.setDataList(empList);
		
		model.addAttribute("empName", empName);
		model.addAttribute("roomName", roomName);
		model.addAttribute("empCd", empCd);
		model.addAttribute("empList", empList);
		model.addAttribute("chatUserList", chatUserList);
		model.addAttribute("chatRoomList", chatRoomList);
		model.addAttribute("empInfo", empInfo);
		model.addAttribute("lastChatList", lastChatList);
		model.addAttribute("chatReadList", chatReadList);
		
		return "chat/temp/testChatRoomList";
	}
}
