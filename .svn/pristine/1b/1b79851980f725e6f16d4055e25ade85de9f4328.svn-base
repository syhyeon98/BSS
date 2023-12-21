package kr.or.ddit.organization.cotroller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.department.vo.DepartmentVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.organization.service.OrganizationService;
import kr.or.ddit.position.vo.PositionVO;

@Controller
public class OrganizationListController {
	
	@Inject
	private OrganizationService orService;
	
	@ModelAttribute("employee")
	public EmployeeVO employee() {
		return new EmployeeVO();
	}

	@ModelAttribute("department")
	public DepartmentVO department() {
		return new DepartmentVO();
	}

	@ModelAttribute("position")
	public PositionVO position() {
		return new PositionVO();
	}

	@RequestMapping("/organization/Organization")
	public String organization() {

		return "organization/Organization";
	}
	
	@RequestMapping("/Organization")
	@ResponseBody
	public List<EmployeeVO> departmentEmployeeList(
			@RequestParam("depCd") String depCd
			, Model model
			){
		List<EmployeeVO> employee  = orService.departmentEmployeeList(depCd);
		 return employee;
	}
	
	@RequestMapping("/empDetail")
	public String detail(
		@RequestParam("empDetail") String empCd
		, Model model
		){
		EmployeeVO empDetail = orService.retrieveEmpDetail(empCd);
		model.addAttribute("empDetail", empDetail);
		return "organization/detail/empDetail";
	}
	
	@RequestMapping("/pm/appointments/Organization")
	public String organizationPm() {

		return "pm/appointments/Organization";
	}
	
	@RequestMapping("/pm/appointments/OrganizationPage")
	@ResponseBody
	public List<EmployeeVO> departmentEmployeeListPm(
			@RequestParam("depCd") String depCd
			, Model model
			){
		List<EmployeeVO> employee  = orService.departmentEmployeeList(depCd);
		 return employee;
	}
	@RequestMapping("/pm/appointments/ajax/empDetail")
	public String detailPm(
		@RequestParam("empDetail") String empCd
		, Model model
		){
		EmployeeVO empDetail = orService.retrieveEmpDetail(empCd);
		model.addAttribute("empDetail", empDetail);
		return "pm/appointments/ajax/empDetail";
	}
	
}
	


