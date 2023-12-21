package kr.or.ddit.employee.controller;

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
import kr.or.ddit.employee.service.EmployeeService;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.family.dao.FamilyDAO;
import kr.or.ddit.family.service.FamilyService;
import kr.or.ddit.family.vo.FamilyVO;
import kr.or.ddit.license.dao.LicenseDAO;
import kr.or.ddit.license.service.LicenseService;
import kr.or.ddit.license.vo.LicenseVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class EmpDetailController {

	private final EmployeeService service;
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

	@ModelAttribute("employee")
	public EmployeeVO employee() {
		return new EmployeeVO();
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
	
	@RequestMapping("/pm/appointments/employeeDetail")
	public String employeeDetail(@RequestParam(name = "who") String empCd, Model model) {
		EmployeeVO empView = service.retrieveEmpDetail(empCd);
		model.addAttribute("empView", empView);
		return "pm/appointments/employeeDetail";
	}

}
