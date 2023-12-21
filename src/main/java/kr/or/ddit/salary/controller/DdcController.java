package kr.or.ddit.salary.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.salary.service.DdcService;
import kr.or.ddit.salary.vo.DdcVO;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;

@Controller
@RequestMapping("/ddc/")
public class DdcController {

	@Inject
	private DdcService service;
	
	/**
	 * 공제 리스트
	 * @param model
	 * @return
	 */
	@RequestMapping("ddcList.do")
	public String ddcList(Model model) {
		model.addAttribute("ddcList", service.retrieveDdcList());
		return "pm/salary/ddcList";
	}
	
	/**
	 * 공제 추가
	 * @return
	 */
	@RequestMapping("ddcInsert.do")
	public String ddcInsert(
			@ModelAttribute("ddc")@Validated(InsertGroup.class) DdcVO ddc
			,Errors errors
			,Model model
		) {
		String viewName = null;
		if(!errors.hasErrors()&&ddc.getDdcList().size()>0) {
			boolean success =service.createDdc(ddc.getDdcList());
			if(success) {
				viewName= "redirect:/ddc/ddcList.do";
			}else {
				viewName="redirect:/ddc/ddcList.do";
			}
		}else {
			viewName="redirect:/ddc/ddcList.do";
		}
		return viewName;
	}
	
	/**
	 * 공제 삭제
	 * @return
	 */
	@RequestMapping("ddcDelete.do")
	@ResponseBody
	public String ddcDelete(String[] ddcCd) {
		boolean success = service.removeDdc(ddcCd);
		String result = null;
		if(success) {
			result ="success";
		}else {
			result="fail";
		}
		return result;
	}
	
	/**
	 * 공제 수정폼
	 * @return
	 */
	@GetMapping("ddcModify.do")
	public String ddcModify(String ddcCd
			,Model model
			) {
		DdcVO ddc=service.retrieveDdc(ddcCd);
		model.addAttribute("ddc",ddc);
		return "pm/salary/ajax/ddcForm";
	}
	
	@PostMapping("ddcModify.do")
	public String ddcModifyProc(
			@ModelAttribute("ddc")@Validated(UpdateGroup.class) DdcVO ddc
			,Errors errors
			,Model model
			) {
		String viewName=null;
		if(!errors.hasErrors()) {
			boolean success =service.modifyDdc(ddc);
			if(success) {
				viewName= "redirect:/ddc/ddcList.do";
			}else {
				model.addAttribute("message","공제 수정중 에러발생으로 실패");
				viewName="pm/salary/ddcList";
			}
		}else {
			viewName="redirect:/ddc/ddcList.do";
			model.addAttribute("message","실패");
		}
		return viewName;
	}
}
