package kr.or.ddit.BoardCompl.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.BoardCompl.service.ComplboardSerivce;
import kr.or.ddit.BoardCompl.vo.ComplboardVO;

@Controller
@RequestMapping("/board/complUpdate")
public class ComplBoardUpdateController {

	@Inject
	private ComplboardSerivce complService;
	
	@GetMapping
	public String complAuthenticate(
			@RequestParam(name = "what", required = true) int complNo
			, Model model
			) {
		ComplboardVO compl = complService.retrieveCompl(complNo);
		model.addAttribute("compl", compl);
		return "board/complEdit";
	}
	
	@PostMapping
	public String complUpdate(
		@ModelAttribute(name = "compl")	ComplboardVO compl
		, Errors errors
		, Model model
		) {
		String viewName = null;
		if(!errors.hasErrors()) {
			boolean success = complService.modifyCompl(compl);
			if(success) {
				viewName = "redirect:/board/complDetail?what=" + compl.getComplNo();
			}else {
				viewName = "redirect:/board/complEdit?what=" + compl.getComplNo();
			}
		}else {
			viewName = "redirect:/board/complEdit?what=" + compl.getComplNo();
		}
		return viewName;
	}
}
