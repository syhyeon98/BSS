package kr.or.ddit.salary.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.salary.service.AllowService;
import kr.or.ddit.salary.vo.AllowVO;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;

@Controller
@RequestMapping("/allow/")
public class AllowController {
	
	@Inject
	private AllowService service;
	
	
	
	@RequestMapping("allowList.do")
	public String allowList(Model model) {
		model.addAttribute("allowList", service.retrieveAllowList());
		return "pm/salary/allowList";
	}
	
	
	/**
	 * 수당 추가
	 * @return
	 */
	@RequestMapping("allowInsert.do")
	public String allowInsert(
				@ModelAttribute("allow")@Validated(InsertGroup.class) AllowVO allow
				,Errors errors
				,Model model
			) {
		String viewName = null;
		if(!errors.hasErrors()&&allow.getAllowList().size()>0) {
			boolean success =service.createAllow(allow.getAllowList());
			if(success) {
				viewName= "redirect:/allow/allowList.do";
			}else {
				viewName= "redirect:/allow/allowList.do";
			}
		}else {
			viewName= "redirect:/allow/allowList.do";
		}
		return viewName;
	}
	
	/**
	 * 수당 삭제
	 * @return
	 */
	@RequestMapping("allowDelete.do")
	@ResponseBody
	public String allowDelete(String[] allowCd) {
		boolean success = service.removeAllow(allowCd);
		String result = null;
		if(success) {
			result ="success";
		}else {
			result="fail";
		}
		return result;
	}
	
	/**
	 * 수당 폼
	 * @param allowCd
	 * @param model
	 * @return
	 */
	@GetMapping("allowModify.do")
	public String allowModify(String allowCd
			,Model model
			) {
		AllowVO allow=service.retrieveAllow(allowCd);
		model.addAttribute("allow",allow);
		return "pm/salary/ajax/allowForm";
	}
	
	@PostMapping("allowModify.do")
	public String allowModifyProc(
			@ModelAttribute("allow")@Validated(UpdateGroup.class) AllowVO allow
			,Errors errors
			,Model model
			) {
		String viewName=null;
		if(!errors.hasErrors()) {
			boolean success =service.modifyAllow(allow);
			if(success) {
				viewName= "redirect:/allow/allowList.do";
			}else {
				model.addAttribute("message","수당 수정중 에러발생으로 실패");
				viewName="pm/salary/allowList";
			}
		}else {
			viewName="redirect:/allow/allowList.do";
			model.addAttribute("message","실패");
		}
		return viewName;
	}
	
}
