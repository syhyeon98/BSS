package kr.or.ddit.mail.controller;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import kr.or.ddit.mail.service.MailBoxService;
import kr.or.ddit.mail.vo.MailBoxVO;
import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.pagingVO.SimpleCondition;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/mailDelete/")
public class MailBoxDeleteController {
	private final MailBoxService service;
	
	@RequestMapping("waste.do")
	public String waste(
	@RequestParam(name = "mailNo", required = true) String mailNo
	, Model model
	, Authentication authentication
	, @RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
	, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
	) {
		PaginationInfo<MailBoxVO> paging = new PaginationInfo<>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO employee = wrapper.getRealUser();
		MailBoxVO mailBox = new MailBoxVO();
		String empCd = employee.getEmpCd();
		
		mailBox.setLoginEmpCd(empCd);
		mailBox.setLoginEmpMail(employee.getEmpMail());
		
		mailBox.setReceiveMailNo(Integer.parseInt(mailNo));
		
		String logicalViewName = null;
		boolean result = true;
		result = service.deleteMail(mailBox);
		List<MailBoxVO> wasteList = service.wasteMailList(mailBox, paging);
		paging.setDataList(wasteList);
		
	    model.addAttribute("paging", paging);
		
		logicalViewName = "mail/waste/testWasteList";
		
		return logicalViewName;
	}
	
	@RequestMapping("wasteSelectMail.do")
	public String wasteSelectMail(
			@RequestParam("mailNos") String mailNos
			, Authentication authentication
			, Model model
			, @RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			) {
		PaginationInfo<MailBoxVO> paging = new PaginationInfo<>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO employee = wrapper.getRealUser();
		MailBoxVO mailBox = new MailBoxVO();
		String empCd = employee.getEmpCd();
		
		mailBox.setLoginEmpCd(empCd);
		mailBox.setLoginEmpMail(employee.getEmpMail());
		
		String[] mailNoArray = mailNos.split(",");
	    
	    for (String mailNo : mailNoArray) {
	    	mailBox.setReceiveMailNo(Integer.parseInt(mailNo));
	    	service.deleteMail(mailBox);
	    }
	    List<MailBoxVO> wasteList = service.wasteMailList(mailBox, paging);
	    paging.setDataList(wasteList);
	    
	    model.addAttribute("paging", paging);
		
		return "mail/waste/testWasteList";
	}
	
	@RequestMapping("wasteList.do")
	public String wasteList(
			Authentication authentication
			, Model model
			, @RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
		) {
		PaginationInfo<MailBoxVO> paging = new PaginationInfo<>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		String empCd = wrapper.getUsername();
		String empMail = wrapper.getRealUser().getEmpMail();
		model.addAttribute("empMail", empMail);
		MailBoxVO mailBox = new MailBoxVO();
		
		mailBox.setLoginEmpCd(empCd);
		mailBox.setLoginEmpMail(empMail);
		
		List<MailBoxVO> wasteList = service.wasteMailList(mailBox, paging);
		paging.setDataList(wasteList);
		
		model.addAttribute("paging", paging);
		
		return "mail/waste/testWasteList";
	}
	
	@RequestMapping("wasteView.do")
	public String wasteView(@RequestParam(name = "mailNo", required = true) String mailNo, Model model) {
		MailBoxVO mail = service.retriveMailDetail(mailNo);

		model.addAttribute("mail", mail);

		return "mail/waste/wasteDetail";
	}
	
	@RequestMapping("wasteMail.do")
	public String wasteMail(
			@RequestParam("mailNos") String mailNos
			, Authentication authentication
			, Model model
			, @RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			) {
		PaginationInfo<MailBoxVO> paging = new PaginationInfo<>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO employee = wrapper.getRealUser();
		MailBoxVO mailBox = new MailBoxVO();
		String empCd = employee.getEmpCd();
		
		mailBox.setLoginEmpCd(empCd);
		mailBox.setLoginEmpMail(employee.getEmpMail());
		
		String[] mailNoArray = mailNos.split(",");
	    
	    for (String mailNo : mailNoArray) {
	    	mailBox.setReceiveMailNo(Integer.parseInt(mailNo));
	        service.removeMail(mailBox);
	    }
	    List<MailBoxVO> wasteList = service.wasteMailList(mailBox, paging);
	    paging.setDataList(wasteList);
	    
	    model.addAttribute("paging", paging);
		
		return "mail/waste/testWasteList";
	}

	@RequestMapping("restoreMail.do")
	public String restoreMail(
			@RequestParam("mailNos") String mailNos
			, Authentication authentication
			, Model model
			, @RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			) {
		PaginationInfo<MailBoxVO> paging = new PaginationInfo<>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO employee = wrapper.getRealUser();
		MailBoxVO mailBox = new MailBoxVO();
		String empCd = employee.getEmpCd();
		
		mailBox.setLoginEmpCd(empCd);
		mailBox.setLoginEmpMail(employee.getEmpMail());
		
		String[] mailNoArray = mailNos.split(",");
		
		for (String mailNo : mailNoArray) {
			mailBox.setReceiveMailNo(Integer.parseInt(mailNo));
	        service.restoreMail(mailBox);
	    }
	    List<MailBoxVO> wasteList = service.wasteMailList(mailBox, paging);
	    paging.setDataList(wasteList);
	    
	    model.addAttribute("paging", paging);
		
		return "mail/waste/testWasteList";
	}
	
	@RequestMapping("wasteDeleteOne.do")
	public String wasteDeleteOne(
			@RequestParam("mailNo") String mailNo
			, Authentication authentication
			, Model model
			, @RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			) {
		PaginationInfo<MailBoxVO> paging = new PaginationInfo<>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO employee = wrapper.getRealUser();
		MailBoxVO mailBox = new MailBoxVO();
		String empCd = employee.getEmpCd();
		
		mailBox.setReceiveMailNo(Integer.parseInt(mailNo));
		mailBox.setLoginEmpCd(empCd);
		mailBox.setLoginEmpMail(employee.getEmpMail());
		
		service.removeMail(mailBox);
		
	    List<MailBoxVO> wasteList = service.wasteMailList(mailBox, paging);
	    paging.setDataList(wasteList);
	    
	    model.addAttribute("paging", paging);
		
		return "mail/waste/testWasteList";
	}
}
