package kr.or.ddit.BoardNtc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.BoardNtc.service.NtcboardSerivce;
import kr.or.ddit.BoardNtc.vo.NtcboardVO;
import kr.or.ddit.atch.vo.AtchFileDetailVO;
import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.pagingVO.SimpleCondition;
import lombok.RequiredArgsConstructor;

/**
 * @author PC-26 공지사항 목록, 상세조회
 */
@RequiredArgsConstructor
@Controller
public class NtcboardRetrieveController {

	private final NtcboardSerivce service;

	@ModelAttribute("simpleCondition")
	public SimpleCondition simpleCondition() {
		return new SimpleCondition();
	}
	
	@RequestMapping("/board/ntcAllList")
	public String ntcAllList() {
		return "board/ntcAllList";
	}
	
//	메인에서 공지사항 불러올 예정
	@RequestMapping("/main/ntcAllList")
	public String MainNtcList(
			Model model
			) {
		List<NtcboardVO> ntcList = service.retrievemainNtcList();
		model.addAttribute("ntcList", ntcList);
		return "board/boardDetail/mainNtcList";
	}
	

	@RequestMapping("/board/ntcList")
	public String ntcList(@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, SimpleCondition simpleCondition, Model model) {
		PaginationInfo<NtcboardVO> paging = new PaginationInfo<>(10, 5);
		paging.setSimpleCondition(simpleCondition);
		paging.setCurrentPage(currentPage);
		List<NtcboardVO> ntcList = service.retrieveNtcList(paging);
		paging.setDataList(ntcList);
		model.addAttribute("paging", paging);
		return "board/boardDetail/ntcList";
	}

	@RequestMapping("/board/ntcDetail")
	public void ntcDetail(@RequestParam("what") int ntcNo, Model model) {
		NtcboardVO ntc = service.retrieveNtc(ntcNo);
		
		AtchFileVO atchFileVO = new AtchFileVO();
		atchFileVO.setAtchNo(ntc.getAtchNo());
		List<AtchFileDetailVO> atchdetailList = service.retrievemainNtcList(atchFileVO);
		
		
		model.addAttribute("ntc", ntc);
		model.addAttribute("atchdetailList", atchdetailList);
	}

}
