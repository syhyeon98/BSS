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

import kr.or.ddit.calendar.service.PersonalService;
import kr.or.ddit.calendar.vo.PersonalVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;
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
public class PersonalCalendarController {
	private final PersonalService service;
	private PersonalVO PersonalVO;
	
	@GetMapping("/calendar/personalcalendar")
	public String view(Model model){
		
		return "calendar/personalcalendar";
	}
	
	
	@PostMapping(value ="/calendar/personalcalendar" , produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<PersonalVO> list(Model model, Authentication auth){ //검증과정
			
		PersonalVO personalVO = new PersonalVO();  // personalVO를 쓰기 위해 만들어줌.
		
		EmployeeVOWrapper wrapper= (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emp = wrapper.getRealUser();
		@SuppressWarnings("unused")
		String perTarget = emp.getEmpCd();
		personalVO.setEmpCd(emp.getEmpCd()) ;
		
		
		List<PersonalVO> personalList = service.retrieveperList(personalVO);
		
		for(PersonalVO personal:personalList) {
			if(personal.getPerTarget()!= null && personal.getPerTarget().equals("Y")) {  			//  공통일정 여부 체크
				personal.setColor("red");  															//  빨간색으로 공통일정 지정
				
			}else if(personal.getPerTarget()!= null && personal.getPerTarget().equals("T")) {		//  출장일정 여부 체크
				personal.setColor("yellow");														//  노랑색으로 출장일정 지정
				
			}else if(personal.getPerTarget()!= null && personal.getPerTarget().equals("E")) {		//  교육일정 여부 체크
				personal.setColor("purple");														//  보라색으로 교육일정 지정	
				
			}else if(personal.getPerTarget()!= null && personal.getPerTarget().equals("V")) {		//  휴가일정 여부 체크
				personal.setColor("black");															//  검정색으로 휴가일정 지정
			}
			
		}
		
		List<Map<String, String>> mapList = new ArrayList<Map<String,String>>();
		Map<String, String> map = new HashMap<String, String>();
		map.put("title", "회의");
		map.put("start", "2023-08-03");
		map.put("end", "2023-08-04");
		
		mapList.add(map);
		
		return personalList;
	}
	
	/**
	 * 회사일정 등록
	 * @param pSCNO
	 * @param model
	 * @return
	 */
	@RequestMapping("/calendar/personalInsert.do")
	public String personalInsert(
			@ModelAttribute("newevent")@Validated(InsertGroup.class) PersonalVO personal // 새로운 이벤트를 만드는곳
			,Errors errors //검증과정
			,Authentication auth //검증과정
			,Model model //검증과정
			) {
		EmployeeVOWrapper wrapper= (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO emp = wrapper.getRealUser();
		@SuppressWarnings("unused")  		// 컴파일 단위의 서브세트와 관련된 컴파일 경고를 사용하지 않도록 설정함.
		String perTarget = emp.getEmpCd();  // 개인일정에서 공통일정 여부 확인
		personal.setEmpCd(emp.getEmpCd()) ;
		String viewName = "jsonView";  		// 뷰네임을 제이슨뷰로 받음 
		if(!errors.hasErrors()) { 			// 검증과정
			boolean success =service.createPersonal(personal);    // 성공시 사비스에서 개인일정만들기
			model.addAttribute("success",success);
			model.addAttribute("personal", personal);
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
	 * @param perSCNO
	 * @param model
	 * @return
	 */
	@RequestMapping("/calendar/personalUpdate.do")
	public String personalUpdateProc(
			@ModelAttribute("calendar")@Validated(UpdateGroup.class) PersonalVO personal
			,Errors errors
			,Model model
			) {
		String viewName = "jsonView";
		if(!errors.hasErrors()) { // 검증과정
			boolean success =service.updatePersonal(personal);
			model.addAttribute("success",success);
			model.addAttribute("personal", personal);
			if(success) { // 업데이트 성공시
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
	 * @param 
	 * @return
	 */
	@RequestMapping("/calendar/personalDelete.do")
	public String personalDelete(
			@ModelAttribute("calendar")@Validated(DeleteGroup.class) PersonalVO personal
			,Errors errors
			,Model model
			) {
		String viewName = "jsonView";
		if(!errors.hasErrors()) { // 검증과정
			boolean success = service.removePersonal(personal);
			model.addAttribute("success", success);
			model.addAttribute("personal", personal);
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