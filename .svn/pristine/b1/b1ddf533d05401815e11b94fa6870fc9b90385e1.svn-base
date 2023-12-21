package kr.or.ddit.salary.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.employee.service.EmployeeService;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.pagingVO.SimpleCondition;
import kr.or.ddit.salary.service.AllowService;
import kr.or.ddit.salary.service.SalaryService;
import kr.or.ddit.salary.vo.SalaryVO;

@Controller
@RequestMapping("/salary/")
public class SalaryController {

	@Inject
	private EmployeeService empService;

	@Inject
	private SalaryService salaryService;
	

	@ModelAttribute("simpleCondition")
	public SimpleCondition simpleCondition() {
		return new SimpleCondition();
	}

	// 처리된 급여대장을 위한 메서드
	// model에는 급여 테이블의 정보가 담김
	@RequestMapping("allSalary")
	public String salary(Model model) {
		model.addAttribute("salaryList", salaryService.salaryList());
		return "pm/salary/salary";
	}
	
	// 직원 월별 급여 리스트
	@RequestMapping("salaryPersonalList.do")
	public String salaryPersonalList(Model model, EmployeeVO employee) {
		model.addAttribute("salaryList", salaryService.retrieveSalaryPersonalList(employee));
		model.addAttribute("employee",employee);
		return "pm/salary/salaryPersonalList";
	}

	@RequestMapping("salaryMyList.do")
	public String salaryMyList(Model model,Authentication authentication)  {
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO employee = wrapper.getRealUser();
		model.addAttribute("salaryList", salaryService.retrieveSalaryPersonalList(employee));
		model.addAttribute("employee",employee);
		return "pm/salary/salaryPersonalList";
	}

	// 모든 직원 리스트 검색 및 조회 메서드
	@RequestMapping("salaryEmpList")
	public String employeeList(@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage,
			@ModelAttribute("simpleCondition") SimpleCondition simpleCondition, Model model) {
		PaginationInfo<EmployeeVO> paging = new PaginationInfo<>(100, 5);
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);

		List<EmployeeVO> employeeList = empService.retrieveEmpList(paging);
		paging.setDataList(employeeList);
		model.addAttribute("paging", paging);
		return "pm/salary/ajax/salaryEmpList";
	}

	// 직원 조회
	@RequestMapping("salaryInsertEmpList.do")
	public String salaryEmpList() {
		return "pm/salary/salaryInsertEmpList";
	}

	// 급여작성
	@RequestMapping("salaryInsert.do")
	public String salaryInsert(Model model
			,HttpSession session
			) {
		String viewName = null;
		List<SalaryVO> salaryList= salaryService.checkBeforeCreate();
		if(salaryList.size()>0) {
			int salNo = salaryList.get(0).getSalNo();
			session.setAttribute("message", "진행중인 급여계산 항목으로 이동합니다");
			viewName="redirect:/salary/salaryDetail.do?salNo="+salNo;
		}else {
			salaryService.createSalary();
			viewName = "redirect:/salary/allSalary";
		}
		return viewName;
	}
	
	/**
	 * 급여재계
	 * @param salary
	 * @return
	 */
	@RequestMapping("salaryReCalc.do")
	public String salaryReCalc(SalaryVO salary) {
		salaryService.deleteSalary(salary);
		return"redirect:/salary/salaryInsert.do";
	}
	
	// 급여계산확정
	@RequestMapping("salaryFinCalc.do")
	public String salaryFinCalc(SalaryVO salary) {
		salaryService.modifySalary(salary);
		return "redirect:/salary/salaryDetail.do?salNo="+salary.getSalNo();
	}

	// 급여 대장 리스트
	@RequestMapping("salaryList")
	public String salaryList() {
		return "pm/salary/salaryList";
	}
	
	
}
