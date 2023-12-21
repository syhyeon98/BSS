package kr.or.ddit.attendance.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

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
import kr.or.ddit.attendance.service.OverTimeService;
import kr.or.ddit.attendance.vo.AttendanceVO;
import kr.or.ddit.attendance.vo.OverTimeVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import kr.or.ddit.pagingVO.SimpleCondition;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;

@Controller
public class OverTimeController {
	
	@Inject
	private OverTimeService overService;

	@Inject
	private AttendanceService attendService;
	
	/**
	 * 체크박스 선택해서 모달에 나오는 데이터 처리
	 * @param atteNo
	 * @param model
	 * @return
	 */
	@GetMapping("/pm/servicemanagement/overTimeInsert.do")
	public String selectOneOverTime(int atteNo, Model model) {
		AttendanceVO attendVO = attendService.retrieveOneOverTime(atteNo);
		model.addAttribute("attendVO", attendVO);
		return "pm/servicemanagement/ajax/overTimeInsertForm";
	}
	
	/**
	 * [초과근무 수정] 체크박스 선택해서 모달에 나오는 데이터 처리
	 * @param atteNo
	 * @param model
	 * @return
	 */
	@GetMapping("/pm/servicemanagement/overTimeUpdate.do")
	public String updateOverTime(int atteNo, Model model) {
		AttendanceVO attendVO = attendService.retrieveOneOverTime(atteNo);
		model.addAttribute("attendVO", attendVO);
		return "pm/servicemanagement/ajax/overTimeUpdateForm";
	}
	
	/**
	 * 초과근무 전체조회(출퇴근 화면에서 보임)
	 * @param model
	 * @return
	 */
	@RequestMapping("/pm/servicemanagement/overTimeList.do")
	public String overTimeList(
		Model model	
	) {
		List<OverTimeVO> overTimeList = overService.retrieveOverList();
		model.addAttribute("overTimeList", overTimeList);
		
		return "pm/servicemanagement/overTime";
	}
	
	/**
	 * 초과근무 등록
	 * @param overTime
	 * @param errors
	 * @param authentication
	 * @param model
	 * @return
	 */
	@PostMapping("/pm/servicemanagement/overTimeInsert.do")
	public String overTimeInsert(
		@Validated(InsertGroup.class) @ModelAttribute("overTime") OverTimeVO overTime
		, Errors errors
		, Authentication authentication
		, Model model
	) {
		if (!errors.hasErrors()) {
			boolean success = overService.createOverTime(overTime);
			if (success) {
				return "redirect:/pm/servicemanagement/attend";
			} else {
				model.addAttribute("message", "출근부 작성 중 문제발생");
			}
		}
		return "pm/servicemanagement/attend";
	}
	
	/**
	 * 초과근무 기간 조회
	 * @param overTimeSearchForm
	 * @param model
	 * @return
	 */
	@RequestMapping("/pm/servicemanagement/overTimeSearch.do")
	public String overTimeSearch(
			@ModelAttribute("overTimeSearchForm") OverTimeVO overTimeSearchForm
			, Model model
	) {
				
		LocalDateTime overStart = overTimeSearchForm.getOverStart(); 
		LocalDateTime overEnd = overTimeSearchForm.getOverEnd();	 
		
		overTimeSearchForm.setOverStart(overStart);
		overTimeSearchForm.setOverEnd(overEnd);
		
		List<OverTimeVO> overTimeList = overService.overTimeSearch(overTimeSearchForm); //overTimeVO를 조회
		
		model.addAttribute("overTimeList", overTimeList );

		return "pm/servicemanagement/ajax/overTimeList";
	}
	
