package kr.or.ddit.employee.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.business.dao.BusinessDAO;
import kr.or.ddit.business.vo.BusinessVO;
import kr.or.ddit.career.dao.CareerDAO;
import kr.or.ddit.department.dao.DepartmentDAO;
import kr.or.ddit.department.vo.DepartmentVO;
import kr.or.ddit.employee.service.EmployeeService;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.family.dao.FamilyDAO;
import kr.or.ddit.license.dao.LicenseDAO;
import kr.or.ddit.license.vo.LicenseVO;
import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.pagingVO.SimpleCondition;
import kr.or.ddit.position.dao.PositionDAO;
import kr.or.ddit.position.vo.PositionVO;


@Controller
public class EmployeeController {
	@Inject
	private EmployeeService service;
	@Inject
	private DepartmentDAO depDAO;
	@Inject
	private PositionDAO poDAO;
	@Inject
	private BusinessDAO busDAO;
	
	
	@ModelAttribute("employee")
	public EmployeeVO employee() {
		return new EmployeeVO();
	}
	
	@ModelAttribute("simpleCondition")
	public SimpleCondition simpleCondition() {
		return new SimpleCondition();
	}
	@ModelAttribute("depList")
	public List<DepartmentVO> depList() {
		return depDAO.depList();
	}
	@ModelAttribute("poList")
	public List<PositionVO> poList() {
		return poDAO.poList();
	}
	@ModelAttribute("busList")
	public List<BusinessVO> busList(){
		return busDAO.busList();
	}
	

	@RequestMapping("/pm/appointments/employeeList")
	public String employeeList(
			@RequestParam(name = "page", required = false, defaultValue = "1")
			long currentPage
			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
			, Model model
			) {
		PaginationInfo<EmployeeVO> paging = new PaginationInfo<>(25, 5);
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(simpleCondition);
		
		List<EmployeeVO> employeeList = service.retrieveEmpList(paging);
		paging.setDataList(employeeList);
		model.addAttribute("paging", paging);
		return "pm/appointments/ajax/employeeList";
	}
	
	@RequestMapping("/pm/appointments/employeeAllList")
	public String employeeAllList() {
		return "pm/appointments/employeeAllList";
	}

	@RequestMapping("/main/empRoleList")
	public String empRoleList(
			Model model
			) {
		List<EmployeeVO> empRoleList = service.empRoleList();
		model.addAttribute("empRoleList", empRoleList);
		return "pm/appointments/ajax/mainEmpRole";
	}
	
	
}
