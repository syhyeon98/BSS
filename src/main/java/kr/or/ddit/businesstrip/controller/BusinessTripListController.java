package kr.or.ddit.businesstrip.controller;



import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.attendance.vo.AttendanceVO;
import kr.or.ddit.businesstrip.service.BusinessTripService;
import kr.or.ddit.businesstrip.vo.BusinessTripVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import kr.or.ddit.pagingVO.PaginationInfo;
import lombok.RequiredArgsConstructor;

/**
 * 출장전체조회
 * 
 */
@Controller
@RequiredArgsConstructor
public class BusinessTripListController {
	private final BusinessTripService service;
	
	/**
	 * 전체조회
	 * @param bTripVO
	 * @return
	 */
	@GetMapping("/pm/servicemanagement/businessTrip")
	public ModelAndView bTripList(
			BusinessTripVO bTripVO
	) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pm/servicemanagement/businessTrip");
		return mav;
	}
	
	/**
	 * 입력한 값 선택 조회
	 * @param bTripVO
	 * @return
	 */
	@PostMapping("/pm/servicemanagement/businessTrip")
	public ModelAndView bTripView(
			BusinessTripVO bTripVO
	) {
		
		List<BusinessTripVO> bTripList = service.retrieveBtrip(bTripVO);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("bTripList", bTripList);
		mav.setViewName("pm/servicemanagement/businessTrip");
		return mav;
	}
	
	
	/**
	 * [마이페이지] 전체조회
	 * @param bTripVO
	 * @return
	 */
	@RequestMapping("/mypage/myBusinessTrip")
	public String myBtripList(
			@RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
			, Authentication authentication
			, BusinessTripVO bTripVO
			, Model model
	) {
		PaginationInfo<BusinessTripVO> paging = new PaginationInfo<>(10, 5);
		paging.setCurrentPage(currentPage);
		
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		String empCd = wrapper.getRealUser().getEmpCd();
		paging.setEmpCd(empCd); //사원번호
		
		List<BusinessTripVO> bTripList = service.mySelectBtrip(paging);
		paging.setDataList(bTripList);
		
		//당월 출장일 총계
		BusinessTripVO totalBtirp = new BusinessTripVO();
		totalBtirp.setEmpCd(empCd);
		int total = service.totalBtrip(totalBtirp);
		
		if (total == 0) {
		    model.addAttribute("total", 0);
		} else {
		    model.addAttribute("total", total);
		}
		

		model.addAttribute("paging",paging);
		
		return "mypage/myBusinessTrip";
	}
	

}
