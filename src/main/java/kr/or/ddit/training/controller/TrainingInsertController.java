package kr.or.ddit.training.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.training.dao.TrainingDAO;
import kr.or.ddit.training.service.TrainingService;
import kr.or.ddit.training.vo.LectorVO;
import kr.or.ddit.training.vo.TrainingVO;
import kr.or.ddit.validate.groups.InsertGroup;

/**
 * 
 * 직원교육 Insert
 * 
 */
@Controller
@RequestMapping("/pm/training/trainingInsert.do")
public class TrainingInsertController {

	@Inject
	private TrainingService service;

	@Inject
	private TrainingDAO dao;
	
	
	/**<select>에서 강사 데이터 가져오기
	 * @return
	 */
	@ModelAttribute("lectorList")
	public List<LectorVO> lectorList(){
		return dao.selectLectorAll();
	}
	
	@ModelAttribute("training")
	public TrainingVO training() {
		return new TrainingVO();
	}
	
	
	/**
	 * 직원교육등록 하면 열리는 폼
	 * @return
	 */
	@GetMapping
	public String trainingView() {
		return "pm/training/trainingInsert";
	}

	
	/**
	 * 교육등록에서 [저장]버튼 클릭하면 insert처리하는 컨트롤러
	 * @param training
	 * @param errors
	 * @param model
	 * @return
	 */
	@PostMapping
	public String trainingInsert(
		@Validated(InsertGroup.class) @ModelAttribute("training") TrainingVO training
		, Errors errors
		, Model model
	) {
		
		String viewName;
		
		if(!errors.hasErrors()) {
			boolean success = service.createTraining(training);
			if(success) {
				viewName = "redirect:/pm/training/trainingList";
			}else {
				model.addAttribute("message", "교육등록 중 문제 발생");
				viewName = "pm/training/trainingInsert.do";
			}
		}else { //에러 발생 시
			
			viewName="pm/training/trainingInsert";
		}
		return viewName;
	}
}