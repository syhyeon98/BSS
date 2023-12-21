package kr.or.ddit.attendance.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import kr.or.ddit.attendance.service.AttendanceService;
import kr.or.ddit.attendance.vo.AttendanceVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import kr.or.ddit.validate.groups.InsertGroup;

/**
 * 출틔근 등록
 * 
 */
@Controller
public class AttendanceInsertController {
	@Inject
	private AttendanceService service;
	
	@ModelAttribute("attend")
	public AttendanceVO attendVO() {
		return new AttendanceVO();
	}
	
	/**
	 * 출근 시간 등록
	 * @param attend
	 * @param authentication
	 * @param model
	 * @return
	 */
	@RequestMapping("/pm/servicemanagement/attendInsert.do")
	public String attendInsert(
			@Validated(InsertGroup.class) @ModelAttribute("attend") AttendanceVO attend
			, Errors errors
			, Authentication authentication
			, Model model
	) {
		
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		String emp = wrapper.getRealUser().getEmpCd();
		attend.setEmpCd(emp); //사원번호
		
		LocalDateTime currentTime = LocalDateTime.now();
		attend.setAtteStime(currentTime); //출근시간

		LocalDate currentDate = LocalDate.now();
		attend.setAtteDate(currentDate); //출근일
		
		String viewName = null;
		
		AttendanceVO haveAtteStime = service.retrieveHaveAtteStime(attend);

		if(haveAtteStime != null) { //출근시간이 있으면
			viewName = "pm/servicemanagement/attendEnd.do"; //업데이트 컨트롤러로
			
		}else { //출근시간이 없으면
			boolean success = service.createAttendStime(attend); //출근등록 
			if(success) { //성공하면 조회폼으로
				viewName = "redirect:/pm/servicemanagement/attend";
			} else { //성공이 아니면 다시 입력폼으로
				model.addAttribute("message", "출근부 작성 중 문제발생");
				viewName = "pm/servicemanagement/attend";
			}
		}
		return viewName;
	}
	
	
	/**
	 * [마이페이지] 출근 시간 등록
	 * @param attend
	 * @param authentication
	 * @param model
	 * @return
	 */
	@RequestMapping("/mypage/mypageAttendInsert.do")
	public String mypageAttendInsert(
			@Validated(InsertGroup.class) @ModelAttribute("attend") AttendanceVO attend
			, Errors errors
			, Authentication authentication
			, Model model
	) {
		
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		String emp = wrapper.getRealUser().getEmpCd();
		attend.setEmpCd(emp); //사원번호
		
		LocalDateTime currentTime = LocalDateTime.now();
		attend.setAtteStime(currentTime); //출근시간

		LocalDate currentDate = LocalDate.now();
		attend.setAtteDate(currentDate); //출근일
		
		String viewName = null;
		
		AttendanceVO haveAtteStime = service.retrieveHaveAtteStime(attend);

		if(haveAtteStime != null) { //출근시간이 있으면
			viewName = "mypage/mypageAttendEnd.do"; //업데이트 컨트롤러로
			
		}else { //출근시간이 없으면
			boolean success = service.createAttendStime(attend); //출근등록 
			if(success) { //성공하면 조회폼으로
				viewName = "redirect:/mypage/myAttend";
			} else { //성공이 아니면 다시 입력폼으로
				model.addAttribute("message", "출근부 작성 중 문제발생");
				viewName = "mypage/myAttend";
			}
		}
		return viewName;
	}
	
	
}
