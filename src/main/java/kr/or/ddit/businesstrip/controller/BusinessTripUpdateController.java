package kr.or.ddit.businesstrip.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.businesstrip.service.BusinessTripService;
import kr.or.ddit.businesstrip.vo.BusinessTripVO;
import kr.or.ddit.validate.groups.UpdateGroup;

//수정 실행
@Controller
public class BusinessTripUpdateController {
	@Inject
	private BusinessTripService service;
	
	/**
	 * 체크박스 선택해서 모달에 나오는 데이터 처리
	 * @param tripNo
	 * @param model
	 * @return
	 */
	@GetMapping("/pm/servicemanagement/businessTripUpdate.do")
	public String selectOneBtrip(int tripNo, Model model) {
		BusinessTripVO bTrip = service.retrieveOneBtrip(tripNo);
		model.addAttribute("bTrip", bTrip);
		return "pm/servicemanagement/ajax/bTripUpdateForm";
	}
	
	/**
	 * 모달에서 [수정]버튼 눌렀을 때 수정 처리
	 * @param bTrip
	 * @param errors
	 * @param model
	 * @return
	 */
	@PostMapping("/pm/servicemanagement/businessTripUpdate.do")
	public String bTripModify(
			@ModelAttribute("bTrip") @Validated(UpdateGroup.class) BusinessTripVO bTrip
			, Errors errors
			, Model model
	) {
		
		String viewName=null;
		if(!errors.hasErrors()) {
			boolean success = service.modifyBusinessTrip(bTrip);
			if(success) {
				viewName = "redirect:/pm/servicemanagement/businessTrip";
			}else {
				model.addAttribute("message", "출장 수정 중 에러발생");
				viewName = "pm/servicemanagement/businessTrip";
			}
		}else {
			viewName="redirect:/pm/servicemanagement/businessTrip";
			model.addAttribute("message", "실패");
		}
		return viewName;
	}
	
	
	/**
	 * [마이페이지] 모달에서 [수정]버튼 눌렀을 때 수정 처리
	 * @param bTrip
	 * @param errors
	 * @param model
	 * @return
	 */
	@PostMapping("/mypage/myBusinessTripUpdate.do")
	public String myBtripModify(
			@ModelAttribute("bTrip") @Validated(UpdateGroup.class) BusinessTripVO bTrip
			, Errors errors
			, Model model
	) {
		
		String viewName=null;
		if(!errors.hasErrors()) {
			boolean success = service.modifyBusinessTrip(bTrip);
			if(success) {
				viewName = "redirect:/mypage/myBusinessTrip";
			}else {
				model.addAttribute("message", "출장 수정 중 에러발생");
				viewName = "mypage/myBusinessTrip";
			}
		}else {
			viewName="redirect:/mypage/myBusinessTrip";
			model.addAttribute("message", "실패");
		}
		return viewName;
	}
	
	
	/**
	 * [마이페이지] 체크박스 선택해서 모달에 나오는 데이터 처리
	 * @param tripNo
	 * @param model
	 * @return
	 */
	@GetMapping("/mypage/myBusinessTripUpdate.do")
	public String mySelectOneBtrip(int tripNo, Model model) {
		BusinessTripVO bTrip = service.retrieveOneBtrip(tripNo);
		model.addAttribute("bTrip", bTrip);
		return "mypage/ajax/myBtripUpdateForm";
	}
	
	
	
}
