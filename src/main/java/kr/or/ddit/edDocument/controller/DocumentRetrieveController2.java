//package kr.or.ddit.edDocument.controller;
//
//import java.util.List;
//
//import org.springframework.security.core.Authentication;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import kr.or.ddit.department.vo.DepDocumentVO;
//import kr.or.ddit.edDocument.service.DocumentService;
//import kr.or.ddit.edDocument.vo.DocumentVO;
//import kr.or.ddit.employee.vo.EmployeeVO;
//import kr.or.ddit.employee.vo.EmployeeVOWrapper;
//import kr.or.ddit.pagingVO.PaginationInfo;
//import kr.or.ddit.pagingVO.SimpleCondition;
//import lombok.RequiredArgsConstructor;
//import lombok.extern.slf4j.Slf4j;
//
//@RequiredArgsConstructor
//@Controller
//@RequestMapping("ed/document/")
//@Slf4j
//public class DocumentRetrieveController2 { // 결재문서 목록 조회 전체
//	
//	private final DocumentService service;
//	
//	@ModelAttribute("document")
//	public DocumentVO document() {
//		return new DocumentVO();
//	}
//	
//	/**
//	 * 결재요청함 - 내가 기안한 문서 중 미승인 상태
//	 * @param model
//	 * @param authentication
//	 * @param empCd
//	 * @return
//	 */
//	@RequestMapping("documentReqList.do")
//	public String documentReqList(
//			Model model
//			, Authentication authentication
//			, @RequestParam(value = "empCd", required = false) String empCd
//	){	
//		// empCd에 로그인한 사용자 정보 담아주기
//		EmployeeVOWrapper empAuth= (EmployeeVOWrapper) authentication.getPrincipal();
//		empCd = empAuth.getRealUser().getEmpCd();
//		
//		List<DocumentVO> documentReqList = service.retrieveRequestList(empCd);
//		model.addAttribute("documentReqList", documentReqList);
//		
//		return "ed/document/documentReqList";
//	}
//	
//	// 임시보관함
//	@RequestMapping("documentKeepList.do")
//	public String documentKeepList(
//			Model model, Authentication authentication, String empCd
//	) {
//	    // empCd에 로그인한 사용자 정보 담아주기
//	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper) authentication.getPrincipal();
//	    empCd = empAuth.getRealUser().getEmpCd();
//
//	    List<DocumentVO> documentKeepList = service.retrieveKeepList(empCd);
//	    model.addAttribute("documentKeepList", documentKeepList);
//		return "ed/document/documentKeepList";
//	}
//	
//
//	/**
//	 * 결재대기함 공통로직
//	 * @param model
//	 * @param authentication
//	 * @param empCd
//	 */
//	private void waitListCommonLogic(
//			Model model, Authentication authentication, String empCd
//	) {
//	    // empCd에 로그인한 사용자 정보 담아주기
//	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper) authentication.getPrincipal();
//	    empCd = empAuth.getRealUser().getEmpCd();
//
//	    List<DocumentVO> documentWaitList = service.retrieveWaitList(empCd);
//	    model.addAttribute("documentWaitList", documentWaitList);
//	}
//	/**
//	 * 결재대기함 - 내가 결재할 순서인 문서
//	 */
//	@RequestMapping("documentWaitList.do")
//	public String documentWaitList(Model model, Authentication authentication, @RequestParam(value = "empCd", required = false) String empCd) {
//		waitListCommonLogic(model, authentication, empCd);
//	    return "ed/document/documentWaitList";
//	}
//	/**
//	 * 결재대기 - 메인화면에 띄우기 위함
//	 */
//	@RequestMapping("mainWaitList.do")
//	public String mainWaitList(Model model, Authentication authentication, @RequestParam(value = "empCd", required = false) String empCd) {
//		waitListCommonLogic(model, authentication, empCd);
//	    return "ed/document/ajax/mainWaitList";
//	}
//	
//	/**
//	 * 수정 필요
//	 * 결재진행함 - 내가 기안한 문서 및 결재선에 포함된 문서
//	 * @param model
//	 * @param authentication
//	 * @param empCd
//	 * @return
//	 */
//	@RequestMapping("documentIngList.do")
//	public String documentIngList(
//			Model model
//			, Authentication authentication
//			, @RequestParam(value = "empCd", required = false) String empCd
//	){
//		// empCd에 로그인한 사용자 정보 담아주기
//		EmployeeVOWrapper empAuth= (EmployeeVOWrapper) authentication.getPrincipal();
//		empCd = empAuth.getRealUser().getEmpCd();
//		
//		List<DocumentVO> documentIngList = service.retrieveIngList(empCd);
//		model.addAttribute("documentIngList", documentIngList);
//		return "ed/document/documentIngList";
//	}	
//	
//	/**
//	 * 참조문서함 - 결재권한은 없지만 참조자로 지정된 문서
//	 */
//	@RequestMapping("documentRefList.do")
//	public String  documentRefList(
//			Model model
//			, Authentication authentication
//			, @RequestParam(value = "empCd", required = false) String empCd
//	){
//		// empCd에 로그인한 사용자 정보 담아주기
//		EmployeeVOWrapper empAuth= (EmployeeVOWrapper) authentication.getPrincipal();
//		empCd = empAuth.getRealUser().getEmpCd();		
//		
//		List<DocumentVO> documentRefList = service.retrieveRefList(empCd);
//		model.addAttribute("documentRefList", documentRefList);
//		return "ed/document/documentRefList";
//	}	
//
//	/**
//	 * 반려문서함 - 내가 기안한 문서 중 반려당한 문서
//	 * @param model
//	 * @param authentication
//	 * @param empCd
//	 * @return
//	 */
//	@RequestMapping("documentReturnList.do")
//	public String documentReturnList(
//			Model model
//			, Authentication authentication
//			, @RequestParam(value = "empCd", required = false) String empCd
//	){
//		// empCd에 로그인한 사용자 정보 담아주기
//		EmployeeVOWrapper empAuth= (EmployeeVOWrapper) authentication.getPrincipal();
//		empCd = empAuth.getRealUser().getEmpCd();
//		
//		List<DocumentVO> documentReturnList = service.retrieveReturnList(empCd);
//		model.addAttribute("documentReturnList", documentReturnList);
//		return "ed/document/documentReturnList";
//	}	
//	
//	// 수신함
//	@RequestMapping("documentRegReceptionList.do")
//	public String documentRegReceptionList(Authentication authentication, Model model){
//		
//		// 현재 로그인 정보
//		EmployeeVOWrapper wrapper = (EmployeeVOWrapper)authentication.getPrincipal();
//		EmployeeVO employeeVO = wrapper.getRealUser();
//		
//		// 수신함의 정보를 조회하기위해 현재로그인한 사용자의 부서코드
//		DepDocumentVO depDoc = new DepDocumentVO();
//		depDoc.setDepCd(employeeVO.getDepCd());
//		
//		List<DepDocumentVO> depDocList = service.retrieveFinDepDocument(depDoc);
//		
//		model.addAttribute("depDocList", depDocList);
//		
//		return "ed/document/documentRegReceptionList";
//	}	
//	
//	/**
//	 * 검색을 위한 simpleCondition
//	 * @return
//	 */
//	@ModelAttribute("simpleCondition")
//	public SimpleCondition simpleCondition() {
//	      return new SimpleCondition();
//	}
//	
//	/**
//	 * 보관함 - 내가 속한 부서의 승인완료문서 전체
//	 * 보관함 접속 시 첫 페이지
//	 * @return
//	 */
//	@RequestMapping("regPublicList.do")
//	public String regPublicList() {
//		return "ed/document/regPublicList"; // 여기에 documentRegPublicList 삽입됨
//	}
//	
//	/**
//	 * 보관함 목록 출력 부분
//	 * @param authentication
//	 * @param depCd
//	 * @param currentPage
//	 * @param simpleCondition
//	 * @param model
//	 * @return
//	 */
//	@RequestMapping("documentRegPublicList.do")
//	public String documentRegPublicList(
//			Authentication authentication
//			, @RequestParam(value = "depCd", required = false) String depCd
//			, @RequestParam(name = "page", required = false, defaultValue = "1") long currentPage
//			, @ModelAttribute("simpleCondition") SimpleCondition simpleCondition
//			, Model model
//	){
//		// depCd에 로그인한 사용자 부서 정보 담아주기@gksmf171
//		EmployeeVOWrapper empAuth= (EmployeeVOWrapper) authentication.getPrincipal();
//		depCd = empAuth.getRealUser().getDepCd();
//		
//		PaginationInfo<DocumentVO> paging = new PaginationInfo<>(10, 5); // 페이지수 테스트
//		paging.setCurrentPage(currentPage);
//		paging.setSimpleCondition(simpleCondition);
//		paging.setDepCd(depCd); // 부서 기준으로 조회하므로 PaginationInfo에 setter 추가 후 넘겨주기
//		
//		List<DocumentVO> documentRegPublicList = service.retrieveRegPublicList(paging);
//		paging.setDataList(documentRegPublicList);	// 페이징에 정보 담아준 후
//		model.addAttribute("paging", paging);		// 함께 모델에 넘기기
//		
//		return "ed/document/ajax/documentRegPublicList";
//	}	
//	
//}
