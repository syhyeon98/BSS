package kr.or.ddit.salary.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.salary.dao.SalaryDetailDAO;
import kr.or.ddit.salary.service.AllowHistoryService;
import kr.or.ddit.salary.vo.AllowHistoryVO;
import kr.or.ddit.salary.vo.SalaryVO;

@Controller
@RequestMapping("/allowHistory/")
public class AllowHistoryController {
	
	@Inject
	private AllowHistoryService allowHistoryService;
	
	@Inject
	private SalaryDetailDAO salaryDetailDao;
	
	@PostMapping("addAllowHistory.do")
	@ResponseBody
	public String addAllowHistory(AllowHistoryVO allowHistory) {
		allowHistoryService.addAllowHistory(allowHistory);
		SalaryVO salary = new SalaryVO();
		salary.setSalNo(allowHistory.getSalNo());
		salaryDetailDao.deleteSalaryDetail(salary);
		salaryDetailDao.insertSalaryDetail();
		return "success";
	}
	
	@PostMapping("removeAllowHistory.do")
	@ResponseBody
	public String removeAllowHistory(AllowHistoryVO allowHistory) {
		allowHistoryService.removeAllowHistory(allowHistory);
		SalaryVO salary = new SalaryVO();
		salary.setSalNo(allowHistory.getSalNo());
		salaryDetailDao.deleteSalaryDetail(salary);
		salaryDetailDao.insertSalaryDetail();
		return "success";
	}
	
}
