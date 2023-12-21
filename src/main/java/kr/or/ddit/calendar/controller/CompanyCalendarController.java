package kr.or.ddit.calendar.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.calendar.service.CompanyService;
import kr.or.ddit.calendar.vo.CompanyVO;
import kr.or.ddit.validate.groups.DeleteGroup;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import lombok.RequiredArgsConstructor;

/**
 * @author PC-13
 * 회사일정 조회
 */
@RequiredArgsConstructor
@Controller
public class CompanyCalendarController {
	private final CompanyService service;
	
	@GetMapping("/calendar/companycalendar")
	public String view(Model model){
		
		return "calendar/companycalendar";
	}
	
	
	@PostMapping(value ="/calendar/companycalendar" , produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<CompanyVO> list(Model model, Authentication auth){ // 검증과정
		
		CompanyVO compnayVO = new CompanyVO();
		
		
		List<CompanyVO> companyList = service.retrievecomList(compnayVO);
		
		List<Map<String, String>> mapList = new ArrayList<Map<String,String>>();
		Map<String, String> map = new HashMap<String, String>();
		map.put("title", "회의");
		map.put("start", "2023-08-03");
		map.put("end", "2023-08-04");
		
		mapList.add(map);
		
		return companyList;
	}
	
	/**
	 * 회사일정 등록
	 * @param comSCNO
	 * @param model
	 * @return
	 */
	@RequestMapping("/calendar/companyInsert.do")
	public String companyInsert(
			 @ModelAttribute("newevent")@Validated(InsertGroup.class) CompanyVO company // 새로운 이벤트를 만드는곳
				,Errors errors //검증과정
				,Authentication auth //검증과정
				,Model model //검증과정
			) {
		String viewName = "jsonView";
		if(!errors.hasErrors()) { // 검증과정
			boolean success =service.createCompany(company);
			model.addAttribute("success",success);
			if(success) { //등록성공시
				model.addAttribute("message","등록성공");
			}else { // 실패메시지
				model.addAttribute("message","등록실패");
			}
		}else { // 검증실패시
			model.addAttribute("success", false );
			model.addAttribute("message","검증에 실패했습니다.");
		}
		return viewName;
	}
	
	/**
	 * 회사일정 수정
	 * @param comSCNO
	 * @param model
	 * @return
	 */
	@RequestMapping("/calendar/companyUpdate.do")
	public String companyUpdateProc(
			@ModelAttribute("calendar")@Validated(UpdateGroup.class) CompanyVO company
			,Errors errors
			,Model model
			) {
		String viewName = "jsonView";
		if(!errors.hasErrors()) { // 검증과정
			boolean success =service.updateCompany(company);
			model.addAttribute("success",success);
			model.addAttribute("personal", company);
			if(success) { // 등록 성공시
				model.addAttribute("message","업데이트 성공");
			}else { // 실패 메시지
				model.addAttribute("message","업데이트 실패");
			}
		}else { // 검증 실패시
			model.addAttribute("success", false );
			model.addAttribute("message","검증에 실패했습니다.");
		}
		return viewName;
	}
	
	/**
	 * 개인일정 삭제
	 * @return
	 */
	@RequestMapping("/calendar/companyDelete.do")
	public String companyDelete(
			@ModelAttribute("calendar")@Validated(DeleteGroup.class) CompanyVO company
			,Errors errors
			,Model model
			) {
		String viewName = "jsonView";
		if(!errors.hasErrors()) { // 검증과정
			boolean success = service.removeCompany(company);
			model.addAttribute("success", success);
			model.addAttribute("company", company);
			if(success) { // 업데이트 성공시
				model.addAttribute("message", "삭제 성공");
			}else { // 실패 메시지
				model.addAttribute("messge", "삭제 실패");
			}
		}else { // 검증 실패시
			model.addAttribute("success", false);
			model.addAttribute("message", "검증에 실패했습니다.");
		}
		
		return viewName;
	}
	
	
}