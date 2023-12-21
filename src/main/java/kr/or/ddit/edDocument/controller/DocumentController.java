package kr.or.ddit.edDocument.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.atch.vo.AtchFileDetailVO;
import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.businesstrip.dao.BusinessTripDAO;
import kr.or.ddit.businesstrip.vo.BusinessTripVO;
import kr.or.ddit.calendar.service.PersonalService;
import kr.or.ddit.calendar.vo.PersonalVO;
import kr.or.ddit.department.dao.DepartmentDAO;
import kr.or.ddit.department.vo.DepDocumentVO;
import kr.or.ddit.department.vo.DepartmentVO;
import kr.or.ddit.edApproval.dao.SignpathDAO;
import kr.or.ddit.edApproval.service.SignpathService;
import kr.or.ddit.edApproval.vo.SignImgVO;
import kr.or.ddit.edApproval.vo.SignpathDetailVO;
import kr.or.ddit.edApproval.vo.SignpathEmpVO;
import kr.or.ddit.edApproval.vo.SignpathVO;
import kr.or.ddit.edDocument.dao.DocumentDao;
import kr.or.ddit.edDocument.service.DocumentService;
import kr.or.ddit.edDocument.vo.DocumentTypeVO;
import kr.or.ddit.edDocument.vo.DocumentVO;
import kr.or.ddit.employee.service.EmployeeService;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import kr.or.ddit.validate.groups.InsertGroup;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("ed/document/")
@RequiredArgsConstructor
@Controller
@Slf4j
public class DocumentController {

	private final DocumentService service;

	@Inject
	private DocumentDao documentDao;
	
	@Inject
	private DepartmentDAO departmentDao;
	
	@Inject
	private EmployeeService empService;
	
	@Inject
	private SignpathDAO signpathDao;
	
	@Inject
	private SignpathService signpathService;

	@Inject
	private PersonalService personalService;
	
	@Inject
	private BusinessTripDAO bTripDao;
	
	@ModelAttribute("document")
	public DocumentVO document() {
		return new DocumentVO();
	}
	
	@ModelAttribute("departmentList")
	public List<DepartmentVO> departmentList() {
		return departmentDao.depList();
	}

	/**
	 * 결재선 불러오기 클릭시 결재선 조회
	 * 
	 * @param authentication
	 * @param model
	 * @return
	 */
	@RequestMapping("signPathList.do")
	public String signPathDetailList(Authentication authentication, Integer signpathNo, Model model) {
		String empCd = authentication.getName();
		SignpathDetailVO signpathDetail = new SignpathDetailVO();
		signpathDetail.setEmpCd2(empCd);
		if (signpathNo != null) {
			signpathDetail.setSignpathNo(signpathNo);
		}
		List<SignpathDetailVO> signpathDetailList = documentDao.selectSignPathDetailList(signpathDetail);
		model.addAttribute("signpathDetailList", signpathDetailList);
		return "jsonView";
	}

	/**
	 * 결재선 추가
	 * 
	 * @param reqSignPathDetail
	 * @param authentication
	 * @param model
	 * @return
	 */
	@PostMapping("signPathCreate.do")
	public String signPathCreate(@RequestBody SignpathDetailVO reqSignPathDetail, Authentication authentication,
			Model model) {

		String empCd = authentication.getName(); // 로그인 사번

		log.info("받아온 signPathDetail: {}", reqSignPathDetail);

		// 결재선 등록
		SignpathVO signpath = new SignpathVO();
		signpath.setEmpCd(empCd);
		signpath.setSignpathNm(reqSignPathDetail.getSignpathNm());
		documentDao.insertSignPath(signpath);
		int signpathNo = signpath.getSignpathNo();// 등록된 결재선번호 가져옴

		// 결재상세 등록
		SignpathDetailVO signpathDetailVO = new SignpathDetailVO();
		signpathDetailVO.setEmpCd2(empCd);// 소유자
		signpathDetailVO.setSignpathNo(signpathNo);
		for (int i = 0; i < reqSignPathDetail.getSelectSn().size(); i++) {
			signpathDetailVO.setEmpCd(reqSignPathDetail.getSelectEmpCodes().get(i));
			signpathDetailVO.setSdTurn(reqSignPathDetail.getSelectSn().get(i));
			signpathDetailVO.setCodeMethod(reqSignPathDetail.getSelectMethodsCodes().get(i));
			documentDao.insertSignPathDetail(signpathDetailVO);
		}

		// 방금 추가한 결재상세 리스트 가져오기
		List<SignpathDetailVO> signpathDetailList = documentDao.selectSignPathDetailList(signpathDetailVO);
		model.addAttribute("signpathDetailList", signpathDetailList);

		return "jsonView";
	}

