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
@RequestMapping("chatRoomDetail")
public class ChatRecordController {
	private final ChatRoomService service;
	private final EmployeeService employeeService;
	private final ChatRoomUserService userService;
	private final ChatRecordService recordService;
	private final ChatReadService readService;
	
	@RequestMapping("selectChatRoomDetail.do")
	public String selectChatRoomDetail(
			Model model
			, @RequestParam(name = "roomNo", required = true) int roomNo
			, @RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			, Authentication authentication
			) {
		String roomName = service.getRoomName(roomNo);
		int cntEmp = userService.countEmp(roomNo);
		List<ChatUserVO> chatUserList = userService.getEmpcds(roomNo);
		
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO employee= wrapper.getRealUser();
		String empCd = employee.getEmpCd();
		
		PaginationInfo<EmployeeVO> paging = new PaginationInfo<>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		List<EmployeeVO> empList = employeeService.empListNotPaging(paging);
		paging.setDataList(empList);
		
		List<EmployeeVO> empInfo = new ArrayList<EmployeeVO>();
		
		List<ChatRecordVO> chatList = recordService.getChatRecord(roomNo);
		
		for(int i= 0; i < chatUserList.size(); i++) {
			chatUserList.get(i).getEmpCd();
			 EmployeeVO empDetail = employeeService.retrieveEmpDetail(chatUserList.get(i).getEmpCd());
			 empInfo.add(empDetail);
		}
		
		ChatReadVO chatRead = new ChatReadVO();
		chatRead.setRecoreEmp(empCd);
		chatRead.setRecoreRoomno(roomNo);
		
		readService.changeRead(chatRead);
		
		model.addAttribute("roomNo", roomNo);
		model.addAttribute("empList", empList);
		model.addAttribute("roomName", roomName);
		model.addAttribute("cntEmp", cntEmp);
		model.addAttribute("empList", empList);
		model.addAttribute("chatUserList", chatUserList);
		model.addAttribute("empInfo", empInfo);
		model.addAttribute("empCd", empCd);
		model.addAttribute("chatList", chatList);
		
		return "chat/temp/testChatRoomRecord";
	}
}
