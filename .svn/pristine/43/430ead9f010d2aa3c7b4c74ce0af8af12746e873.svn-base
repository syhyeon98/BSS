package kr.or.ddit.handler;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		
		EmployeeVOWrapper principal=(EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO realUser = principal.getRealUser();
		log.info(" {} 로그인 한 이후에 동작하는 핸들러",realUser.getEmpCd());
		
		super.setDefaultTargetUrl("/main.do");
		super.onAuthenticationSuccess(request, response, authentication);
	}
	
}
