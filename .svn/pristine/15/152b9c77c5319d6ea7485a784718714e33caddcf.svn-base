package kr.or.ddit.BoardReq.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.BoardReq.service.ReqboardSerivce;
import kr.or.ddit.BoardReq.vo.ReqboardVO;
import kr.or.ddit.BoardReqcmnt.vo.CmntVO;
import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.pagingVO.SimpleCondition;
import lombok.RequiredArgsConstructor;

/**
 * @author PC-26 요구사항목록, 상세조회
 */
@RequiredArgsConstructor
@Controller
public class reqboardRetrieveController {

	private final ReqboardSerivce service;

	@ModelAttribute("reqCmnt")
	public CmntVO reqCmnt() {
		return new CmntVO();
	}

	@ModelAttribute("simpleCondition")
	public SimpleCondition simpleCondition() {
		return new SimpleCondition();
	}

	@RequestMapping("/board/reqAllList")
	public String reqAllList() {
		return "board/reqAllList";
	}
	
	@RequestMapping("/main/reqAllList")
	public String reqMainList(
			Model model
			) {
		List<ReqboardVO> reqList = service.reqMainList();
		model.addAttribute("reqList", reqList);
		return "board/boardDetail/reqMainList";
	}
	
	@RequestMapping("/board/reqList")
	public String reqList(@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage,
			SimpleCondition simpleCondition, Model model) {
		PaginationInfo<ReqboardVO> paging = new PaginationInfo<>(10, 5);
		paging.setSimpleCondition(simpleCondition);
		paging.setCurrentPage(currentPage);
		List<ReqboardVO> reqList = service.retrieveReqList(paging);
		paging.setDataList(reqList);

		model.addAttribute("paging", paging);

		return "board/boardDetail/reqList";
	}

}
