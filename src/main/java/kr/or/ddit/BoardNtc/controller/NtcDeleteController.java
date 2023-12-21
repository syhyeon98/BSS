package kr.or.ddit.BoardNtc.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import kr.or.ddit.BoardNtc.service.NtcboardSerivce;
import kr.or.ddit.BoardNtc.vo.NtcboardVO;

@Controller
public class NtcDeleteController {

    @Inject
    private NtcboardSerivce ntcService;


    @PostMapping("/board/ntcDelete")
    public String ntcDelete(
    		NtcboardVO ntc
    		, Model model
    		) {

    	boolean success = ntcService.removeNtc(ntc);
    	String viewName = null;
    	
    	if(success) {
    		viewName = "redirect:/board/ntcAllList";
    	}else {
    		model.addAttribute("message", "삭제 실패, 비밀번호 확인");
    		viewName = "redirect:/board/ntcDetail?what=" + ntc.getNtcNo();
    	}
    	return viewName;
    }
}
