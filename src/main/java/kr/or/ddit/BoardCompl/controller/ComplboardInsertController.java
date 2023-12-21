package kr.or.ddit.BoardCompl.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.BoardCompl.dao.OthersDAO;
import kr.or.ddit.BoardCompl.service.ComplboardSerivce;
import kr.or.ddit.BoardCompl.vo.ComplboardVO;
import kr.or.ddit.BoardCompl.vo.DepVO;
import kr.or.ddit.BoardCompl.vo.EmpVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.validate.groups.InsertGroup;

/**
 * @author PC-26 칭찬합니다 등록
 */
@Controller
@RequestMapping("/board/complInsert")
public class ComplboardInsertController {

	@Inject
	private ComplboardSerivce service;
	@Autowired
	private OthersDAO othersDAO;

	@ModelAttribute("empList")
	public List<EmpVO> empList() {
		return othersDAO.selectEmpList();
	}

	@ModelAttribute("depList")
	public List<DepVO> depList() {
		return othersDAO.selectDepList();
	}

	@ModelAttribute("compl")
	public ComplboardVO compl() {
		return new ComplboardVO();
	}

	@GetMapping
	public String getHandler() {
		return "board/complForm";
	}

	@PostMapping
	public String postHandler(@ModelAttribute("compl") ComplboardVO compl // 공통객체?
			, Errors errors, Model model, Authentication authentication) {
		String viewName = null;
		EmployeeVOWrapper principal = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO realUser = principal.getRealUser();
		compl.setEmpCd(realUser.getEmpCd());

		if (!errors.hasErrors()) {
			boolean success = service.createCompl(compl);
			if (success) {
				viewName = "redirect:/board/complAllList";
			} else {
				model.addAttribute("message", "등록 중 문제 발생");
				viewName = "redirect:/board/compleForm";
			}
		} else {
			viewName = "redirect:/board/complAllList";
		}
		return viewName;
	}
}
