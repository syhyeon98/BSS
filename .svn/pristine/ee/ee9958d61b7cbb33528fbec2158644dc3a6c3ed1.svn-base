package kr.or.ddit.employee.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.employee.dao.MainEmployeeDAO;
import kr.or.ddit.employee.vo.DepartmentCountVO;
import kr.or.ddit.employee.vo.EmployeeCountVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.employee.vo.TotalSalaryMonthVO;

@Controller
@RequestMapping("/pm/appointments/")
public class EmployeeMainController {
	
	@Inject
	private MainEmployeeDAO empDao;
	
	
	@RequestMapping("main.do")
	public String mainView(Model model) {
//		// 전체직원수
//		int totalEmployee = empDao.totalCountEmployee();
//		// 부서별 직원수
//		List<DepartmentCountVO> depEmployeeList = empDao.totalCountDepEmployee();
//		// 연도별 직원수
//		List<EmployeeCountVO> yearEmployeeList = empDao.totalCountYearEmployee();
//		// 이번달 신입사원
//		List<EmployeeVO> newEmployeeList = empDao.newEmployeeList();
//		
//		// 최근 5개월 총 급여
//		List<TotalSalaryMonthVO> totalSalaryList = empDao.totalSalary();
//		
//		model.addAttribute("totalEmployee", totalEmployee);
//		model.addAttribute("depEmployeeList", depEmployeeList);
//		model.addAttribute("yearEmployeeList", yearEmployeeList);
//		model.addAttribute("newEmployeeList", newEmployeeList);
//		model.addAttribute("totalSalaryList", totalSalaryList);
//		
		return "pm/appointments/mainEmpView";
	}
	
	@RequestMapping("mainAjax.do")
	public String mainAjaxView(Model model) {
		// 전체직원수
		int totalEmployee = empDao.totalCountEmployee();
		// 부서별 직원수
		List<DepartmentCountVO> depEmployeeList = empDao.totalCountDepEmployee();
		// 연도별 직원수
		List<EmployeeCountVO> yearEmployeeList = empDao.totalCountYearEmployee();
		// 이번달 신입사원
		List<EmployeeVO> newEmployeeList = empDao.newEmployeeList();
		
		// 최근 5개월 총 급여
		List<TotalSalaryMonthVO> totalSalaryList = empDao.totalSalary();
		
		model.addAttribute("totalEmployee", totalEmployee);
		model.addAttribute("depEmployeeList", depEmployeeList);
		model.addAttribute("yearEmployeeList", yearEmployeeList);
		model.addAttribute("newEmployeeList", newEmployeeList);
		model.addAttribute("totalSalaryList", totalSalaryList);
		
		return "jsonView";
	}
	
}
