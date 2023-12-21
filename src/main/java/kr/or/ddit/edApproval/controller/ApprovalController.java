package kr.or.ddit.edApproval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ApprovalController {

	// 대결자 관리
	@RequestMapping("ed/approval/delegateApprover.do")
	public String delegateApprover(){
		return "ed/approval/delegateApprover";
	}
	
}
