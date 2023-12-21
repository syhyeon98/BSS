package kr.or.ddit.resignation.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.pagingVO.SimpleCondition;
import kr.or.ddit.resignation.service.ResignationService;
import kr.or.ddit.resignation.vo.ResignationVO;

@Controller
public class ResignationController {
	
	@Inject
	ResignationService reService;
	
	@ModelAttribute("simpleCondition")
	public SimpleCondition simpleCondition() {
		return new SimpleCondition();
	}
	
	@RequestMapping("/pm/appointments/reList")
	public String resignation(
			@RequestParam(name = "page", required = false, defaultValue = "1")
			long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			, Model model
		) {
		PaginationInfo<ResignationVO> paging = new PaginationInfo<>(25, 5);
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		List<ResignationVO> reList = reService.retrieveResignationList(paging);
		paging.setDataList(reList);
		model.addAttribute("paging", paging);
		return "pm/appointments/ajax/reList";
	}
	
	@RequestMapping("/pm/appointments/resignation")
	public String employeeAllList() {
		return "pm/appointments/resignation";
	}
	
}