	/**
	 * 초과근무 수정
	 * @param overTime
	 * @param errors
	 * @param model
	 * @return
	 */
	@RequestMapping("/pm/servicemanagement/overTimeUpdate.do")
	public String overTimeUpdate(
			@Validated(UpdateGroup.class) @ModelAttribute("") OverTimeVO overTime
			, Errors errors
			, Model model
	) {
		String viewName=null;
		if(!errors.hasErrors()) {
			boolean success = overService.modifyOverTime(overTime);
			if(success) {
				viewName = "redirect:/pm/servicemanagement/attend";
			}else {
				model.addAttribute("message", "초과근무 수정 중 에러발생");
				viewName = "pm/servicemanagement/attend";
			}
		}else {
			viewName="redirect:/pm/servicemanagement/attend";
			model.addAttribute("message", "실패");
		}
		return viewName;
	}
	
	
	/**
	 * [마이페이지] 초과근무 기간 검색(출퇴근 화면에서 보임)
	 * @param model
	 * @return
	 */
	@RequestMapping("/mypage/overTimeList.do")
	public String mypageOverTimeList(
		@ModelAttribute("searchOverTime") OverTimeVO searchOverTime
		, Authentication authentication
		, Model model
	) {
		LocalDateTime overStart = searchOverTime.getOverStart(); 
		LocalDateTime overEnd = searchOverTime.getOverEnd();	 
		
		searchOverTime.setOverStart(overStart);
		searchOverTime.setOverEnd(overEnd);

		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		String empCd = wrapper.getRealUser().getEmpCd();
		
		searchOverTime.setEmpCd(empCd);
		
		List<OverTimeVO> overTimeList = overService.mypageSelectOverList(searchOverTime);
		model.addAttribute("overTimeList", overTimeList);
		
		return "mypage/ajax/myOverTimeList";
	}
	
	
	/**
	 * [마이페이지] 초과근무 등록 체크박스 선택해서 모달에 나오는 데이터 처리
	 * @param atteNo
	 * @param model
	 * @return
	 */
	@GetMapping("/mypage/overTimeInsert.do")
	public String mypageSelectOneOverTime(int atteNo, Model model) {
		AttendanceVO attendVO = attendService.retrieveOneOverTime(atteNo);
		model.addAttribute("attendVO", attendVO);
		return "mypage/ajax/myOverTimeInsertForm";
	}
	
	
	/**
	 * [마이페이지] 초과근무 등록
	 * @param overTime
	 * @param errors
	 * @param authentication
	 * @param model
	 * @return
	 */
	@PostMapping("/mypage/overTimeInsert.do")
	public String mypageOverTimeInsert(
		@Validated(InsertGroup.class) @ModelAttribute("overTime") OverTimeVO overTime
		, Errors errors
		, Authentication authentication
		, Model model
	) {
		if (!errors.hasErrors()) {
			boolean success = overService.createOverTime(overTime);
			if (success) {
				model.addAttribute("message");
				return "redirect:/mypage/myAttend";
			} else {
				model.addAttribute("message", "초과근무 작성 중 문제발생");
			}
		}
		return "mypage/myAttend";
	}
	
	
	/**
	 * [마이페이지] 초과근무 수정 체크박스 선택해서 모달에 나오는 데이터 처리
	 * @param atteNo
	 * @param model
	 * @return
	 */
	@GetMapping("/mypage/overTimeUpdate.do")
	public String mypageUpdateOverTime(int atteNo, Model model) {
		AttendanceVO attendVO = attendService.retrieveOneOverTime(atteNo);
		model.addAttribute("attendVO", attendVO);
		return "mypage/ajax/myOverTimeUpdateForm";
	}
	
	
	/**
	 * [마이페이지] 초과근무 수정
	 * @param overTime
	 * @param errors
	 * @param model
	 * @return
	 */
	@RequestMapping("/mypage/overTimeUpdate.do")
	public String mypageOverTimeUpdate(
			@Validated(UpdateGroup.class) @ModelAttribute("") OverTimeVO overTime
			, Errors errors
			, Model model
	) {
		String viewName=null;
		if(!errors.hasErrors()) {
			boolean success = overService.modifyOverTime(overTime);
			if(success) {
				viewName = "redirect:/mypage/myAttend";
			}else {
				model.addAttribute("message", "초과근무 수정 중 에러발생");
				viewName = "mypage/myAttend";
			}
		}else {
			viewName="redirect:/mypage/myAttend";
			model.addAttribute("message", "실패");
		}
		return viewName;
	}
	
	/**
	 * [마이페이지] 이 달의 초과근무 시간
	 * @param model
	 * @return
	 */
	@RequestMapping("/mypage/myTotalOvertime")
	public String myTotalOvertime(
			Authentication authentication
			, Model model	
	) {
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		String empCd = wrapper.getRealUser().getEmpCd();
		
		OverTimeVO overtime = new OverTimeVO();
		
		overtime.setEmpCd(empCd);
		OverTimeVO overtimeEmpCd = overService.totalOvertime(overtime);
		
		model.addAttribute("overtimeEmpCd", overtimeEmpCd);
		
		return "mypage/myAttend";
	}
	
}
