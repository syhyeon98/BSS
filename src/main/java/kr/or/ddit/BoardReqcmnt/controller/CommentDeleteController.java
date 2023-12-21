package kr.or.ddit.BoardReqcmnt.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import kr.or.ddit.BoardReqcmnt.service.CommentService;
import kr.or.ddit.BoardReqcmnt.vo.CmntVO;

@Controller
public class CommentDeleteController {

	@Inject
	private CommentService commService;
	
	@PostMapping("/board/cmntDelete")
	public String complDelete(
			CmntVO cmnt
			, Model model
			) {
		String viewName = null;
		boolean success = commService.deleteComment(cmnt);
		
		if(success) {
			viewName = "redirect:/board/reqDetail?what=" + cmnt.getReqNo();
		}else {
			model.addAttribute("message", "삭제 실패, 비밀번호 확인");
			viewName = "redirect:/board/reqDetail?what=" + cmnt.getReqNo();
		}
		return viewName;
	}
}
