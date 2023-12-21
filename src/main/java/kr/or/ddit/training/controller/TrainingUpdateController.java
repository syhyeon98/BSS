package kr.or.ddit.training.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.attendance.vo.AttendanceVO;
import kr.or.ddit.training.service.TrainingService;
import kr.or.ddit.training.vo.TrainingVO;
import kr.or.ddit.validate.groups.UpdateGroup;



@Controller
@RequestMapping("/pm/training/")
public class TrainingUpdateController {
	
	@Inject
	private TrainingService service;
	
	
	/**
	 * 체크박스 선택해서 모달에 나오는 데이터 처리
	 * @param trainNo
	 * @param model
	 * @return
	 */
	@GetMapping("trainingUpdate.do")
	public String selectOneTraining(int trainNo, Model model) {
		TrainingVO training = service.retrieveOneTrain(trainNo);
		model.addAttribute("training", training);
		return "pm/training/ajax/trainingUpdateForm";
	}
	
	
	/**
	 * 체크박스 선택 후 모달에서 [수정]버튼 눌렀을 때 수정 처리
	 * @param errors
	 * @param model
	 * @return
	 */
	@PostMapping("trainingUpdate.do")
	public String trainingUpdate(
			@Validated(UpdateGroup.class) @ModelAttribute("training") TrainingVO trainNo 
			, Errors errors
			, Model model
	) {
		
		String viewName=null;
		if(!errors.hasErrors()) {
			boolean success = service.modifyTraining(trainNo);
			if(success) {
				viewName = "redirect:/pm/training/trainingList";
				model.addAttribute("message", "수정 성공");
			}else {
				viewName = "pm/training/trainingList";
				model.addAttribute("message", "수정 중 에러발생");
			}
		}else {
			viewName="pm/training/trainingList";
			model.addAttribute("message", "실패");
		}
		return viewName;
	}
}
