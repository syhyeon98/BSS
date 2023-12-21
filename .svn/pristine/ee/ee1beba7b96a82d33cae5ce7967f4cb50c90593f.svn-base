package kr.or.ddit.employee.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.business.dao.BusinessDAO;
import kr.or.ddit.business.vo.BusinessVO;
import kr.or.ddit.career.dao.CareerDAO;
import kr.or.ddit.career.vo.CareerVO;
import kr.or.ddit.department.dao.DepartmentDAO;
import kr.or.ddit.department.vo.DepartmentVO;
import kr.or.ddit.employee.service.EmployeeService;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.family.dao.FamilyDAO;
import kr.or.ddit.family.vo.FamilyVO;
import kr.or.ddit.license.dao.LicenseDAO;
import kr.or.ddit.license.service.LicenseService;
import kr.or.ddit.license.vo.LicenseVO;
import kr.or.ddit.position.dao.PositionDAO;
import kr.or.ddit.position.vo.PositionVO;
import kr.or.ddit.validate.groups.UpdateGroup;

@Controller
@RequestMapping("/pm/appointments/employeeUpdate")
public class EmployeeUpdateController {

	@Inject
	private EmployeeService service;
	@Inject
	private LicenseService liService;
	@Inject
	private DepartmentDAO depDAO;
	@Inject
	private PositionDAO poDAO;
	@Inject
	private BusinessDAO busDAO;
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

	@ModelAttribute("family")
	public FamilyVO family() {
		return new FamilyVO();
	}

	@ModelAttribute("license")
	public LicenseVO license() {
		return new LicenseVO();
	}

	@ModelAttribute("career")
	public CareerVO career() {
		return new CareerVO();
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
	public List<BusinessVO> busList() {
		return busDAO.busList();
	}

	@ModelAttribute("liList")
	public List<LicenseVO> liList(@RequestParam(name = "who") String empCd, Model model) {
		List<LicenseVO> liList = liService.retrieveLiList(empCd);
		model.addAttribute("liList", liList);
		return liDAO.licenseList(empCd);
	}

	@ModelAttribute("famList")
	public List<FamilyVO> famList(@RequestParam(name = "who") String empCd, Model model) {
		List<LicenseVO> liList = liService.retrieveLiList(empCd);
		model.addAttribute("liList", liList);
		return famDAO.selectFamily(empCd);
	}

	@ModelAttribute("carList")
	public List<CareerVO> carList(@RequestParam(name = "who") String empCd, Model model) {
		List<LicenseVO> liList = liService.retrieveLiList(empCd);
		model.addAttribute("liList", liList);
		return carDAO.selectCareer(empCd);
	}

	@GetMapping
	public String employeeView(Model model, @RequestParam(name = "who", required = true) String empCd) {
		EmployeeVO empView = service.retrieveEmpDetail(empCd);
		model.addAttribute("empView", empView);
		return "pm/appointments/employeeUpdate";
	}

	@PostMapping
	public String updateEmployee(@Validated(UpdateGroup.class) @ModelAttribute(name = "empView") EmployeeVO emp,
			Errors errors, Model model) {
		String viewName = null;
		if (!errors.hasErrors()) {
			boolean success = service.modifyEmployee(emp);
			if (success) {
				viewName = "redirect:/pm/appointments/employeeDetail?who=" + emp.getEmpCd();
			} else {
				model.addAttribute("message", "수정 중 문제 발생");
				viewName = "redirect:/pm/appointments/employeeUpdate?who=" + emp.getEmpCd();
			}
		} else {
			viewName = "redirect:/pm/appointments/employeeUpdate?who=" + emp.getEmpCd();
		}
		return viewName;
	}
}
