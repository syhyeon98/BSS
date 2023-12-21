package kr.or.ddit.papers.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.career.dao.CareerDAO;
import kr.or.ddit.career.service.CareerService;
import kr.or.ddit.career.vo.CareerVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import kr.or.ddit.family.dao.FamilyDAO;
import kr.or.ddit.family.service.FamilyService;
import kr.or.ddit.family.vo.FamilyVO;
import kr.or.ddit.license.dao.LicenseDAO;
import kr.or.ddit.license.service.LicenseService;
import kr.or.ddit.license.vo.LicenseVO;
import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.papers.service.PapersService;
import kr.or.ddit.papers.vo.PapersVO;
import kr.or.ddit.training.dao.TrainingApplyDAO;
import kr.or.ddit.training.service.TrainingApplyService;
import kr.or.ddit.training.vo.TrainingVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PaperstListController {
	@Inject
	private LicenseService liService;
	@Inject
	private FamilyService famService;
	@Inject
	private CareerService carService;
	@Inject
	private TrainingApplyService taService ;
	
	@Inject
	private FamilyDAO famDAO;
	@Inject
	private LicenseDAO liDAO;
	@Inject
	private CareerDAO carDAO;
	@Inject
	private PapersService pDAO;
//	private TrainingApplyDAO taDao;

	@ModelAttribute("employee")
	public EmployeeVO employee() {
		return new EmployeeVO();
	}
	
	@ModelAttribute("training")
	public TrainingVO training() {
		return new TrainingVO();
	}

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
	
	/**
	 * 리스트를 출력하기 위한 컨트롤러
	 * @param authentication
	 * @param model
	 * @param trainNo
	 * @return
	 */
//	@ModelAttribute("trainAppList")
//	public List<TrainingVO> trainAppList(Authentication authentication, Model model
//			, @RequestParam(value = "trainNo", required = false) String trainNo
//	) {
//		EmployeeVOWrapper user = (EmployeeVOWrapper) authentication.getPrincipal();
//		String empCd = user.getRealUser().getEmpCd(); // 로그인한 empCd 가져오기
//		
//		PaginationInfo<TrainingVO> paging = new PaginationInfo<>(10, 5);
//		paging.setEmpCd(empCd); // empCd 담아주기
//		List<TrainingVO> trainAppList = taService.retrieveMyTrain(paging);
//		paging.setDataList(trainAppList);
//		model.addAttribute("trainAppList", trainAppList);
//		return taDao.selectMyTrain(paging);
//	}

	@RequestMapping("/papers/paperList")
	public String documentListController() {
		return "papers/paperList";
	}

	@RequestMapping("/papers/proPaper")
	public String proPaper() {
		return "papers/proPaper";
	}

	@RequestMapping("/papers/empPaper")
	public String employeePaper() {
		return "papers/empPaper";
	}

	@RequestMapping("/papers/carPaper")
	public String careerPaper() {
		return "papers/carPaper";
	}
	
	/**
	 * 이수증 출력
	 * @param authentication
	 * @param model
	 * @param trainNo
	 * @return
	 */
//	@PostMapping("/papers/trainingPaper")
	@PostMapping("/mypage/trainingPaper")
	public String trainingPaper(
	        Authentication authentication,
	        Model model,
	        @RequestParam(value = "trainNo", required = false) String trainNo
	) {
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO employee = wrapper.getRealUser(); // 로그인 사용자 정보 가져오기
		employee.setTrainNo(Integer.parseInt(trainNo));
	    List<TrainingVO> trainAppList = pDAO.selectMyTrainForPaper(employee);
	    
	    model.addAttribute("trainAppList", trainAppList);
	    model.addAttribute("employee",employee);

	    log.info("여기 왔나요?");

//	    return "papers/trainingPaper";
	    return "mypage/trainingPaper";  // myTraining.jsp에서 전송
	}

}
