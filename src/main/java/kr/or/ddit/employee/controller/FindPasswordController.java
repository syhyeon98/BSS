package kr.or.ddit.employee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FindPasswordController {
	@RequestMapping("/findPass")
	public String findPassword() {
		return "login/findPassword";
	}
	
}
