package kr.or.ddit.attendance.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.attendance.service.AttendanceService;
import kr.or.ddit.attendance.vo.AttendanceVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;


@Controller
public class AttendanceUpdateController {
	@Inject
	private AttendanceService service;
	
	/**
	 * 체크박스 선택해서 모달에 나오는 데이터 처리
	 * @param atteNo
	 * @param model
	 * @return
	 */
	@GetMapping("/pm/servicemanagement/attendUpdate.do")
	public String selectOneAttend(int atteNo, Model model) {
		AttendanceVO attendVO = service.retrieveOneAttend(atteNo);
		model.addAttribute("attendVO", attendVO);
		return "pm/servicemanagement/ajax/attendUpdateForm";
	}
	
	
	/**
	 * 퇴근시간 등록(update)모달
	 * @param attendVO
	 * @param errors
	 * @param model
	 * @return
	 */
	@PostMapping("/pm/servicemanagement/attendEnd.do")
	public String attendEnd(
			 @Validated(UpdateGroup.class) @ModelAttribute("attend") AttendanceVO attend
			, Errors errors
			, Authentication authentication
			, Model model
	) {
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		String emp = wrapper.getRealUser().getEmpCd();
		attend.setEmpCd(emp); //사원번호
		
		LocalDate currentDate = LocalDate.now();
		attend.setAtteDate(currentDate); //출근일
		
		String viewName=null;
		AttendanceVO haveAtteEnd = service.retrieveHaveAtteEnd(attend);
		
		if(haveAtteEnd != null) { //퇴근시간이 있으면
			model.addAttribute("message", "이미 퇴근");
			
		} else {
			boolean success = service.UpdateAttendEnd(attend);
			if (success) {
				viewName = "redirect:/mypage/myAttend";
			} else {
				model.addAttribute("message", "출퇴근 수정 중 에러발생");
				viewName = "pm/servicemanagement/attend";
			}
		}
		return viewName;
	}
	
	/**
	 * 체크박스 선택 후 모달에서 [수정]버튼 눌렀을 때 수정 처리
	 * @param attend
	 * @param errors
	 * @param model
	 * @return
	 */
	@PostMapping("/pm/servicemanagement/attendUpdate.do")
	public String attendUpdate(
			@Validated(UpdateGroup.class) @ModelAttribute("attend") AttendanceVO attend
			, Errors errors
			, Model model
	) {
		
		String viewName=null;
		if(!errors.hasErrors()) {
			boolean success = service.modifyAttend(attend);
			if(success) {
				viewName = "redirect:/pm/servicemanagement/attend";
			}else {
				model.addAttribute("message", "출퇴근 수정 중 에러발생");
				viewName = "pm/servicemanagement/attend";
			}
		}else {
			viewName="redirect:/pm/servicemanagement/attend";
			model.addAttribute("message", "실패");
		}
		return viewName;
	}
	
	/**
	 * [마이페이지] 체크박스 선택해서 모달에 나오는 데이터 처리
	 * @param atteNo
	 * @param model
	 * @return
	 */
	@GetMapping("/mypage/mypageAttendUpdate.do")
	public String mypageSelectOneAttend(int atteNo, Model model) {
		AttendanceVO attendVO = service.retrieveOneAttend(atteNo);
		model.addAttribute("attendVO", attendVO);
		return "pm/servicemanagement/ajax/attendUpdateForm";
	}
	
	
	/**
	 * [마이페이지] 퇴근시간 등록(update)모달
	 * @param attendVO
	 * @param errors
	 * @param model
	 * @return
	 */
	@PostMapping("/mypage/mypageAttendEnd.do")
	public String mypageAttendEnd(
			 @Validated(UpdateGroup.class) @ModelAttribute("attend") AttendanceVO attend
			, Errors errors
			, Authentication authentication
			, Model model
	) {
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		String emp = wrapper.getRealUser().getEmpCd();
		attend.setEmpCd(emp); //사원번호
		
		LocalDate currentDate = LocalDate.now();
		attend.setAtteDate(currentDate); //출근일
		
		String viewName = null;
		AttendanceVO haveAtteEnd = service.retrieveHaveAtteEnd(attend);
		
		AttendanceVO haveToday = service.retrieveHaveAtteStime(attend);
		attend.setAtteNo(haveToday.getAtteNo());
		
		if (haveAtteEnd != null) { // 퇴근시간이 있으면
			
//			attend.setAtteNo(haveAtteEnd.getAtteNo());
			boolean success = service.UpdateAttendEnd(attend);
			model.addAttribute("success",success);
			viewName = "redirect:/mypage/myAttend";
		} else {
			boolean success = service.UpdateAttendEnd(attend);
			if (success) {
				viewName = "redirect:/mypage/myAttend";
			} else {
				model.addAttribute("message", "출퇴근 등록 중 에러발생");
				viewName = "mypage/myAttend";
			}
		}
		return viewName;
	}

	
	
	/**
	 * [마이페이지] 체크박스 선택 후 모달에서 [수정]버튼 눌렀을 때 수정 처리
	 * @param attend
	 * @param errors
	 * @param model
	 * @return
	 */
	@PostMapping("/mypage/mypageAttendUpdate.do")
	public String mypageAttendUpdate(
			@Validated(UpdateGroup.class) @ModelAttribute("attend") AttendanceVO attend
			, Errors errors
			, Model model
	) {
		
		String viewName=null;
		if(!errors.hasErrors()) {
			boolean success = service.modifyAttend(attend);
			if(success) {
				model.addAttribute("message");
				viewName = "redirect:/mypage/myAttend";
			}else {
				model.addAttribute("message", "출퇴근 수정 중 에러발생");
				viewName = "mypage/myAttend";
			}
		}else {
			viewName="redirect:/mypage/myAttend";
			model.addAttribute("message", "실패");
		}
		return viewName;
	}
	
	
}
