package kr.or.ddit.BoardReqcmnt.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.BoardReq.service.ReqboardSerivce;
import kr.or.ddit.BoardReq.vo.ReqboardVO;
import kr.or.ddit.BoardReqcmnt.dao.CommentDAO;
import kr.or.ddit.BoardReqcmnt.service.CommentService;
import kr.or.ddit.BoardReqcmnt.vo.CmntVO;

@Controller
@RequestMapping("/board/reqDetail")
//@RequestMapping("/board/reqDetail")
public class CommentReqCotroller {

	@Inject
	private ReqboardSerivce service;
	
	@Inject
	private CommentService commentService;
	
	@Inject
    private CommentDAO cmntDAO;	
	
	@ModelAttribute("reqCmnt")
	public CmntVO reqCmnt() {
		return new CmntVO();
	}
	
	@ModelAttribute("reqCmntList")
	public List<CmntVO> reqCmntList(
			@RequestParam(name = "what") int reqNo
			, Model model
			){
	List<CmntVO> reqList = commentService.getCommentsByReqNo(reqNo);
	model.addAttribute("reqList", reqList);
	return cmntDAO.selectCommentsByReqNo(reqNo);
	
	}
	
	@GetMapping
	public void reqDetail(@ModelAttribute("what")int reqNo, Model model) {
		ReqboardVO req = service.retrieveReq(reqNo);
		model.addAttribute("req", req);
	}
	
	@PostMapping
	public String reqCmntWrite(
    		@ModelAttribute(name = "reqCmnt") CmntVO reqCmnt
    		,Errors errors
    		,Model model
    		) {
    	String viewName = null;
    	if(!errors.hasErrors()) {
    		boolean success = commentService.createComment(reqCmnt);
    		if(success) {
    			viewName = "redirect:/board/reqDetail?what=" + reqCmnt.getReqNo();
    		}else {
    			model.addAttribute("message", "댓글 등록 중 문제 발생");
    			viewName = "redirect:/board/reqDetail?what=" + reqCmnt.getReqNo();
    		}
    	}else {
    		viewName = "redirect:/board/reqDetail?what=" + reqCmnt.getReqNo();
    	}
    	
    	return viewName;
    }
}
