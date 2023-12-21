package kr.or.ddit.login.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.employee.vo.EmployeeVOWrapper;

@Controller
public class LoginController {
	
	@RequestMapping("/main.do")
	public String loginHandler(Authentication authentication) {
//		
//		String viewName = null;
//		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
//		String admin = wrapper.getRealUser().getEmpRole();
//		
//		if(admin.equals("ROLE_ADMIN")) {
//			viewName ="admin/admin";
//		}else {
//			viewName= "main/main3";
//		}
//		
//		return viewName;
		return "main/main3";
	}
	
}