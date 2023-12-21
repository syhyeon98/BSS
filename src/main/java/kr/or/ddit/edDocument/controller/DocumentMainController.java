package kr.or.ddit.edDocument.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.department.vo.DepDocumentVO;
import kr.or.ddit.edDocument.dao.DocumentDao;
import kr.or.ddit.edDocument.service.DocumentService;
import kr.or.ddit.edDocument.vo.DocumentVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;

@Controller
@RequestMapping("ed/document/")
public class DocumentMainController {

	@Inject
	private DocumentDao docDao;
	
	@Inject 
	private DocumentService docService;
	
	@RequestMapping("documentMain.do")
	public String mainView(
				Authentication authentication,
				Model model
			) {
		
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO employee = wrapper.getRealUser();
		String empCd = employee.getEmpCd();
		// 대기문서 건수
		int waitCount = docDao.selectWaitTotalCount(empCd);
		// 대기문서 리스트
		List<DocumentVO> waitDocList = docService.retrieveWaitList(empCd);
		
		
		// 진행문서 건수
		int ingCount = docDao.selectIngTotalCount(empCd);
		// 진행문서 리스트
		List<DocumentVO> ingDocList= docService.retrieveIngList(empCd);
	
		// 수신함 건수
		DepDocumentVO depDocument = new DepDocumentVO();
		depDocument.setDepCd(employee.getDepCd());
		int depDocumentCount =docDao.selectFinDepDocumentTotalCount(depDocument);
		// 수신함 리스트
		List<DepDocumentVO> depDocList = docService.retrieveFinDepDocument(depDocument);
		
		// 참조함 건수
		int refCount = docDao.selectRefTotalCount(empCd);
		//
		List<DocumentVO> refDocList = docService.retrieveRefList(empCd);
		
		
		model.addAttribute("waitCount", waitCount); // 대기문서 건수
		model.addAttribute("ingCount", ingCount); // 진행문서 건수
		model.addAttribute("depDocCount",depDocumentCount);// 수신함 건수
		model.addAttribute("refCount",refCount);// 참조함 건수

		model.addAttribute("waitDocList", waitDocList); // 대기문서 
		model.addAttribute("ingDocList", ingDocList); // 진행문서 
		model.addAttribute("depDocList",depDocList);// 수신함 
		model.addAttribute("refDocList",refDocList);// 참조함 
		
		return "ed/document/documentMain";
	}
	
}
