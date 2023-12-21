package kr.or.ddit.family.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.employee.service.EmployeeService;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.family.service.FamilyService;
import kr.or.ddit.family.vo.FamilyVO;
import kr.or.ddit.validate.groups.UpdateGroup;

@Controller
public class FamilyController {

	@Inject
	private FamilyService famService;
	@Inject
	private EmployeeService empService;
	
	@ModelAttribute("famUpdate")
	public FamilyVO family() {
		return new FamilyVO();
	}
	
	@GetMapping("/family/famUpdate")
	public String famModify(
			@RequestParam(name = "who")String empCd
			, String famNo
			, Model model
			) {
		EmployeeVO employee = empService.retrieveEmpDetail(empCd);
		if(employee != null) {
			FamilyVO famUpdate = famService.retrieveFam(famNo);
			model.addAttribute("empCd", empCd);
			model.addAttribute("famUpdate", famUpdate);
		}
		return "pm/appointments/ajax/famUpdate";
	}
	
	
	@PostMapping("/family/famUpdate")
	public String famUpdate(
			@ModelAttribute("famUpdate") @Validated(UpdateGroup.class)FamilyVO famNo
			, Errors errors
			, Model model
		) {
		String viewName = null;
		if(!errors.hasErrors()) {
			boolean success = famService.modifyFamily(famNo);
			if(success) {
				viewName = "redirect:/pm/appointments/employeeUpdate?who=" + famNo.getEmpCd();
			}else {
				model.addAttribute("message","수정 중 에러발생");
				viewName = "redirect:/pm/appointments/employeeUpdate?who=" + famNo.getEmpCd();
			}
		}else {
			viewName = "/pm/appointments/employeeDetail?who=" + famNo.getEmpCd();
			model.addAttribute("message","실패");
		}
		return viewName;
	}
	
	
}
