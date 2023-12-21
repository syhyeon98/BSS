package kr.or.ddit.BoardReq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import kr.or.ddit.BoardReq.service.ReqboardSerivce;
import kr.or.ddit.BoardReq.vo.ReqboardVO;


@Controller
public class reqboardDeleteController {

	@Autowired
	private ReqboardSerivce service;
	
	@ModelAttribute("req")
	public ReqboardVO getReqboardVO() {
	    return new ReqboardVO();
	}
	
	@PostMapping("/board/reqDelete")
	public String reqDelete(
			ReqboardVO req
			, Model model
			) {
		boolean success = service.delete(req);
		String viewName = null;
		
		if(success) {
			viewName = "redirect:/board/reqAllList";
		}else {
			model.addAttribute("message", "삭제 실패, 비밀번호 확인");
			viewName = "redirect:/board/reqDetail?what=" + req.getReqNo();
		}
		
		return viewName;
	}
	
}
