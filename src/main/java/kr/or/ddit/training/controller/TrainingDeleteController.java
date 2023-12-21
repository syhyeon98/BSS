package kr.or.ddit.training.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.training.service.TrainingService;
import kr.or.ddit.training.vo.TrainingVO;

@Controller
public class TrainingDeleteController {
	
	@Inject
	private TrainingService service;
	
	@ResponseBody
	@PostMapping("/pm/training/trainingDelete.do")
	public String trainingDelete(TrainingVO trainVO) {
		boolean success = service.removeTraining(trainVO);
		String result = null;
		if(success) {
			result ="success";
		}else {
			result="fail";
		}
			return result;
		}
}
