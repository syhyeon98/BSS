package kr.or.ddit.salary.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.pagingVO.SimpleCondition;
import kr.or.ddit.salary.dao.AllowHistoryDAO;
import kr.or.ddit.salary.dao.DdcHistoryDAO;
import kr.or.ddit.salary.service.AllowService;
import kr.or.ddit.salary.service.SalaryDetailService;
import kr.or.ddit.salary.service.SalaryService;
import kr.or.ddit.salary.vo.AllowHistoryVO;
import kr.or.ddit.salary.vo.DdcHistoryVO;
import kr.or.ddit.salary.vo.SalaryDetailVO;
import kr.or.ddit.salary.vo.SalaryVO;

@Controller
@RequestMapping("/salary/")
public class SalaryDetailController {

	@Inject
	private SalaryDetailService salaryDetailService;
	
	@Inject
	private SalaryService salaryService;
	
	@Inject
	private AllowService allowService;
	
	@ModelAttribute("simpleCondition")
	public SimpleCondition simpleCondition() {
		return new SimpleCondition();
	}
	
	/**
	 * salaryDeatilList FORM
	 * @param salNo
	 * @param model
	 * @return
	 */
	@RequestMapping("salaryDetail.do")
	public String salaryDetailList(int salNo, Model model) {
		model.addAttribute("salNo", salNo);
		return "pm/salary/salaryDetailList";
	}

	/**
	 * salaryDetailList FORM안에 들어가는 리스트 AJAX
	 * @param salNo
	 * @param model
	 * @return
	 */
	@RequestMapping("salaryADetail.do")
	public String salaryADetailList(int salNo,String empName, Model model) {
		SalaryDetailVO salaryDetail = new SalaryDetailVO();
		salaryDetail.setSalNo(salNo);
		if(empName!=null) {
			EmployeeVO employee = new EmployeeVO();
			employee.setEmpName(empName);
			salaryDetail.setEmployeeVO(employee);
		}
		List<SalaryDetailVO> salaryDetailList = salaryDetailService.retrieveSalaryDetailList(salaryDetail);
		model.addAttribute("salaryDetailList", salaryDetailList);
		model.addAttribute("allowList",allowService.retrieveAllowList());
		return "pm/salary/ajax/salaryADetailList";
	}
	
	
	/**
	 * 직원급여 상세조회
	 * @param salNo
	 * @param model
	 * @return
	 */
	@RequestMapping("salaryDetailView.do")
	public String salaryDetailView( int salNo,String empCd, String empName,Model model) {
		SalaryDetailVO salaryDetail = new SalaryDetailVO();
		salaryDetail.setSalNo(salNo);
		EmployeeVO employee = new EmployeeVO();
		if(empCd!=null) {
			employee.setEmpCd(empCd);
			employee.setEmpName(empName);
			salaryDetail.setEmployeeVO(employee);
		}
		List<SalaryDetailVO> salaryDetailList = salaryDetailService.retrieveSalaryDetailList(salaryDetail);
		model.addAttribute("salaryList", salaryService.retrieveSalaryPersonalList(employee));
		model.addAttribute("salaryDetailList", salaryDetailList);
		return "pm/salary/salaryDetailView";
	}
	
	/**
	 * 정산완료
	 * @param salary
	 * @return
	 */
	@RequestMapping("salaryGive.do")
	public String salaryGive(SalaryVO salary) {
		salaryDetailService.modifySalaryGiveYmd(salary);
		return "redirect:/salary/salaryDetail.do?salNo="+salary.getSalNo();
	}
	
	
	
	/**
	 * pdf뽑기전 
	 * @param salNo
	 * @param empCd
	 * @param empName
	 * @param model
	 * @return
	 */
	@RequestMapping("showSalaryPdf")
	public String showSalaryPdf( int salNo,String empCd, String empName,Model model) {
		SalaryDetailVO salaryDetail = new SalaryDetailVO();
		salaryDetail.setSalNo(salNo);
		EmployeeVO employee = new EmployeeVO();
		if(empCd!=null) {
			employee.setEmpCd(empCd);
			employee.setEmpName(empName);
			salaryDetail.setEmployeeVO(employee);
		}
		List<SalaryDetailVO> salaryDetailList = salaryDetailService.retrieveSalaryDetailList(salaryDetail);
		model.addAttribute("salaryList", salaryService.retrieveSalaryPersonalList(employee));
		model.addAttribute("salaryDetailList", salaryDetailList);
		return "pm/salary/salarySpecification";
	}
	
}
