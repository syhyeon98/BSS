package kr.or.ddit.attendance.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.attendance.service.AttendanceService;
import kr.or.ddit.attendance.vo.AttendanceVO;

/**
 * 출퇴근 삭제
 * @author PC-27
 *
 */
@Controller
public class AttendanceDeleteController {
	@Inject
	private AttendanceService service;
	
	@PostMapping("/pm/servicemanagement/attendanceDelete.do")
	@ResponseBody
	public String attendanceDelete(AttendanceVO attendVO) {
		boolean success = service.removeAttend(attendVO);
		String result = null;
		if(success) {
			result ="success";
		}else {
			result="fail";
		}
		return result;
	}
	
	
	/**
	 * [마이페이지] 출퇴근 삭제
	 * @param attendVO
	 * @return
	 */
	@PostMapping("/mypage/mypageAattendDelete.do")
	@ResponseBody
	public String mypageAattendDelete(AttendanceVO attendVO) {
		boolean success = service.removeAttend(attendVO);
		String result = null;
		if(success) {
			result ="success";
		}else {
			result="fail";
		}
		return result;
	}
}
