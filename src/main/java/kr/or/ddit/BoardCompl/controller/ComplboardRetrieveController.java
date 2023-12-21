package kr.or.ddit.BoardCompl.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.BoardCompl.service.ComplboardSerivce;
import kr.or.ddit.BoardCompl.vo.ComplboardVO;
import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.pagingVO.SimpleCondition;
import lombok.RequiredArgsConstructor;

/**
 * @author PC-26 칭찬합니다 목록, 상세조회
 */
@RequiredArgsConstructor
@Controller
public class ComplboardRetrieveController {

	private final ComplboardSerivce service;

	@ModelAttribute("simpleCondition")
	public SimpleCondition simpleCondition() {
		return new SimpleCondition();
	}

	@RequestMapping("/board/complAllList")
		public String complAllList(
				ComplboardVO com
				, Model model
				) {
		ComplboardVO complEmpName = service.showComplEmp(com);
		model.addAttribute("complEmpName", complEmpName);
			return "board/complAllList";
		}
	
	@RequestMapping("/board/complList")
	public String complList(
			@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, @ModelAttribute("simpleCondition")SimpleCondition simpleCondition
			, Model model) {
		PaginationInfo<ComplboardVO> paging = new PaginationInfo<>(10, 5);
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		List<ComplboardVO> complList = service.retrieveComplList(paging);
		paging.setDataList(complList);

		model.addAttribute("paging", paging);
	
		return "board/boardDetail/complList";
	}

	@RequestMapping("/board/complDetail")
	public void complDetail(@RequestParam("what") int complNo, Model model) {
		ComplboardVO compl = service.retrieveCompl(complNo);
		model.addAttribute("compl", compl);
	}
	

}
