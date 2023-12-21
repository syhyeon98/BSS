package kr.or.ddit.BoardNtc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.BoardNtc.service.NtcboardSerivce;
import kr.or.ddit.BoardNtc.vo.NtcboardVO;
import lombok.RequiredArgsConstructor;

/**
 * @author PC-26 공지사항 수정
 */
@RequiredArgsConstructor
@Controller
@RequestMapping("/board/ntcUpdate")
public class NtcboardUpdateController {

	private final NtcboardSerivce service;

	@GetMapping
	public String ntcAuthenticate(@RequestParam(name = "what", required = true) int ntcNo, Model model) {
		NtcboardVO ntc = service.retrieveNtc(ntcNo);
		model.addAttribute("ntc", ntc);
		return "board/ntcEdit";
	}

	@PostMapping
	public String updateForm(@ModelAttribute(name = "ntc") NtcboardVO ntc, Errors errors, Model model

	) {
		String viewName = null;
		if (!errors.hasErrors()) {
			boolean success = service.modifyNtc(ntc);
			if (success) {
				viewName = "redirect:/board/ntcDetail?what=" + ntc.getNtcNo();
			} else {
				viewName = "redirect:/board/ntcEdit?what=" + ntc.getNtcNo();
			}
		} else {
			viewName = "redirect:/board/ntcEdit?what=" + ntc.getNtcNo();
		}
		return viewName;
	}
}
