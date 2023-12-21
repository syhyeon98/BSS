package kr.or.ddit.employee.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.BoardCompl.dao.ComplboardDAO;
import kr.or.ddit.BoardCompl.service.ComplboardSerivce;
import kr.or.ddit.BoardCompl.vo.ComplboardVO;
import kr.or.ddit.BoardReq.dao.ReqboardDAO;
import kr.or.ddit.BoardReq.service.ReqboardSerivce;
import kr.or.ddit.BoardReq.vo.ReqboardVO;
import kr.or.ddit.employee.service.EmployeeService;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import kr.or.ddit.employee.vo.MyBoardVO;
import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.pagingVO.SimpleCondition;

@Controller
public class MyBoardListController {
	@Inject
	private ComplboardDAO complDAO;
	@Inject
	private ReqboardDAO reqDAO;
	@Inject
	private ComplboardSerivce complService;
	@Inject
	private EmployeeService service;
	@Inject
	private ReqboardSerivce reqService;
	
	@ModelAttribute("simpleCondition")
	public SimpleCondition simpleCondition() {
		return new SimpleCondition();
	}
	
	@ModelAttribute("complList")
	public List<ComplboardVO> complList(Authentication authentication, Model model) {
		
		EmployeeVOWrapper user = (EmployeeVOWrapper) authentication.getPrincipal();
		String empCd = user.getRealUser().getEmpCd();
		ComplboardVO compl = new ComplboardVO();
		List<ComplboardVO> complList = complService.myComplList(empCd);
		compl.setComplList(complList);
		model.addAttribute("complList", complList);
		return complDAO.myComplBoardList(empCd);
	}
	
	@ModelAttribute("reqList")
	public List<ReqboardVO> reqList(Authentication authentication, Model model) {
		
		EmployeeVOWrapper user = (EmployeeVOWrapper) authentication.getPrincipal();
		String empCd = user.getRealUser().getEmpCd();
		ReqboardVO req = new ReqboardVO();
		List<ReqboardVO> reqList = reqService.myReqList(empCd);
		req.setReqList(reqList);
		model.addAttribute("reqList", reqList);
		return reqDAO.myReqBoardList(empCd);
	}
	
	
	
	
	
	
	
	@RequestMapping("/employee/mypage/myBoard")
	public String myboard() {
		
		return "mypage/myBoard";
	}
	
	@RequestMapping("mypage/myBoardList")
	public String myBoardList(
		@RequestParam(name = "page", required = false, defaultValue = "1")long currentPage
		, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
		, Model model
		) {
		PaginationInfo<MyBoardVO> paging = new PaginationInfo<>(25, 5);
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		List<MyBoardVO> boardList = service.myBoard(paging);
		paging.setDataList(boardList);
		model.addAttribute("paging", paging);
		return "mypage/ajax/myBoardList";
	}
}
