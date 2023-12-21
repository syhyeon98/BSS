package kr.or.ddit.training.controller;

import org.springframework.http.MediaType;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.training.service.TrainingService;
import kr.or.ddit.training.vo.LectorVO;
import kr.or.ddit.training.vo.TrainingVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/pm/training/")
public class TrainingSelectController {
	private final TrainingService service;
	
	@ModelAttribute("training")
	public TrainingVO tdetail() {
		return new TrainingVO();
	}
	
	/**
	 * [인사관리 > 직원교육 > 교육조회] 직원교육 전체조회
	 * '메인>기타업무>교육신청(trainingListApp)'와 버튼 및 그 기능을 제외하고는 jsp 거의 동일하게 수정 필요
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@GetMapping("trainingList")
	private String trainList(
			@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, Model model
	) {
		PaginationInfo<TrainingVO> paging = new PaginationInfo<>(10, 5);
		paging.setCurrentPage(currentPage);
		
		List<TrainingVO> trainList = service.retrieveTrainList(paging);
		paging.setDataList(trainList);
		model.addAttribute("paging",paging);
		
		return "pm/training/trainingList"; // 교육 등록,수정,삭제 + 교육상세내역,신청자목록
	}

	/**
	 * 직원교육 검색조회
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
	
	/**
	 * 직원교육 상세조회(모달) [인사관리 >직원교육 > 교육조회]
	 * @param model
	 * @param trainNo
	 * @return
	 */
	@GetMapping("trainingDetail")
	public String trainView(
			Model model, @RequestParam(name="trainNo", required = true) int trainNo
	) {
		TrainingVO trainDetail = service.retrieveTrain(trainNo);		
		model.addAttribute("trainDetail", trainDetail);
		
		return "pm/training/ajax/trainingDetail";
	}
	/**
	 * 직원교육 상세조회(모달) [메인 > 기타업무 > 교육신청]
	 * @param model
	 * @param trainNo
	 * @return
	 */
	@GetMapping("trainingDetailApp")
	public String trainViewApp(
			Model model, @RequestParam(name="trainNo", required = true) int trainNo
			) {
		TrainingVO trainDetail = service.retrieveTrain(trainNo);		
		model.addAttribute("trainDetail", trainDetail);
		
		return "pm/training/ajax/trainingDetailApp";
	}
	
	
	/**
	 * 강사 전체조회
	 * @param model
	 * @return
	 */
	@RequestMapping("lectorList")
	public String lectorList(
			Model model
	) {
		List<LectorVO> lector = service.retrieveLector();		
		model.addAttribute("lector", lector);
		
		return "pm/training/lectorList";
	}

	/**
	 * 강사 상세조회
	 * @param model
	 * @param lectorId
	 * @return
	 */
	@GetMapping("lectorDetail.do")
	public String lectorView(
			Model model, @RequestParam(name="what", required = true) String lectorId
			) {
		List<LectorVO> lectorDetail = service.retrievelectorDetail(lectorId);
		model.addAttribute("lectorDetail", lectorDetail);
		
		return "pm/servicemanagement/ajax/lectorDetail";
	}
}
