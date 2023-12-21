package kr.or.ddit.resignation.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.career.dao.CareerDAO;
import kr.or.ddit.career.service.CareerService;
import kr.or.ddit.career.vo.CareerVO;
import kr.or.ddit.employee.dao.EmployeeDAO;
import kr.or.ddit.employee.service.EmployeeService;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.family.dao.FamilyDAO;
import kr.or.ddit.family.service.FamilyService;
import kr.or.ddit.family.vo.FamilyVO;
import kr.or.ddit.license.dao.LicenseDAO;
import kr.or.ddit.license.service.LicenseService;
import kr.or.ddit.license.vo.LicenseVO;
import kr.or.ddit.pagingVO.SimpleCondition;
import kr.or.ddit.resignation.service.ResignationService;
import kr.or.ddit.resignation.vo.ResignationVO;

@Controller

public class ResignationDetailController {
	
	@Inject
	private ResignationService reService;
	@Inject
	private LicenseService liService;
	@Inject
	private FamilyService famService;
	@Inject
	private CareerService carService;
	@Inject
	private FamilyDAO famDAO;
	@Inject
	private LicenseDAO liDAO;
	@Inject
	private CareerDAO carDAO;
	@Inject
	private EmployeeService empService;
	@Inject
	private EmployeeDAO empDAO;
	
	@ModelAttribute("resignation")
	public ResignationVO resignation() {
		return new ResignationVO();
	}
	@ModelAttribute("employee")
	public EmployeeVO employee(
			@RequestParam(name = "who")String empCd
			, Model model
			) {
		EmployeeVO employee = empService.retrieveEmpDetail(empCd);
		model.addAttribute("employee", employee);
		return empDAO.empDetail(empCd);
	}
	
	@ModelAttribute("liList")
	public List<LicenseVO> liList(
			@RequestParam(name = "who")String empCd
			, Model model
			){
		List<LicenseVO> liList = liService.retrieveLiList(empCd);
		model.addAttribute("liList", liList);
		return liDAO.licenseList(empCd);
	}
	@ModelAttribute("famList")
	public List<FamilyVO> famList(
			@RequestParam(name = "who")String empCd
			, Model model
			){
		List<FamilyVO> famList = famService.famList(empCd);
		model.addAttribute("famList", famList);
		return famDAO.selectFamily(empCd);
	}
	@ModelAttribute("carList")
	public List<CareerVO> carList(
			@RequestParam(name = "who")String empCd
			, Model model
			){
		List<CareerVO> carList = carService.retrieveCarList(empCd);
		model.addAttribute("carList", carList);
		return carDAO.selectCareer(empCd);
	}
	
	@RequestMapping("/pm/resignation/reDetail")
	public String reDetail(
			@RequestParam(name = "who")String empCd
			, Model model
			) {
		ResignationVO reEmp = reService.reEmployeeDetail(empCd);
		model.addAttribute("reEmp", reEmp);
		return "pm/appointments/reEmpDetail";
	}
	

}
