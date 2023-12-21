package kr.or.ddit.training.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.attendance.vo.AttendanceVO;
import kr.or.ddit.calendar.service.PersonalService;
import kr.or.ddit.calendar.vo.PersonalVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.training.service.TrainingApplyService;
import kr.or.ddit.training.service.TrainingService;
import kr.or.ddit.training.vo.TrainingApplyVO;
import kr.or.ddit.training.vo.TrainingVO;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class TrainingApplyController {
	
	private final TrainingApplyService service;
//	private final TrainingService tService;
	
	private final TrainingService trainingService;
	
	@Inject
	private PersonalService personalService;
	
	
	@ModelAttribute("trainingApply")
	public TrainingApplyVO trainingApplyVO() {
		return new TrainingApplyVO();
	}
	
	/**
	 * 전체 교육에 대한 신청자 목록 조회 - 현재 미사용중! 필요시 변경하여 메뉴 추가하고, 계속 미사용 시 관련 코드 삭제하기
	 * @return
	 */
	@GetMapping("/pm/training/trainingApply.do")
	public String trainingApplyList(
			@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, Model model		
	) {
		
		PaginationInfo<TrainingApplyVO> paging = new PaginationInfo<>(10, 5);
		paging.setCurrentPage(currentPage);
		
		List<TrainingApplyVO> trainAppList = service.retrieveTrainApplyListAll(paging);
		paging.setDataList(trainAppList);
		model.addAttribute("paging", paging);
		
		return "pm/training/trainingApplyList";
	}
	
	/**
	 * 교육별 신청자 조회(모달)
	 * @return
	 */
	@GetMapping("/pm/training/trainingApplyModal.do")
	public String trainingApplyListM(
			@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, @RequestParam(name = "trainNo", required = false) Integer trainNo
			, Model model		
	) {
		
		PaginationInfo<TrainingApplyVO> paging = new PaginationInfo<>(10, 5);
		paging.setCurrentPage(currentPage);
		paging.setTrainNo(trainNo);
		
		List<TrainingApplyVO> trainAppList = service.retrieveTrainApplyList(paging);
		paging.setDataList(trainAppList);
		model.addAttribute("paging", paging);
		
		return "pm/training/ajax/trainingApplyListM";
	}
	
	/**
	 * 교육 신청자 검색조회 - 교육별 신청자 조회(모달) 페이징을 위한 컨트롤러
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@ResponseBody
	@GetMapping(value="/pm/training/trainingApplyMPaging", produces = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> trainingApplySearchList(
			@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, @RequestParam(name = "trainNo", required = false) Integer trainNo
			, Model model
	) {
		PaginationInfo<TrainingApplyVO> paging = new PaginationInfo<>(10, 5);
	    paging.setCurrentPage(currentPage);
	    paging.setTrainNo(trainNo); // 교육별 리스트이므로 페이징도 trainNo 필요
	    
	    List<TrainingApplyVO> trainAppList = service.retrieveTrainApplyList(paging);
	    paging.setDataList(trainAppList);
	    
	    Map<String, Object> response = new HashMap<>();
	    response.put("trainAppList", trainAppList);
	    response.put("paging", paging);
		 
		return response;
	}	
	
	/**
	 * [마이페이지] 교육 내역 조회
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@GetMapping("/mypage/myTraining.do")
	public String Mytraining(
			@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, Authentication authentication
			, Model model		
	) {
		
		EmployeeVOWrapper empAuth= (EmployeeVOWrapper) authentication.getPrincipal();
		String empCd = empAuth.getRealUser().getEmpCd();
		
		PaginationInfo<TrainingVO> paging = new PaginationInfo<>(10, 5);
		paging.setCurrentPage(currentPage);
		paging.setEmpCd(empCd); // 마이페이지이므로 empCd 필요
		
		List<TrainingVO> trainAppList = service.retrieveMyTrain(paging);
		paging.setDataList(trainAppList);
		
		model.addAttribute("paging", paging);
		
		return "mypage/myTraining";
	}
	
	/**
	 * 교육 신청자 검색조회 - [마이페이지] 교육 내역 조회 페이징을 위한 컨트롤러
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@ResponseBody
	@GetMapping(value="/mypage/mytrainingPaging", produces = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> mytrainingSearchList(
			@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, Authentication authentication
			, Model model
	) {
		EmployeeVOWrapper empAuth= (EmployeeVOWrapper) authentication.getPrincipal();
		String empCd = empAuth.getRealUser().getEmpCd();
		
		PaginationInfo<TrainingVO> paging = new PaginationInfo<>(10, 5);
	    paging.setCurrentPage(currentPage);
	    paging.setEmpCd(empCd); // 마이페이지이므로 empCd 필요
	    
	    List<TrainingVO> trainAppList = service.retrieveMyTrain(paging);
	    paging.setDataList(trainAppList);
	    
	    Map<String, Object> response = new HashMap<>();
	    response.put("trainAppList", trainAppList);
	    response.put("paging", paging);
		 
		return response;
	}
	
	
	/**
	 * 직원교육 신청하기
	 * 뷰에서 trainNo을 받아오고 컨트롤러에서 로그인한 직원 정보를 넘겨준다.
	 * @param trainApply
	 * @param errors
	 * @param authentication
	 * @param model
	 * @return
	 */
	@PostMapping("/pm/training/trainingApplyInsert.do")
	public String trainingApplyInsert(
			@RequestParam(value = "empCd", required = false) String empCd
		    , @ModelAttribute("trainApply") TrainingApplyVO trainApply
		    , Errors errors
		    , Authentication authentication
		    , Model model
	) {
		
		EmployeeVOWrapper principal = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO realUser = principal.getRealUser();
		trainApply.setEmpCd(realUser.getEmpCd());
		//model.addAttribute("trainApply",trainApply); // 넣으면 실패로 넘어감
		
		TrainingApplyVO haveTrain = service.retrieveHaveApply(trainApply); // 해당 교육을 신청한 적 있는지 조회
		String viewName = null;
		
		if(haveTrain != null) { // 선택한 교육에 신청값이 있으면
			// jsp에서 alert창
		}else { // 신청하지 않은 교육이면
			boolean success = service.createTrainApply(trainApply);
			
			// 신청한 교육의 상세조회 가져옴
			TrainingVO trainDetail = trainingService.retrieveTrain(trainApply.getTrainNo());
		
			// 문영택 추가
			// 신청한 교육 캘린더에 등록하기 위한 준비
			PersonalVO calendar = new PersonalVO();
			calendar.setEmpCd(realUser.getEmpCd());
			calendar.setPerStart(trainDetail.getTrainDate().toLocalDate().toString());
			calendar.setPerEnd(trainDetail.getTrainDate().toLocalDate().toString());
			calendar.setPerTitle("교육");
			calendar.setPerCont(trainDetail.getTrainName());
			calendar.setPerTarget("E");

			// 교육 캘린더에 등록
			personalService.createPersonal(calendar);
			// 추가
			
			if(success) {
				viewName = "redirect:/pm/training/trainingList"; // 나중에 메인-교육리스트jsp로 변경해야함
			}else {
				// jsp에서 alert창
			}
		}
		return viewName;
	}

	
	/**
	 * 직원교육 신청취소
	 * @param trainApply
	 * @param errors
	 * @param model
	 * @return
	 */
	@PostMapping("/pm/training/trainingApplyDelete.do")
	public String trainingApplyDelete(
			 @RequestParam(value = "empCd", required = false) String empCd
			    , @ModelAttribute("trainApply") TrainingApplyVO trainApply
			    , Errors errors
			    , Authentication authentication
			    , Model model
	) {
			
		EmployeeVOWrapper principal = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO realUser = principal.getRealUser();
		trainApply.setEmpCd(realUser.getEmpCd());
		
		TrainingApplyVO haveTrain = service.retrieveHaveApply(trainApply); // 해당 교육을 신청한 적 있는지 조회
		String viewName = null;
		
		if(haveTrain == null) { // 선택한 교육에 신청값이 있으면
			// jsp에서 alert창
		}else { 				// 신청하지 않은 교육이면
			boolean success = service.removeTrainApply(trainApply); // 삭제
			if(success) {
				viewName = "redirect:/pm/training/trainingList"; // 나중에 메인-교육리스트로 변경해야함
			}else {
				// jsp에서 alert창
			}
		}
		return viewName;
	}
	
	/**
	 * [메인 > 기타업무 > 교육신청] 마감기한이 지나지 않은 직원교육 전체조회
	 * '인사관리>직원교육>교육조회(trainingList)'와 버튼 및 그 기능을 제외하고는 jsp 거의 동일하게 수정 필요
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@GetMapping("/mypage/trainingListApp")
	private String trainingListAppEmp(
			@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, Model model
	) {
		PaginationInfo<TrainingVO> paging = new PaginationInfo<>(10, 5);
		paging.setCurrentPage(currentPage);
		
		List<TrainingVO> trainList = service.retrieveTrainList(paging);
		paging.setDataList(trainList);
		model.addAttribute("paging",paging);
		
		return "mypage/trainingListApp"; // 교육 신청,취소 + 교육상세내역
	}
	
	/**
	 * 마감기한이 지나지 않은 직원교육 전체조회 - 페이징
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@ResponseBody
	@GetMapping(value="trainingSearchList", produces = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> trainingSearchList(
			@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, Model model
	) {
		PaginationInfo<TrainingVO> paging = new PaginationInfo<>(10, 5);
	    paging.setCurrentPage(currentPage);

	    List<TrainingVO> trainList = service.retrieveTrainList(paging);
	    paging.setDataList(trainList);

	    Map<String, Object> response = new HashMap<>();
	    response.put("trainList", trainList);
	    response.put("paging", paging);
		
		return response;
	}
	
	// 교육 기간이 지나면 교육완료
	
}
