package kr.or.ddit.vocation.controller;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vocation.service.VocationService;
import kr.or.ddit.vocation.vo.VocationVO;
/**
 * 연가 등록
 * @author PC-27
 *
 */
@Controller
public class VocationInsertController {
	@Inject
	private VocationService service;
	
	@ModelAttribute("vocation")
	public VocationVO vocation() {
		return new VocationVO();
	}
	
	/**
	 * 연가 등록 처리
	 * @param vocation
	 * @param errors
	 * @param authentication
	 * @param model
	 * @return
	 */
	@RequestMapping("/pm/servicemanagement/vocationInsert.do")
	public String vocationInsert(
			@Validated(InsertGroup.class) @ModelAttribute("vocation") VocationVO vocation
			, Errors errors
			, Authentication authentication
			, Model model
	) {
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		String emp = wrapper.getRealUser().getEmpCd();
		vocation.setEmpCd(emp); //사원번호
		
		String viewName = null;
		
		boolean success = service.createVocation(vocation);
		if(success) { //성공하면
			viewName = "redirect:/pm/servicemanagement/vocation1";
		}else {
			model.addAttribute("message", "연가 등록 중 문제 발생");
			viewName = "jsonView"; //실패했을 때 메시지(데이터만, 화면 x)
		}
		return viewName; 
	}
	
	/**
	 * [마이페이지] 연가 등록 처리
	 * @param vocation
	 * @param errors
	 * @param authentication
	 * @param model
	 * @return
	 */
	@PostMapping(value =  "/mypage/myVocationInsert.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String myVocationInsert(
			@Validated(InsertGroup.class) @ModelAttribute("vocation") VocationVO vocation
			, Errors errors
			, Authentication authentication
			, Model model
			) {
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		String emp = wrapper.getRealUser().getEmpCd();
		vocation.setEmpCd(emp); //사원번호
		
		String viewName = null;
		
		boolean success = service.createVocation(vocation);
		if(success) { //성공하면
			model.addAttribute("message"); // 성공 메시지 설정
		    viewName = "redirect:/mypage/myVocation";
		}else {
			 model.addAttribute("message", "연가 등록 중 문제 발생");
			    viewName = "jsonView"; // 실패했을 때 메시지(데이터만, 화면 x)
		}
		return viewName; 
	}
}