	/**
	 * 문서 양식 상세(insertForm) 조회
	 * 
	 * @param dtNo
	 * @param model
	 * @param authentication
	 * @return
	 */
	@GetMapping("documentForm.do")
	public String documentForm(@RequestParam(value = "dtNo", required = false) Integer dtNo, Model model,
			Authentication authentication) {
		log.info("선택된 양식번호 >>>>>>>>>> {}", dtNo);

		EmployeeVOWrapper empAuth = (EmployeeVOWrapper) authentication.getPrincipal();
//		log.info("현재 인증된 사용자의 사원이름 : {}",empAuth.getRealUser().getEmpName());
//		log.info("현재 인증된 사용자의 부서이름 : {}",empAuth.getRealUser().getDepName());
		model.addAttribute("empAuth", empAuth);

		String viewName = "";
		if (dtNo != null) {
			// 선택한 dtGroup으로 해당 양식 내용을 DB에서 조회
			DocumentTypeVO DocumentCont = service.retrieveDtCont(dtNo);
			model.addAttribute("DocumentCont", DocumentCont);
			viewName = "ed/document/documentForm";
		} else {
			viewName = "ed/document/documentTypeList";
		}
		return viewName;
	}

	/**
	 * 임시저장된 결재서류 상세
	 * @param docNo
	 * @param model
	 * @param authentication
	 * @return
	 */
	@GetMapping("documentTempForm.do")
	public String documentTempForm(@RequestParam(value = "docNo", required = false) String docNo, Model model,
			Authentication authentication) {
		log.info("선택된 양식번호 >>>>>>>>>> {}", docNo);

		EmployeeVOWrapper empAuth = (EmployeeVOWrapper) authentication.getPrincipal();
//		log.info("현재 인증된 사용자의 사원이름 : {}",empAuth.getRealUser().getEmpName());
//		log.info("현재 인증된 사용자의 부서이름 : {}",empAuth.getRealUser().getDepName());
		model.addAttribute("empAuth", empAuth);

		String viewName = "";
		if (docNo != null) {
			// 선택한 dtGroup으로 해당 양식 내용을 DB에서 조회
			DocumentVO documentVO = service.retrieveDocument(docNo); // 문서가져옴
			DocumentTypeVO documentCont = service.retrieveDtCont(documentVO.getDtNo());
			
			// 수신처 가져오기
			DepDocumentVO depDocuemntVO = new DepDocumentVO();
			depDocuemntVO.setDocNo(docNo);
			List<DepDocumentVO> depDocumentList = service.retrieveDepDocument(depDocuemntVO);
			
			
			// 결재자들
			SignpathEmpVO signpathEmp = new SignpathEmpVO();
			signpathEmp.setDocNo(docNo);
			List<SignpathEmpVO> signpathEmpList = service.retrieveSignpathEmpList(signpathEmp);
			model.addAttribute("documentVO", documentVO);
			model.addAttribute("DocumentCont", documentCont);
			model.addAttribute("signpathEmpList", signpathEmpList);
			model.addAttribute("selectDepDocumentList", depDocumentList );
			viewName = "ed/document/documentTempForm";
		} else {
			viewName = "ed/document/documentTypeList";
		}
		return viewName;
	}

	/**
	 * 문서 양식 상세(insertForm) 인서트
	 */
	@PostMapping("documentForm.do")
	public String documentInsert(
			@Validated(InsertGroup.class) @ModelAttribute("documentVO") DocumentVO documentVO,
			Errors errors, Model model ,Authentication authentication) {

		log.info("documentVO : {}", documentVO);
		String viewName = "";
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO employee = wrapper.getRealUser();
		if (!errors.hasErrors()) {
			boolean success = service.createDocument(documentVO,employee.getDepCd());
			if (success) {

				viewName = "redirect:/ed/document/documentReqList.do";
			} else {
				model.addAttribute("message", "새글 작성중 문제 발생");
				viewName = "redirect:ed/document/documentForm";
			}
		} else {
			viewName = "ed/document/documentForm";
		}
		return viewName;
	}

	/**
	 * 첫 기안작성시 임시저장
	 * 
	 * @param documentVO
	 * @param errors
	 * @param model
	 * @return
	 */
	@PostMapping("documentTempForm.do")
	public String documentTempInsert(@ModelAttribute("documentVO") DocumentVO documentVO, Errors errors, Model model,Authentication authentication) {
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO employee = wrapper.getRealUser();
		log.info("documentVO : {}", documentVO);
		String viewName = "";
		if (!errors.hasErrors()) {
			
			boolean success = service.createDocument(documentVO,employee.getDepCd());
			if (success) {

				viewName = "redirect:/ed/document/documentReqList.do";
			} else {
				model.addAttribute("message", "새글 작성중 문제 발생");
				viewName = "redirect:ed/document/documentForm";
			}
		} else {
			viewName = "ed/document/documentForm";
		}
		return viewName;
	}

