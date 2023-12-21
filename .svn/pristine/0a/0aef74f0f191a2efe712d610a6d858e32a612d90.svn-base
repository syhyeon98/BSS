package kr.or.ddit.employee.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.business.dao.BusinessDAO;
import kr.or.ddit.business.vo.BusinessVO;
import kr.or.ddit.career.vo.CareerVO;
import kr.or.ddit.department.dao.DepartmentDAO;
import kr.or.ddit.department.vo.DepartmentVO;
import kr.or.ddit.employee.service.EmployeeService;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.family.dao.FamilyDAO;
import kr.or.ddit.family.service.FamilyService;
import kr.or.ddit.family.vo.FamilyVO;
import kr.or.ddit.license.vo.LicenseVO;
import kr.or.ddit.position.dao.PositionDAO;
import kr.or.ddit.position.vo.PositionVO;
import kr.or.ddit.validate.groups.InsertGroup;

@Controller
@RequestMapping("/pm/card/employeeCardInsert")
public class EmployeeInsertCotroller {
	
	@Autowired
	private PasswordEncoder pwEncoder;
   
   @Inject
   private EmployeeService service;
   @Inject
   private FamilyService famService;
   @Inject
   private DepartmentDAO depDAO;
   @Inject
   private PositionDAO poDAO;
   @Inject
   private BusinessDAO busDAO;
   @Inject
   private FamilyDAO famDAO;
 
   @ModelAttribute("employee")
   public EmployeeVO employee() {
      return new EmployeeVO();
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
   
   @GetMapping
   public String employeeCard( ) {
      return "pm/card/employeeCard";
   }
   
   @PostMapping
   public String empInsert(
         @Validated(InsertGroup.class) @ModelAttribute(name = "employee") EmployeeVO employee
         , Errors errors    
         , Model model
         ) {
      String viewName = null;
      String password = "";
      String enPassword = "";
      if(!errors.hasErrors()) {
    	 password = employee.getEmpPw();
    	 enPassword = pwEncoder.encode(password); 
    	 employee.setEmpPw(enPassword);
         boolean success = service.createEmployee(employee);
        
         if(success) {
        	model.addAttribute("message"); 
            viewName = "redirect:/pm/appointments/employeeAllList";
         }else {
            model.addAttribute("message", "등록 중 문제 발생");
            viewName = "pm/card/employeeCard";
         }
         
      }else {
         viewName = "pm/card/employeeCard";
      }
      return viewName;
   }
}