package kr.or.ddit.BoardCompl.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import kr.or.ddit.BoardCompl.service.ComplboardSerivce;
import kr.or.ddit.BoardCompl.vo.ComplboardVO;

@Controller
public class ComplBoardDeleteController {

	@Inject
	private ComplboardSerivce complService;
	
	
	@PostMapping("/board/complDelete")
	public String complDelete(
			ComplboardVO compl
			, Model model
			) {
		
		boolean success = complService.removeCompl(compl);
		String viewName = null;
		
		if(success) {
			viewName = "redirect:/board/complAllList";
		}else {
			model.addAttribute("message", "삭제 실패, 비밀번호 확인");
			viewName = "redricet:/board/complDetail?what=" + compl.getComplNo();
		}
		return viewName;
	}
	
}
