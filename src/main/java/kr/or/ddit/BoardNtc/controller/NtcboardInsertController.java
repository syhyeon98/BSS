package kr.or.ddit.BoardNtc.controller;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.BoardNtc.service.NtcboardSerivce;
import kr.or.ddit.BoardNtc.vo.NtcboardVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;

/**
 * @author PC-26 공지사항 등록
 */
@Controller
@RequestMapping("/board/ntcInsert")
public class NtcboardInsertController {

	@Inject
	private NtcboardSerivce service;

	@ModelAttribute("ntc")
	public NtcboardVO ntc() {
		return new NtcboardVO();
	}

	/**
	 * 공지사항등록폼 제공
	 */
	@GetMapping
	public String ntcForm() {
		return "board/ntcForm";
	}

	@PostMapping
	public String ntcInsert(@ModelAttribute(name = "ntc") NtcboardVO ntc
			, Authentication authentication, Errors errors,
			Model model) {

		String viewName = null;
		EmployeeVOWrapper principal = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO realUser = principal.getRealUser();
		ntc.setEmpCd(realUser.getEmpCd());

		if (!errors.hasErrors()) {
			boolean success = service.createNtc(ntc);
			if (success) {
				viewName = "redirect:/board/ntcAllList";
			} else {
				model.addAttribute("message", "등록 중 문제 발생");
				viewName = "board/ntcForm";

			}
		} else {
			viewName = "board/ntcForm";
		}
		return viewName;
	}
}
