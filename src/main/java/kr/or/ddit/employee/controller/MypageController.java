package kr.or.ddit.employee.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.BoardCompl.dao.ComplboardDAO;
import kr.or.ddit.BoardCompl.vo.ComplboardVO;
import kr.or.ddit.attendance.vo.OverTimeVO;
import kr.or.ddit.businesstrip.vo.BusinessTripVO;
import kr.or.ddit.career.dao.CareerDAO;
import kr.or.ddit.career.service.CareerService;
import kr.or.ddit.career.vo.CareerVO;
import kr.or.ddit.edDocument.vo.DocumentVO;
import kr.or.ddit.employee.dao.MypageMainDAO;
import kr.or.ddit.employee.service.EmployeeService;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import kr.or.ddit.family.dao.FamilyDAO;
import kr.or.ddit.family.service.FamilyService;
import kr.or.ddit.family.vo.FamilyVO;
import kr.or.ddit.license.dao.LicenseDAO;
import kr.or.ddit.license.service.LicenseService;
import kr.or.ddit.license.vo.LicenseVO;
import kr.or.ddit.papers.vo.PapersVO;
import kr.or.ddit.salary.service.SalaryService;
import kr.or.ddit.salary.vo.AllowHistoryVO;
import kr.or.ddit.salary.vo.DdcHistoryVO;
import kr.or.ddit.salary.vo.SalaryDetailVO;
import kr.or.ddit.training.vo.TrainingApplyVO;
import kr.or.ddit.vocation.vo.VocationVO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MypageController {

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
	private ComplboardDAO complDAO;
	
	@Inject
	private SalaryService salaryService;
	
	@Inject
	private MypageMainDAO mDao;

	@ModelAttribute("liList")
	public List<LicenseVO> liList(Authentication authentication, Model model) {

		EmployeeVOWrapper user = (EmployeeVOWrapper) authentication.getPrincipal();
		String empCd = user.getRealUser().getEmpCd();
		PapersVO license = new PapersVO();
		List<LicenseVO> liList = liService.retrieveLiList(empCd);
		license.setLicenseList(liList);
		model.addAttribute("liList", liList);
		return liDAO.licenseList(empCd);
	}

	@ModelAttribute("famList")
	public List<FamilyVO> famList(Authentication authentication, Model model) {

		EmployeeVOWrapper user = (EmployeeVOWrapper) authentication.getPrincipal();
		String empCd = user.getRealUser().getEmpCd();
		PapersVO family = new PapersVO();
		List<FamilyVO> famList = famService.famList(empCd);
		family.setFamilyList(famList);
		model.addAttribute("famList", famList);
		return famDAO.selectFamily(empCd);
	}

	@ModelAttribute("carList")
	public List<CareerVO> carList(Authentication authentication, Model model) {

		EmployeeVOWrapper user = (EmployeeVOWrapper) authentication.getPrincipal();
		String empCd = user.getRealUser().getEmpCd();
		PapersVO career = new PapersVO();
		List<CareerVO> carList = carService.retrieveCarList(empCd);
		career.setCareerList(carList);
		model.addAttribute("carList", carList);
		return carDAO.selectCareer(empCd);
	}

	private final EmployeeService service;

	@RequestMapping("/employee/mypage")
	public String doGet(Authentication authentication, Model model) {
		
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO employee = wrapper.getRealUser();
		String empCd = employee.getEmpCd();
		
		service.retrieveEmpDetail(empCd);
		
		return "mypage/mypage";
	}

	@RequestMapping("/employee/mypageMain.do")
	public String mypageMain(Authentication authentication, Model model) {

		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO employee = wrapper.getRealUser();
		
		// 출근할날, 출근한날
		int totalWeekDay = mDao.totalWeekday();
		int totalAttendance = mDao.totalAttendance(employee);
		// 남은 출근날
		int remainingDays = totalWeekDay - totalAttendance;
		
		int percentageDay = (int)(((double)totalAttendance / (double)totalWeekDay) * 100);
		
		//이번달 초과근무 리스트
		List<OverTimeVO> overTimeList = mDao.selectOverTimeList(employee);

		// 출장예정리스트
		List<BusinessTripVO> businessTripList = mDao.selectBusinessTriplist(employee);
		// 교육 예정리스트
		List<TrainingApplyVO> trainingList = mDao.selectTrainingList(employee);
		// 연가 예정리스트
		List<VocationVO> vacationList = mDao.selectVacationList(employee);
		// 결재문서 리스트
		List<DocumentVO> documentList = mDao.selectDocumentList(employee);
		
		model.addAttribute("totalWeekDay", totalWeekDay);
		model.addAttribute("totalAttendance", totalAttendance);
		model.addAttribute("remainingDays", remainingDays);
		model.addAttribute("percentageDay", percentageDay);
		model.addAttribute("overTimeList", overTimeList);
		model.addAttribute("businessTripList", businessTripList);
		model.addAttribute("trainingList", trainingList);
		model.addAttribute("vacationList", vacationList);
		model.addAttribute("documentList", documentList);
		

		return "mypage/mypageMain";
	}
	
	@RequestMapping("/employee/mypageMainAjax.do")
	public String mypageMainAjax(Authentication authentication, Model model) {
		
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO employee = wrapper.getRealUser();
		
		// 급여리스트
		List<SalaryDetailVO> salaryList = mDao.selectSalaryList(employee);
		// 수당 리스트
		List<AllowHistoryVO> allowList = mDao.selectAllowList(employee);
		// 공제 리스트
		List<DdcHistoryVO> ddcList = mDao.selectDdcList(employee);
		
		model.addAttribute("salaryList", salaryList);
		model.addAttribute("allowList", allowList);
		model.addAttribute("ddcList", ddcList);
		
		return "jsonView";
	}
	
	
	
	
}
