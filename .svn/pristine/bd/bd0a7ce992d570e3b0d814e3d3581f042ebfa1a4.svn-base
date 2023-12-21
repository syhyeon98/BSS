package kr.or.ddit.messenger.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import kr.or.ddit.mail.vo.MailBoxVO;
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
@RequestMapping("chatRoom")
public class ChatRoomController {
	private final ChatRoomService service;
	private final ChatRoomUserService userService;
	private final ChatRecordService recordService;
	private final ChatReadService readService;
	
	@GetMapping("chatRoom.do")
	public String chatRoomList(
			Model model
			, Authentication authentication
			, @RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			) {
		PaginationInfo<MailBoxVO> paging = new PaginationInfo<MailBoxVO>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO employee= wrapper.getRealUser();
		String empCd = employee.getEmpCd();
		
		String empName = employee.getEmpName();
		
		ChatRoomVO chatRoom = new ChatRoomVO();
		chatRoom.setEmpCd(empCd);
		
		List<ChatRoomVO> chatRoomList = service.retrieveChatRoomList(empCd);
		List<ChatRecordVO> lastChatList = new ArrayList<>();
		List<ChatReadVO> chatReadList = new ArrayList<>();
		
		for(int i=0; i < chatRoomList.size(); i++) {
			ChatReadVO chatRead = new ChatReadVO();
			int roomNo = chatRoomList.get(i).getRoomNo();
			String roomName = service.getRoomName(roomNo);
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
		
		model.addAttribute("chatRoomList", chatRoomList);
		model.addAttribute("empName", empName);
		model.addAttribute("chatRoom", new ChatRoomVO());
		model.addAttribute("paging", paging);
		model.addAttribute("lastChatList", lastChatList);
		model.addAttribute("chatReadList", chatReadList);
		
		return "chat/temp/testChatRoomList";
	}
	
	@PostMapping("chatRoom.do")
	public String chatRoomCreate(
			@ModelAttribute("chatRoom") ChatRoomVO chatRoom
	        , Model model
	        , Authentication authentication
			, @RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
	) {
		PaginationInfo<MailBoxVO> paging = new PaginationInfo<MailBoxVO>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO employee= wrapper.getRealUser();
		String empCd = employee.getEmpCd();
		chatRoom.setEmpCd(empCd);
		String empName = employee.getEmpName();
		chatRoom.setEmpName(empName);
		
		model.addAttribute("empName", empName);
		model.addAttribute("paging", paging);
		
		String logicalViewName = null;
		
	        service.createChatRoom(chatRoom);
	        userService.insertOne(chatRoom);
	        
	        List<ChatRoomVO> chatRoomList = service.retrieveChatRoomList(empCd);
	        List<ChatRecordVO> lastChatList = new ArrayList<>();
	        
			for(int i=0; i < chatRoomList.size(); i++) {
				int roomNo = chatRoomList.get(i).getRoomNo();
				String roomName = service.getRoomName(roomNo);
				String lastChat = recordService.getLastChat(roomNo);
				ChatRecordVO lastChatRecord = new ChatRecordVO();
				
				lastChatRecord.setRoomNo(roomNo);
				lastChatRecord.setLastChat(lastChat);
				lastChatList.add(lastChatRecord);
				
				int cntEmp = userService.countEmp(roomNo);
				chatRoomList.get(i).setCntEmp(cntEmp);
				chatRoomList.get(i).setRoomName(roomName);
			}
			model.addAttribute("chatRoomList", chatRoomList);
			model.addAttribute("lastChatList", lastChatList);
	        
	        logicalViewName = "chat/temp/testChatRoomList";
	    
	    return logicalViewName;
	}
	
	@RequestMapping("chatRoomInviteEmp.do")
	public String chatRoomInviteEmp(
			Model model
			, @RequestParam("empCds") String empCds
			, Authentication authentication
			) {
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO employee= wrapper.getRealUser();
		String empCd = employee.getEmpCd();
		String empName = employee.getEmpName();
		
		String[] empCdArray = empCds.split(",");
		ChatRoomVO chatRoom = new ChatRoomVO();
		
		for(String empListCd : empCdArray) {
			chatRoom.setEmpCd(empListCd);
			//service.createChatRoom(chatRoom);
		}
		
		PaginationInfo<MailBoxVO> paging = new PaginationInfo<MailBoxVO>();
		
		chatRoom.setEmpCd(empCd);
		chatRoom.setEmpName(empName);
		
		model.addAttribute("empName", empName);
		model.addAttribute("paging", paging);
		
		String logicalViewName = null;
		
	        service.createChatRoom(chatRoom);
	        userService.insertOne(chatRoom);
	        
	        List<ChatRoomVO> chatRoomList = service.retrieveChatRoomList(empCd);
	        List<ChatRecordVO> lastChatList = new ArrayList<>();
	        
			for(int i=0; i < chatRoomList.size(); i++) {
				int roomNo = chatRoomList.get(i).getRoomNo();
				String roomName = service.getRoomName(roomNo);
				String lastChat = recordService.getLastChat(roomNo);
				ChatRecordVO lastChatRecord = new ChatRecordVO();
				
				lastChatRecord.setRoomNo(roomNo);
				lastChatRecord.setLastChat(lastChat);
				lastChatList.add(lastChatRecord);
				
				int cntEmp = userService.countEmp(roomNo);
				chatRoomList.get(i).setCntEmp(cntEmp);
				chatRoomList.get(i).setRoomName(roomName);
			}
			model.addAttribute("chatRoomList", chatRoomList);
			model.addAttribute("lastChatList", lastChatList);
		
		model.addAttribute("chatRoomList", chatRoomList);
		model.addAttribute("empName", empName);
		
		return "chat/temp/chatRoomList";
	}
	
	@RequestMapping("chatRoomOut.do")
	public void chatRoomOut(
			Model model
			, HttpServletResponse response
			, @RequestParam("roomNo") int roomNo
			, Authentication authentication
			) throws IOException {
		boolean outRoom = true;
		
		ChatUserVO chatUser = new ChatUserVO();
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO employee= wrapper.getRealUser();
		String empCd = employee.getEmpCd();
		
		chatUser.setEmpCd(empCd);
		chatUser.setRoomNo(roomNo);
		
		outRoom = service.outRoom(chatUser);
		
		if(outRoom == true) {
	        String closeScript = "<script>window.close();</script>";
	        response.setContentType("text/html; charset=UTF-8");
	        response.getWriter().print(closeScript);
		}else {

		}
	}
}
