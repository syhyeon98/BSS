package kr.or.ddit.edApproval.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.atch.vo.AtchFileDetailVO;
import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.edApproval.dao.SignpathDAO;
import kr.or.ddit.edApproval.service.SignpathService;
import kr.or.ddit.edApproval.vo.SignImgVO;
import kr.or.ddit.edApproval.vo.SignpathDetailVO;
import kr.or.ddit.edApproval.vo.SignpathVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import kr.or.ddit.pagingVO.PaginationInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("ed/approval/")
@Slf4j
public class SignpathController {

	@Inject
	private SignpathDAO signpathDao;

	@Inject
	private SignpathService signpathService;

	// 결재선 관리폼
	@RequestMapping("signpathSave.do")
	public String signpathSave(Authentication authentication
			,Model model) {
		
		// 결재도장 가져오기
		//1. 내 사번으로 결재도장테이블에서 첨부파일 번호 가져오기
		SignImgVO signImg = new SignImgVO();
		signImg.setEmpCd(authentication.getName());
		signImg = signpathDao.selectSignImg(signImg);
		if(signImg !=null) {
			//2. 첨부파일번호를 이용하여 파일 가져오기
			AtchFileVO atchFileVO = new AtchFileVO();
			atchFileVO.setAtchNo(signImg.getAtchNo());
			List<AtchFileDetailVO> atchFileDetailList = signpathService.retrieveAtchFile(atchFileVO);
			model.addAttribute("atchFileDetailList",atchFileDetailList);
		}
		return "ed/approval/signpathSave";
	}

	// 결재선 관리
	@PostMapping("signpathSaveList.do")
	public String signpathSaveList(@RequestBody PaginationInfo<SignpathVO> paramPaging
			, Authentication authentication
			,Model model
			) {
		
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO employee = wrapper.getRealUser();
		PaginationInfo<SignpathVO> paging = new PaginationInfo<SignpathVO>(5,5);
		paging.setCurrentPage(paramPaging.getCurrentPage());
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("empCd", employee.getEmpCd());
		paging.setDetailCondition(condition);
		List<SignpathVO> signpathList = signpathService.retrieveSignpathList(paging);
		paging.setDataList(signpathList);
		
		SignpathDetailVO pSignpathDetail = new SignpathDetailVO();
		pSignpathDetail.setEmpCd(employee.getEmpCd());
		List<SignpathDetailVO> signpathDetailList = signpathDao.selectSignpathDetailList(pSignpathDetail);
	
		
		
		model.addAttribute("paging",paging);
	
		model.addAttribute("signpathDetailList",signpathDetailList);
		return "ed/approval/ajax/signpathList";
	}
	
	// 결재선 삭제
	@PostMapping("signPathDelete.do")
	public String signPathDelete(@RequestBody Map<String, Object>paramMap,Model model) {
		
		if(paramMap!=null && !paramMap.isEmpty()) {
			List<String> signpathNoList = (List<String>) paramMap.get("signpathNo");
			
			for(String signpathNo:signpathNoList) {
				SignpathVO signPath = new SignpathVO();
				signPath.setSignpathNo(Integer.parseInt(signpathNo));
				signpathDao.deleteSignPath(signPath);
			}
		}
		model.addAttribute("result",true);
		return "jsonView";
	}

	// 도장생성
	@PostMapping("signImageInsert.do")
	public String signImageInsert(SignImgVO signImg,Authentication authentication) {
		
		signImg.setEmpCd(authentication.getName());
		signpathService.createSignImg(signImg);
		
		return "jsonView";
	}
	
	

}
