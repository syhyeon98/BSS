package kr.or.ddit.businesstrip.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.businesstrip.service.BusinessTripService;
import kr.or.ddit.businesstrip.vo.BusinessTripVO;

//출장 삭제
@Controller
public class BusinessTripDeleteController {
	@Inject
	private BusinessTripService service;
	
	@PostMapping("/pm/servicemanagement/businessTripDelete.do")
	@ResponseBody //ajax로 요청할 때는 responsebody를 붙혀줘야함...
	public String businessTripDelete(BusinessTripVO bTripVO) {
		boolean success = service.removeBusinessTrip(bTripVO);
		String result = null;
		if(success) {
			result ="success";
		}else {
			result="fail";
		}
		return result;
	}
	
	/**
	 * [마이페이지] 출장 삭제
	 * @param bTripVO
	 * @return
	 */
	@PostMapping("/mypage/myBusinessTripDelete.do")
	@ResponseBody //ajax로 요청할 때는 responsebody를 붙혀줘야함...
	public String myBusinessTripDelete(BusinessTripVO bTripVO) {
		boolean success = service.removeBusinessTrip(bTripVO);
		String result = null;
		if(success) {
			result ="success";
		}else {
			result="fail";
		}
		return result;
	}
}