	/**
	 * 
	 * 임시저장글 요청 또는 다시 임시저장
	 * 
	 * @param documentVO
	 * @param errors
	 * @param model
	 * @return
	 */
	@PostMapping("documentTempUpdate.do")
	public String documentTempUpdate(@ModelAttribute("documentVO") DocumentVO documentVO, Errors errors, Model model,Authentication authentication) {
		EmployeeVOWrapper wrapper = (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO employee = wrapper.getRealUser();
		log.info("documentVO : {}", documentVO);
		String viewName = "";
		if (!errors.hasErrors()) {
			boolean success = service.modifyDocumentTemp(documentVO,employee.getDepCd());
			if (success) {
				viewName = "redirect:/ed/document/documentReqList.do";
			} else {
				model.addAttribute("message", "새글 등록중 문제 발생");
				viewName = "redirect:ed/document/documentForm";
			}
		} else {
			viewName = "ed/document/documentForm";
		}
		return viewName;
	}

	@PostMapping("documentTempDelete.do")
	public String documentTempDelete(@RequestBody DocumentVO documentVO, Errors errors, Model model) {

		log.info("documentVO : {}", documentVO);
		String viewName = "jsonView";
		boolean success = false;
		if (!errors.hasErrors()) {
			for (String docNo : documentVO.getDocArrayNo()) {
				DocumentVO deleteDoc = new DocumentVO();
				deleteDoc.setDocNo(docNo);
				success=service.deleteDocumentTemp(deleteDoc);
				
			}
		} else {
			
		}
		
		if (success) {
			model.addAttribute("result", success);
		} else {
			model.addAttribute("message", "삭제중 문제 발생");
		}
		return viewName;
	}

	// 기안된 문서 조회
//	@RequestMapping("documentFormView.do")
//	public String documentFormView(Model model){
//		return "ed/document/documentFormView";
//	}

	@RequestMapping("documentFormView.do")
	public String documentFormView(@RequestParam(value = "docNo", required = false) String docNo, Model model
					,Authentication authentication
	) {
		log.info("선택된 문서번호 >>>>>>>>>> {}", docNo);

		String viewName = "";
		if (docNo != null) {
			// 현재사용자의읽음 처리
			SignpathEmpVO currentEmp = new SignpathEmpVO();
			currentEmp.setEmpCd(authentication.getName());
			currentEmp.setDocNo(docNo);
			signpathService.modifySignpathEmpRead(currentEmp);
			
			// 선택한 docNo으로 문서 조회
			DocumentVO documentFormView = service.retrieveDocument(docNo);

			// 결재자들
			SignpathEmpVO signpathEmp = new SignpathEmpVO();
			signpathEmp.setDocNo(docNo);
			List<SignpathEmpVO> signpathEmpList = service.retrieveSignpathEmpList(signpathEmp);

			// 첨부파일들
			AtchFileVO atchFileVO = new AtchFileVO();
			atchFileVO.setAtchNo(documentFormView.getAtchNo());
			List<AtchFileDetailVO> atchfileDetailList = service.retrieveAtchFile(atchFileVO);
			
			
			List<AtchFileDetailVO> atchSignImg = new ArrayList<AtchFileDetailVO>();
			for(SignpathEmpVO signpathEmpForImg:signpathEmpList) { // 결재선에 해당하는 결재자들의 이미지를 가져오기위한 반복문
				AtchFileVO atchSignFileVO = new AtchFileVO();
				SignImgVO signImg = new SignImgVO();
				signImg.setEmpCd(signpathEmpForImg.getEmpCd());
				signImg = signpathDao.selectSignImg(signImg);
				if(signImg !=null ) {
					atchSignFileVO.setAtchNo(signImg.getAtchNo());
					if(signImg != null) {
						AtchFileVO signImgFile = new AtchFileVO();
						signImgFile.setAtchNo(signImg.getAtchNo());
						atchSignImg.addAll(signpathService.retrieveAtchFile(atchSignFileVO));
					}
				}
			}
			// 결재선 도장 가져오기
//			SignImgVO signImg = new SignImgVO();
//			signImg.setEmpCd(authentication.getName());
//			signImg = signpathDao.selectSignImg(signImg);
//			if(signImg !=null) {
//				//2. 첨부파일번호를 이용하여 파일 가져오기
//				AtchFileVO atchFileVO = new AtchFileVO();
//				atchFileVO.setAtchNo(signImg.getAtchNo());
//				List<AtchFileDetailVO> atchFileDetailList = signpathService.retrieveAtchFile(atchFileVO);
//				model.addAttribute("atchFileDetailList",atchFileDetailList);
//			}
			
			model.addAttribute("atchSignImg",atchSignImg);
			model.addAttribute("documentFormView", documentFormView);
			model.addAttribute("signpathEmpList", signpathEmpList);
			model.addAttribute("atchfileDetailList", atchfileDetailList);

			viewName = "ed/document/documentFormView";
		} else {
			viewName = "ed/document/documentTypeList"; // 이전 페이지로 돌아가야함
		}
		return viewName;
	}

	/**
	 * 승인또는 반려버튼 클릭시
	 * 
	 * @param docNo
	 * @param model
	 * @return
	 */
	@RequestMapping("signpathEmpUpdate.do")
	public String signpathEmpUpdate(SignpathEmpVO signpathEmp, EmployeeVO empNo, Authentication authentication, Model model) {
		log.info("선택된 문서번호 >>>>>>>>>> {}", signpathEmp.getDocNo());
		log.info("선택된 순번 >>>>>>>>>> {}", signpathEmp.getSdTurn());
		log.info("최대순번 >>>>>>>>>> {}", signpathEmp.getMaxTurn());
		log.info("결재상태 >>>>>>>>>> {}", signpathEmp.getCodeStatus());
		log.info("결재상태 >>>>>>>>>> {}", signpathEmp.getSeReject());
		
		// 어떤 문서인지 알아오기
		DocumentVO document = new DocumentVO();
		document = documentDao.selectDocument(signpathEmp.getDocNo());
		
		
		signpathEmp.setEmpCd(authentication.getName());
		if (signpathEmp.getCodeStatus().equals("SE_02")) {// 승인버튼 클릭시

			// 마지막 결재선까지 승인완료 , 결재상태와 결재문서 업데이트
			// 수신부서에 넣기
			if (signpathEmp.getSdTurn() == signpathEmp.getMaxTurn()) {
				DocumentVO documentVO = new DocumentVO();
//				documentVO.setDocNo(signpathEmp.getDocNo());
				document.setCode("D_02"); // 문서 최종 결재
				if(document.getDtNo()== 46 ) {
					service.modifySignpathEmp(signpathEmp); // 결재상태 승인
					empService.modifyEmpReq(empNo);
					service.modifyDocument(document);
				}else if(document.getDtNo()==81){
					service.modifySignpathEmp(signpathEmp); // 결재상태 승인
					// 캘린더에 넣어주기 위함
					PersonalVO personal = new PersonalVO();
					personal.setEmpCd(document.getEmpCd());
					personal.setPerTitle("출장");
					// docNo에 맞는 시작일 가져와서 
					BusinessTripVO bTrip = bTripDao.selectBtripForCalendar(document);
					personal.setPerStart(bTrip.getTripSdate().toString());
					// docNo에 맞는 종료일 가져와서
					personal.setPerEnd(bTrip.getTripEdate().toString());
					// docNo에 맞는 목적 , 장소
					personal.setPerCont("목적 : " + bTrip.getTripPurpose() + "\n장소 : "+ bTrip.getTripPlace()); 
					personalService.createPersonal(personal);
					
					service.modifyDocument(document);
				}else {
				service.modifySignpathEmp(signpathEmp); // 결재상태 승인
				service.modifyDocument(document);
			}
				
				
			} else { // 마지막 결재선이 아닌 사람의 승인, 결재상태만 업데이트
				service.modifySignpathEmp(signpathEmp);
				
			}
		} else if (signpathEmp.getCodeStatus().equals("SE_03")) { // 반려시 결재상태와 결재문서 업데이트
			DocumentVO documentVO = new DocumentVO();
			documentVO.setDocNo(signpathEmp.getDocNo());
			documentVO.setCode("D_04"); // 문서 반려
			service.modifySignpathEmp(signpathEmp); // 결재상태 반려 변경
			service.modifyDocument(documentVO);
		}

		List<SignpathEmpVO> signpathEmpList = service.retrieveSignpathEmpList(signpathEmp);
		model.addAttribute("signpathEmpList", signpathEmpList);
		return "jsonView";
	}
	
	
	
//	session.setAttribute("message","ㅇㅇ로 이동합니다."); // 이동하고 alert창에 저 메세지 내용 뜸
}
