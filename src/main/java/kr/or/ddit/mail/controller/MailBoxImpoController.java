package kr.or.ddit.mail.controller;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import kr.or.ddit.mail.service.MailBoxService;
import kr.or.ddit.mail.vo.MailBoxVO;
import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.pagingVO.SimpleCondition;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/mailImpo/")
public class MailBoxImpoController {
	private final MailBoxService service;
	
	/**
	 * 중요메일 설정
	 */
	@PostMapping("impoSet.do")
	@ResponseBody
	public String impoSet(@RequestParam(name = "mailNo", required = true) int mailNo,
			Authentication authentication
			, Model model) {
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO employee = wrapper.getRealUser();
		MailBoxVO mailBox = new MailBoxVO();
		
		mailBox.setReceiveMailNo(mailNo);
		mailBox.setLoginEmpCd(employee.getEmpCd());
		service.impoMail(mailBox);
		
		return "success";
	}
	
	/**
	 * 중요메일함
	 * @return
	 */
	@RequestMapping("impoList.do")
	public String impoList(Model model, Authentication authentication
			, @RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			) {
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		PaginationInfo<MailBoxVO> paging = new PaginationInfo<>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		String empMail = wrapper.getRealUser().getEmpMail();
		model.addAttribute("empMail", empMail);
		
		List<MailBoxVO> impoList = service.impoMailList(empMail, paging);
		paging.setDataList(impoList);
		
		model.addAttribute("paging", paging);
		
		return "mail/impo/testImpoList";
	}
	
	/**
	 * 중요메일 상세조회
	 * @return
	 */
	@RequestMapping("impoView.do")
	public String impoView(@RequestParam(name = "mailNo", required = true) String mailNo, Model model) {
		MailBoxVO mail = service.retriveMailDetail(mailNo);
		model.addAttribute("mail", mail);
		
		return "mail/allMail/mailDetail";
	}
}
