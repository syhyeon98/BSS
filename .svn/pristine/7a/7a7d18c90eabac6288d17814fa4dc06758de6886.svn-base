package kr.or.ddit.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorPageController {
	
	@RequestMapping("/error/error403.do")
	public String move403ErrorPage()  {
		
		// 브라우저 메인 타이틀 출력여부 적용
		return "error/403";
	}
	
	@RequestMapping("/error/error500.do")
	public String move500ErrorPage()  {
		
		// 브라우저 메인 타이틀 출력여부 적용
		return "error/500";
	}
	
}
