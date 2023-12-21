package kr.or.ddit.attendance.controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.attendance.dao.AttendanceDAO;
import kr.or.ddit.attendance.dao.OverTimeDAO;
import kr.or.ddit.attendance.service.AttendanceService;
import kr.or.ddit.attendance.service.OverTimeService;
import kr.or.ddit.attendance.vo.AttendanceVO;
import kr.or.ddit.attendance.vo.OverTimeVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.pagingVO.SimpleCondition;
import kr.or.ddit.vocation.vo.VocationVO;
import lombok.RequiredArgsConstructor;

/**
 * 출퇴근 조회, 검색 
 *
 */
@Controller
@RequiredArgsConstructor
public class AttendanceController {
	
	private final AttendanceService service;
	
	private final OverTimeService overservice;
	
	
	@Inject
	private AttendanceDAO attendDao;
	
	@Inject
	private OverTimeDAO overTimeDao;
	
	
	@ModelAttribute("attendance")
	public AttendanceVO attendance() {
		return new AttendanceVO();
	}
	
	
	
	/**
	 * 페이징 조건부분에 쓰는 부분
	 * @return
	 */
	@ModelAttribute("simpleCondition")
	public SimpleCondition simpleCondition() {
	      return new SimpleCondition();
	}
	
	/**
	 * 출퇴근조회 출근일, 퇴근일 유무 체크
	 * @return
	 */
	@RequestMapping("/pm/servicemanagement/attend")
	public String attendList(
			@ModelAttribute("attend") AttendanceVO attend
			, Authentication authentication
			, Model model
			
	) {
		
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		String emp = wrapper.getRealUser().getEmpCd();
		attend.setEmpCd(emp); //사원번호
		
		LocalDate currentDate = LocalDate.now();
		attend.setAtteDate(currentDate); //출근일
		
		AttendanceVO haveAtteStime = service.retrieveHaveAtteStime(attend);
		AttendanceVO haveAtteEnd = service.retrieveHaveAtteEnd(attend);
		model.addAttribute("haveAtteStime",haveAtteStime);
		model.addAttribute("haveAtteEnd",haveAtteEnd);
		return "pm/servicemanagement/attend";
	}
	
	
	/**
	 * 출퇴근 전체 조회 페이징
	 * @param currentPage
	 * @param simpleCondition
	 * @param model
	 * @return
	 */
	@RequestMapping("/pm/servicemanagement/attendList")
	public String attenView(
			@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			, Model model
			) {
		PaginationInfo<AttendanceVO> paging = new PaginationInfo<>(5, 5);
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		List<AttendanceVO> attendList = service.retrieveAttendList(paging);
		paging.setDataList(attendList);
		model.addAttribute("paging", paging);
		return "pm/servicemanagement/ajax/attendList";
	}
	
	
	/**
	 * 출퇴근 내역 검색조회
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@PostMapping(value="/pm/servicemanagement/attendSearchList", produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public String atteSearch(
			 @RequestBody AttendanceVO searchAttend
			, Model model
	) {
		PaginationInfo<AttendanceVO> paging = new PaginationInfo<>(5, 5);
		paging.setCurrentPage(searchAttend.getCurrentPage());
		
		paging.setDetailConditionVO(searchAttend);
		
		List<AttendanceVO> attendList = service.searchAttendList(paging);
		paging.setDataList(attendList);
		
		model.addAttribute("paging", paging);
		
		return "jsonView";
	}
	
	
	/**
	 * [마이페이지] 출퇴근조회 출근일, 퇴근일 유무 체크
	 * [마이페이지] 이 달의 초과근무 시간
	 * @return
	 */
	@RequestMapping("/mypage/myAttend")
	public String mypageAttend(
			@ModelAttribute("attend") AttendanceVO attend
			, OverTimeVO overTime
			, Authentication authentication
			, Model model
			
	) {
		
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		String emp = wrapper.getRealUser().getEmpCd();
		attend.setEmpCd(emp); //사원번호
		
		LocalDate currentDate = LocalDate.now();
		attend.setAtteDate(currentDate); //출근일
		
		AttendanceVO haveAtteStime = service.retrieveHaveAtteStime(attend);
		AttendanceVO haveAtteEnd = service.retrieveHaveAtteEnd(attend);
		model.addAttribute("haveAtteStime",haveAtteStime);
		model.addAttribute("haveAtteEnd",haveAtteEnd);
		
		// 당월 초과근무 시간
		OverTimeVO over = new OverTimeVO();
		over.setEmpCd(emp);
		OverTimeVO totalOver = overservice.totalOvertime(over);

		// totalOver가 null인 경우 0으로 할당
		int totalOverHours = (totalOver != null) ? totalOver.getTotalHours() : 0;
		model.addAttribute("totalOver", totalOverHours);
		return "mypage/myAttend";
	}
	
	

