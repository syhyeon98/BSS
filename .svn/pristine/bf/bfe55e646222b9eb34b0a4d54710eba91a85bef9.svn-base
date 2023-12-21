package kr.or.ddit.edDocument.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.edApproval.vo.SignpathEmpVO;
import kr.or.ddit.edDocument.dao.MyDocumentDAO;
import kr.or.ddit.edDocument.service.MyDocumentService;
import kr.or.ddit.edDocument.vo.DocumentVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.pagingVO.SimpleCondition;

@Controller
@RequestMapping("ed/document/")
public class MyDocumentController {

	@Inject
	private MyDocumentDAO myDocDao;

	@Inject
	private MyDocumentService myDocService;

	/**
	 * 나의 문서함
	 * 
	 * @return
	 */
	@RequestMapping("myDocument.do")
	public String myDocument(Authentication authentication, Model model
			,@ModelAttribute("simpleCondition") SimpleCondition simpleCondition) {

		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO employee = wrapper.getRealUser();

		int totalCount = myDocDao.selectTotalDocument(employee); // 총
		int totalIngCount = myDocDao.selectTotalDocumentD01(employee); // 진행중
		int totalSuccessCount = myDocDao.selectTotalDocumentD02(employee); // 승인
		int totalReturnCount = myDocDao.selectTotalDocumentD04(employee);// 반려

		model.addAttribute("totalCount", totalCount);
		model.addAttribute("totalIngCount", totalIngCount);
		model.addAttribute("totalSuccessCount", totalSuccessCount);
		model.addAttribute("totalReturnCount", totalReturnCount);
		return "ed/document/myDocument";
	}

	@PostMapping("myDocumentList.do")
	public String myDocumentList(Authentication authentication, Model model,
			@RequestBody PaginationInfo<DocumentVO> jsonPaging
			) {
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO employee = wrapper.getRealUser();

		Map<String, Object> conditionMap = new HashMap<String, Object>();
		conditionMap.put("empCd", employee.getEmpCd());
		conditionMap.put("code", jsonPaging.getDetailCondition().get("code"));
		// 페이징을 위한
		PaginationInfo<DocumentVO> paging = new PaginationInfo<>(5, 5);
		paging.setDetailCondition(conditionMap);
		paging.setCurrentPage(jsonPaging.getCurrentPage());
		List<DocumentVO> documentList = myDocService.retrieveDocumentList(paging);
		paging.setDataList(documentList);
		
		// 결재선불러오기
		List<SignpathEmpVO> signpathEmpList =  myDocDao.selectSignpathEmpList();
		
		
		model.addAttribute("paging", paging);
		model.addAttribute("signpathEmpList", signpathEmpList);
		return "ed/document/ajax/myDocumentList";
	}

}
