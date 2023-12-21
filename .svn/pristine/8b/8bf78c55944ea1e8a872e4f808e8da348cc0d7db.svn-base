package kr.or.ddit.BoardReq.controller;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.BoardCompl.vo.ComplboardVO;
import kr.or.ddit.BoardReq.service.ReqboardSerivce;
import kr.or.ddit.BoardReq.vo.ReqboardVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import kr.or.ddit.training.vo.TrainingVO;

/**
 * @author PC-26 공지사항 등록
 */
@Controller
@RequestMapping("/board/reqInsert")
public class reqboardInsertController {

	@Inject
	private ReqboardSerivce service;

	@ModelAttribute("req")
	public ReqboardVO req() {
		return new ReqboardVO();
	}

	@GetMapping
	public String reqForm() {
		return "board/reqForm";
	}

	@PostMapping
	public String reqInsert(@ModelAttribute("req") ReqboardVO req, Errors errors, Model model,
			Authentication authentication) {

		String viewName = null;
		EmployeeVOWrapper principal = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO realUser = principal.getRealUser();
		req.setEmpCd(realUser.getEmpCd());
		if (!errors.hasErrors()) {
			boolean success = service.createReq(req);
			if (success) {
				viewName = "redirect:/board/reqAllList";
			} else {
				model.addAttribute("message", "등록 중 문제 발생");
				viewName = "board/reqForm";
			}
		}else {
			viewName = "redirect:/board/reqAllList";
		}
		return viewName;
	}
}