	/**
	 * [마이페이지] 출퇴근 전체 조회 페이징
	 * @param currentPage
	 * @param simpleCondition
	 * @param model
	 * @return
	 */
	@RequestMapping("/mypage/myAttendList")
	public String myAttenView(
			@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, Authentication authentication
			, Model model
			) {
		
		PaginationInfo<AttendanceVO> paging = new PaginationInfo<>(5, 5);
		paging.setCurrentPage(currentPage);

		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		String empCd = wrapper.getRealUser().getEmpCd();
		paging.setEmpCd(empCd); //사원번호
		
		List<AttendanceVO> myAttendList = service.mypageAttend(paging);
		paging.setDataList(myAttendList);
		model.addAttribute("paging", paging);
		
		return "mypage/ajax/myAttendList";
	}
	
	
	/**
	 * [마이페이지] 이번달 출퇴근 전체조회
	 * @param currentPage
	 * @param simpleCondition
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/mypage/myAttendthisMonth",  produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, Object> myAttendthisMonth(
			@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, Authentication authentication
			, Model model
			) {
		
		PaginationInfo<AttendanceVO> paging = new PaginationInfo<>(10, 5);
		paging.setCurrentPage(currentPage);

		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		String empCd = wrapper.getRealUser().getEmpCd();
		paging.setEmpCd(empCd); //사원번호
		
		List<AttendanceVO> myAttendthisMonth = service.myAttendthisMonth(paging);
		paging.setDataList(myAttendthisMonth);
		
		Map<String, Object> response = new HashMap<>();
        response.put("paging", paging);
        response.put("myAttendthisMonth", myAttendthisMonth);
        
        return response;
		
	}
	
	/**
	 * [마이페이지] 전 달 출퇴근 전체조회
	 * @param currentPage
	 * @param simpleCondition
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/mypage/myAttendbeforeMonth",  produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, Object> myAttendbeforeMonth(
			@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, Authentication authentication
			, Model model
			) {
		
		PaginationInfo<AttendanceVO> paging = new PaginationInfo<>(10, 5);
		paging.setCurrentPage(currentPage);

		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		String empCd = wrapper.getRealUser().getEmpCd();
		paging.setEmpCd(empCd); //사원번호
		
		List<AttendanceVO> myAttendbeforeMonth = service.myAttendbeforeMonth(paging);
		paging.setDataList(myAttendbeforeMonth);
		
		
		Map<String, Object> response = new HashMap<>();
        response.put("paging", paging);
        response.put("myAttendbeforeMonth", myAttendbeforeMonth);

        return response;
		
	}
	
	/**
	 * [마이페이지] 클라이언트가 입력한 월에 따라 출근내역 조회
	 * @return
	 */
	@PostMapping(value="/mypage/attendMonthSearch.do" ,produces = MediaType.APPLICATION_JSON_VALUE)
	public String attendMonthSearch(
			@RequestBody AttendanceVO searchData
			, Authentication authentication
			, Model model
	) {
		
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		String empCd = wrapper.getRealUser().getEmpCd();
		
		PaginationInfo<AttendanceVO> paging = new PaginationInfo<>(10, 5);
		paging.setCurrentPage(searchData.getCurrentPage());
		paging.setEmpCd(empCd); //사원번호
		
		paging.setDetailConditionVO(searchData);
		
		List<AttendanceVO> vocation = service.inputMonthAttend(paging);
		paging.setDataList(vocation);
		model.addAttribute("paging", paging);
		
		return "jsonView";
	}
	
	/**
	 * [마이페이지] 출퇴근조회 출근일, 퇴근일 유무 체크
	 * [마이페이지] 이 달의 초과근무 시간
	 * @return
	 */
	@PostMapping("/mypage/searchAttend")
	public Map<Object, Object> attendance(
			@ModelAttribute("attend") AttendanceVO attend
			, OverTimeVO overTime
			, Authentication authentication
			, Model model
			
	) {
		
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		String emp = wrapper.getRealUser().getEmpCd();
		attend.setEmpCd(emp); //사원번호
		
		LocalDate currentDate = LocalDate.now();
		attend.setAtteDate(currentDate); //출근일
		
		AttendanceVO haveAtteStime = service.retrieveHaveAtteStime(attend);
		AttendanceVO haveAtteEnd = service.retrieveHaveAtteEnd(attend);
		model.addAttribute("haveAtteStime",haveAtteStime);
		model.addAttribute("haveAtteEnd",haveAtteEnd);
		
		
		Map<Object, Object> resp = new HashMap<>();
		resp.put(haveAtteStime, "haveAtteStime");
		resp.put(haveAtteEnd, "haveAtteEnd");
		
		return resp;
	}
	
	/**
	 * [헤더] 출근퇴근버튼
	 * @return
	 */
	@RequestMapping("/mypage/headerAttend")
	public String headerAttend(
			@ModelAttribute("attend") AttendanceVO attend
			, OverTimeVO overTime
			, Authentication authentication
			, Model model
			
	) {
		
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		String emp = wrapper.getRealUser().getEmpCd();
		attend.setEmpCd(emp); //사원번호
		
		LocalDate currentDate = LocalDate.now();
		attend.setAtteDate(currentDate); //출근일
		
		AttendanceVO haveAtteStime = service.retrieveHaveAtteStime(attend);
		model.addAttribute("haveAtteStime",haveAtteStime);
		
		return "jsonView";
	}
	
	
}
