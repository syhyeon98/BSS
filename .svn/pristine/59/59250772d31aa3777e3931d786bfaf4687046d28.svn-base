package kr.or.ddit.employee.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PostMapping;

import kr.or.ddit.employee.service.EmployeeService;
import kr.or.ddit.employee.vo.EmployeeVO;

@Controller
public class EmpRoleUpdateController {

	@Inject
	private EmployeeService empService;
	
	@PostMapping("/empRoleUpdate")
	public String empRoleUpdate(
			EmployeeVO empCd
			, Errors errors
			, Model model
		) {
		String viewName = null;
		if(!errors.hasErrors()) {
			boolean success = empService.roleModify(empCd);
			if(success) {
				viewName = "redirect:/main.do";
			}else {
				model.addAttribute("message", "수정 중 문제 발생");
				viewName = "redirect:/main.do";
			}
		}
		return viewName;
	}
}
