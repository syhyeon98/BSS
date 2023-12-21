package kr.or.ddit.employee.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import kr.or.ddit.pagingVO.SimpleCondition;
import kr.or.ddit.salary.service.AllowService;
import kr.or.ddit.salary.service.SalaryDetailService;
import kr.or.ddit.salary.service.SalaryService;
import kr.or.ddit.salary.vo.SalaryDetailVO;
import kr.or.ddit.salary.vo.SalaryVO;

@Controller
public class MypageSalaryController {
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
	@RequestMapping("/mypage/salaryDetail.do")
	public String salaryDetailList(int salNo, Model model) {
		model.addAttribute("salNo", salNo);
		return "mypage/salaryDetailList";
	}

	/**
	 * salaryDetailList FORM안에 들어가는 리스트 AJAX
	 * @param salNo
	 * @param model
	 * @return
	 */
	@RequestMapping("/mypage/salaryADetail.do")
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
		return "mypage/ajax/salaryADetailList";
	}
	
	
	/**
	 * 직원급여 상세조회
	 * @param salNo
	 * @param model
	 * @return
	 */
	@RequestMapping("/mypage/salaryDetailView.do")
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
		return "mypage/salaryDetailView";
	}
	
	
	
	/**
	 * pdf뽑기전 
	 * @param salNo
	 * @param empCd
	 * @param empName
	 * @param model
	 * @return
	 */
	@RequestMapping("/mypage/showSalaryPdf")
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
		return "mypage/salarySpecification";
	}
	
	@RequestMapping("/mypage/salaryMyList.do")
	public String salaryMyList(Model model,Authentication authentication)  {
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO employee = wrapper.getRealUser();
		model.addAttribute("salaryList", salaryService.retrieveSalaryPersonalList(employee));
		model.addAttribute("employee",employee);
		return "mypage/mySalary";
	}
	
}
