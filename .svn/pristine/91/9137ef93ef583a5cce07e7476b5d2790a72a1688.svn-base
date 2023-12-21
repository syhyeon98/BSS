package kr.or.ddit.mail.controller;

import java.security.Principal;
import java.util.List;


import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import kr.or.ddit.mail.service.MailBoxService;
import kr.or.ddit.mail.vo.MailBoxVO;
import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.pagingVO.SimpleCondition;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/mail/")
public class MailBoxRetriveController {
	private final MailBoxService service;

	/**
	 * 메일함 첫화면
	 * @return
	 */
	@RequestMapping("allMail.do")
	public String allMailList(Model model, Principal principal,
			@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage,
			@ModelAttribute("simpleCondition") SimpleCondition simpleCondition) {
		PaginationInfo<MailBoxVO> paging = new PaginationInfo<MailBoxVO>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);

		String empId = principal.getName();

		String logicalViewName = service.recieveMailList(empId);
		List<MailBoxVO> allMailList = service.allMail(empId, paging);
		
		paging.setDataList(allMailList);
		model.addAttribute("paging", paging);

		return logicalViewName;
	}
	
	/**
	 * 메일함 상세조회
	 * @return
	 */
	@RequestMapping("allMailView.do")
	public String sendView(@RequestParam(name = "mailNo", required = true) String mailNo, Model model) {
		MailBoxVO mail = service.retriveMailDetail(mailNo);

		model.addAttribute("mail", mail);

		return "mail/allMail/mailDetail";
	}

	
	@GetMapping("replyMail.do")
	public String mailReplyForm(Model model, Authentication authentication,
			@RequestParam(name = "mailNo", required = true) String mailNo) {
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		String empMail = wrapper.getRealUser().getEmpMail();
		MailBoxVO mailReply = service.retriveMailDetail(mailNo);
		String mailReplyAdd = mailReply.getReceiveMailSender();
		
		model.addAttribute("empMail", empMail);
		model.addAttribute("mailReplyAdd", mailReplyAdd);

		model.addAttribute("mail", new MailBoxVO());
		return "mail/send/sendForm";
	}

	@PostMapping("replyMail.do")
	public String mailReply(@ModelAttribute("mail") MailBoxVO mail
			, Errors errors
			, Model model
			, @RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			,Authentication authentication) {
		String logicalViewName = null;
		boolean result = true;
		String empCd = authentication.getName();
		
		PaginationInfo<MailBoxVO> paging = new PaginationInfo<>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);

		if (!errors.hasErrors()) {
			result = service.sendMail(mail, empCd);

			if (result == true) {
				List<MailBoxVO> sendMailList = service.retriveSendMailList(empCd, paging);
				paging.setDataList(sendMailList);
				
				model.addAttribute("paging", paging);
				
				logicalViewName = "redirect:/mailBox/sendList.do";
			} else {
				model.addAttribute("message", "잘못된 이메일 입니다");
				logicalViewName = "mail/send/sendForm";
			}
		} else {
			model.addAttribute("message", "고장");
			logicalViewName = "mail/send/sendForm";
		}

		return logicalViewName;
	}
	
	/**
	 * 메일쓰기 폼
	 * @return
	 */
	@GetMapping("sendMail.do")
	public String sendMailForm(Model model, Authentication authentication
			) {
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		String empMail = wrapper.getRealUser().getEmpMail();
		
		model.addAttribute("empMail", empMail);

		model.addAttribute("mail", new MailBoxVO());
		return "mail/send/sendForm";
	}
	
	@PostMapping("sendMail.do")
	public String sendMail(@ModelAttribute("mail") MailBoxVO mail
			, Errors errors
			, Model model
			, @RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			,Authentication authentication) {
		String logicalViewName = null;
		boolean result = true;
		String empCd = authentication.getName();
		
		PaginationInfo<MailBoxVO> paging = new PaginationInfo<>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);

		if (!errors.hasErrors()) {
			result = service.sendMail(mail, empCd);

			if (result == true) {
				List<MailBoxVO> sendMailList = service.retriveSendMailList(empCd, paging);
				paging.setDataList(sendMailList);
				
				model.addAttribute("paging", paging);
				
				logicalViewName = "redirect:/mailBox/sendList.do";
			} else {
				model.addAttribute("message", "잘못된 이메일 입니다");
				logicalViewName = "mail/send/sendForm";
			}
		} else {
			model.addAttribute("message", "고장");
			logicalViewName = "mail/send/sendForm";
		}

		return logicalViewName;
	}
}
