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
@RequestMapping("/mailTemp/")
public class MailBoxTempController {
	private final MailBoxService service;
	
	/**
	 * 임시보관함 등록
	 * @return
	 */
	@RequestMapping("tempMail.do")
	public String tempMail(
			Model model
			, Principal principal
			, @ModelAttribute("mail") MailBoxVO mail
			, @RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			) {
		PaginationInfo<MailBoxVO> paging = new PaginationInfo<>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		String empCd = principal.getName();
		
		String logicalViewName = null;
		boolean result = true;
		

		result = service.temporaryMail(mail, empCd);
			
			if(result == true) {
				List<MailBoxVO> tempMailList = service.tempMailList(empCd, paging);
				model.addAttribute("tempMailList", tempMailList);
				logicalViewName = "mail/temp/testTempList";
			}else {
				model.addAttribute("message", "서버 오류, 잠시 뒤 다시 시도하시오.");
				logicalViewName = "mail/send/sendForm";
			}

		return logicalViewName;
	}
	
	/**
	 * 메일 임시보관함 리스트
	 * @param model
	 * @param principal
	 * @return
	 */
	@RequestMapping("tempList.do")
	public String tempList(Model model , Authentication authentication
			, @RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			) {
		PaginationInfo<MailBoxVO> paging = new PaginationInfo<>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		String empMail = wrapper.getRealUser().getEmpMail();
		List<MailBoxVO> tempMailList = service.tempMailList(empMail, paging);
		paging.setDataList(tempMailList);
		
		model.addAttribute("paging", paging);
		
		return "mail/temp/testTempList";
	}
	
	@GetMapping("tempView.do")
	public String tempView(
	        @RequestParam(name = "mailNo", required = true) String mailNo,
	        Model model,
	        Authentication authentication
	) {
	    MailBoxVO mail = service.retriveMailDetail(mailNo);
	    
	    EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
	    String empMail = wrapper.getRealUser().getEmpMail();
	    
	    model.addAttribute("mail", mail);
	    model.addAttribute("empMail", empMail); // 추가: 발신자의 이메일 주소 추가
	    
	    return "mail/send/sendForm";
	}
	
	/**
	 * 임시저장 메일 전송
	 * @param mail
	 * @param mailNo
	 * @param errors
	 * @param model
	 * @param authentication
	 * @return
	 */
	@PostMapping("tempView.do")
	public String tempMailSend(
			@ModelAttribute("mail") MailBoxVO mail
			, @RequestParam(name = "mailNo", required = true) String mailNo
			, @RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			, Errors errors
			, Model model
			, Authentication authentication) {
		String logicalViewName = null;
		boolean result = true;
		String empCd = authentication.getName();
		
		PaginationInfo<MailBoxVO> paging = new PaginationInfo<>();
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		List<MailBoxVO> sendMailList = service.retriveSendMailList(empCd, paging);
		paging.setDataList(sendMailList);
		
		model.addAttribute("paging", paging);

		if (!errors.hasErrors()) {
			service.deleteTempMail(mailNo);
			result = service.sendMail(mail, empCd);

			if (result == true) {
				
				logicalViewName = "redirect:/mailBox/sendList.do";
			} else {
				model.addAttribute("message", "잘못된 이메일 입니다");
				logicalViewName = "mail/send/sendForm";
			}
		} else {
			logicalViewName = "mail/send/sendForm";
		}

		return logicalViewName;
	}
}
               