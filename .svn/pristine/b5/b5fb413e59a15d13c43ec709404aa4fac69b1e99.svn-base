package kr.or.ddit.BoardReq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.BoardReq.service.ReqboardSerivce;
import kr.or.ddit.BoardReq.vo.ReqboardVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/board/reqUpdate")
public class reqboardUpdateController {
	private final ReqboardSerivce service;
	
	@GetMapping
	public String getHandler(@RequestParam("what") int reqNo, Model model) {
		ReqboardVO req = service.retrieveReq(reqNo);
		model.addAttribute("req", req);
		return "board/reqEdit";
	}

	
	@PostMapping
		public String boardModifyPOST(ReqboardVO reqVO, RedirectAttributes rttr) {
		
		service.modifyReq(reqVO);
		rttr.addFlashAttribute("result", "modify success");
		return "redirect:/board/reqDetail?what=" + reqVO.getReqNo();
	}
}
 