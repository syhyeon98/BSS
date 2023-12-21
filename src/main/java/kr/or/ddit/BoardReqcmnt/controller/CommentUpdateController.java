package kr.or.ddit.BoardReqcmnt.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.BoardReq.vo.ReqboardVO;
import kr.or.ddit.BoardReqcmnt.dao.CommentDAO;
import kr.or.ddit.BoardReqcmnt.service.CommentService;
import kr.or.ddit.BoardReqcmnt.vo.CmntVO;

@Controller
@RequestMapping("/board/cmntUpdate")
public class CommentUpdateController {

	@Inject
	private CommentService commService;
	
	@PostMapping
	public String updateEdit(
			CmntVO rcnmtNo
			, Errors errors
			, Model model) {
		String viewName = null;
		if(!errors.hasErrors()) {
			boolean success = commService.modifyComment(rcnmtNo);
			if(success) {
				viewName = "redirect:/board/reqDetail?what=" + rcnmtNo.getReqNo();
			}else {
				model.addAttribute("message", "수정 중 문제 발생");
				viewName = "redirect:/board/reqDetail?what=" + rcnmtNo.getReqNo();
			}
		}else {
			viewName = "redirect:/board/reqDetail?what=" + rcnmtNo.getReqNo();
			model.addAttribute("message", "수정 실패");
		}
		 return viewName;
	}
}
