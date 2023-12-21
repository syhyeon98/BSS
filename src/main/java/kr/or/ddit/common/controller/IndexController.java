package kr.or.ddit.common.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.employee.dao.EmployeeDAO;
import kr.or.ddit.employee.service.EmployeeService;
import kr.or.ddit.employee.vo.EmployeeVO;

@Controller
public class IndexController {
	
	@Inject
	private EmployeeDAO empDAO;
	@Inject
	private EmployeeService empService;
	
	@RequestMapping("/index.do")
	public String index() {
		return "login/loginForm";
	}

	@PostMapping("/admin")
	public String admin(
			@RequestParam(name = "who")String empCd
			, Model model
			) {
		EmployeeVO admin = empService.retrieveEmpDetail(empCd);
		model.addAttribute("admin", admin);
		return "admin/admin";
	}
}
