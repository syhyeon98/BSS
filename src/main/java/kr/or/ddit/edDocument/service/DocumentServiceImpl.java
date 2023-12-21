package kr.or.ddit.edDocument.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.atch.service.AtchFileService;
import kr.or.ddit.atch.vo.AtchFileDetailVO;
import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.department.vo.DepDocumentVO;
import kr.or.ddit.department.vo.DepartmentVO;
import kr.or.ddit.edApproval.vo.HelpDetailVO;
import kr.or.ddit.edApproval.vo.SignpathDetailVO;
import kr.or.ddit.edApproval.vo.SignpathEmpVO;
import kr.or.ddit.edDocument.dao.DocumentDao;
import kr.or.ddit.edDocument.vo.DocumentTypeVO;
import kr.or.ddit.edDocument.vo.DocumentVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import kr.or.ddit.pagingVO.PaginationInfo;

@Service
public class DocumentServiceImpl implements DocumentService {

	@Inject
	private DocumentDao documentDao;

	@Inject
	private AtchFileService atchService;

	@Value("#{appInfo.documentFilePath}")
	private Resource atchPath;

	/**
	 * 문서 양식 목록 조회
	 */
	@Override
	public List<DocumentTypeVO> retrieveDocumentTypeList() {
		return documentDao.selectDocumentTypeList();
	}

	/**
	 * 결재요청함
	 */
	@Override
	public List<DocumentVO> retrieveKeepList(String empCd) {
		return documentDao.retrieveKeepList(empCd);
	}

	/**
	 * 결재요청함
	 */
	@Override
	public List<DocumentVO> retrieveRequestList(String empCd) {
		return documentDao.selectReqList(empCd);
	}

	/**
	 * 결재대기함
	 */
	@Override
	public List<DocumentVO> retrieveWaitList(String empCd) {
		return documentDao.selectWaitList(empCd);
	}

	/**
	 * 결재진행함
	 */
	@Override
	public List<DocumentVO> retrieveIngList(String empCd) {
		return documentDao.selectIngList(empCd);
	}

	/**
	 * 참조문서함
	 */
	@Override
	public List<DocumentVO> retrieveRefList(String empCd) {
		return documentDao.selectRefList(empCd);
	}

	/**
	 * 결재진행함
	 */
	@Override
	public List<DocumentVO> retrieveReturnList(String empCd) {
		return documentDao.selectReturnList(empCd);
	}

	/**
	 * 보관함, paging에 depCd 정보 포함됨
	 */
	@Override
	public List<DocumentVO> retrieveRegPublicList(PaginationInfo paging) {
		long totalRecord = documentDao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return documentDao.selectRegPublicList(paging);
	}

	/**
	 * 양식 생성(insert)
	 */
	@Override
	public boolean createForm(DocumentTypeVO docTypeVO) {
		return documentDao.insertForm(docTypeVO) > 0;
	}

	/**
	 * 문서 양식 상세
	 */
	@Override
	public DocumentTypeVO retrieveDtCont(Integer dtNo) {
		return documentDao.selectDtCont(dtNo);
	}

	/**
	 * 기안된 문서 조회
	 */
	@Override
	public DocumentVO retrieveDocument(String docNo) {
		return documentDao.selectDocument(docNo);
	}

	/**
	 * 결재문서 등록시 첨부파일
	 * 
	 * @param board
	 */
	private void processAtchFileGroup(DocumentVO document) {
		MultipartFile[] documentFiles = document.getDocumentFiles();
		if (documentFiles == null)
			return;
		List<AtchFileDetailVO> detailList = new ArrayList<>();
		for (MultipartFile documentFile : documentFiles) {
			if (documentFile.isEmpty())
				continue;
			detailList.add(new AtchFileDetailVO(documentFile));
		}

		if (detailList.size() > 0) {
			AtchFileVO fileGroup = new AtchFileVO();
			fileGroup.setDetailList(detailList);
			try {
				// 1. 첨부파일의 메타 데이터 저장
				// 2. 첨부파일의 2진 데이터 저장
				int atchNo = atchService.createAtchFileGroup(fileGroup, atchPath);
				document.setAtchNo(atchNo);
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}

	}

	/**
	 * 문서 insert
	 */
	@Override
//	public boolean createDocument(DocumentVO documentVO) {
	public boolean createDocument(DocumentVO documentVO,String pDepCd) {
		processAtchFileGroup(documentVO);

		int result = documentDao.insertDocument(documentVO);

		if (result > 0) { // 기안문 등록 성공시
			String docNo = documentVO.getDocNo(); // 인서트한 document의 번호 받아오기

			// 결재상태 등록 -> 결재선번호와 직원사번(소유자,empCd2)를 이용하여 결재상세를 불러와 그걸 결재상태에 문서번호와 넣어줌
			SignpathDetailVO signpathDetailVO = new SignpathDetailVO();
			signpathDetailVO.setSignpathNo(documentVO.getSignpathNo());
			signpathDetailVO.setEmpCd2(documentVO.getEmpCd());
			List<SignpathDetailVO> signpathDetailList = documentDao.selectSignPathDetailList(signpathDetailVO);
			
			if(documentVO.getDepCdList() == null || documentVO.getDepCdList().size()<1) {
				documentVO.setDepCdList(new ArrayList<String>());
			}
			
			for (SignpathDetailVO signpathDetail : signpathDetailList) { // 결재상태는 결재상세 갯수에 맞게 들어가야함

				// 수신처를 위한
				documentVO.getDepCdList().add(signpathDetail.getDepCd());

				SignpathEmpVO signpathEmp = new SignpathEmpVO();
				signpathEmp.setDocNo(docNo); // 결재문서
				signpathEmp.setSignpathNo(signpathDetail.getSignpathNo()); // 결재선 번호 먼가 없어도 될것같은데
				signpathEmp.setEmpCd(signpathDetail.getEmpCd()); // 결재자
				signpathEmp.setSdTurn(signpathDetail.getSdTurn()); // 결재순서
				signpathEmp.setCodeMethod(signpathDetail.getCodeMethod()); // 결재방법
				signpathEmp.setCodeStatus("SE_01"); // 결재상태코드 처음 인서트이기때문에 SE_01(결재요청)

				documentDao.insertSignPathEmp(signpathEmp); // 결재상태 등록
			}

			// 참조등록
			if (documentVO.getSignPathDetailList() != null && documentVO.getSignPathDetailList().size() > 0) {
				for (SignpathDetailVO sighpath : documentVO.getSignPathDetailList()) {
					HelpDetailVO help = new HelpDetailVO();
					help.setDocNo(docNo);
					help.setEmpCd(sighpath.getEmpCd());
					documentDao.insertHelpDetail(help);
				}
			}

			// 수신처 중복제거
			Set<String> set = new HashSet<String>();
			if (documentVO.getDepCdList() != null && documentVO.getDepCdList().size() > 0) {
				for (String depCd : documentVO.getDepCdList()) {
					set.add(depCd);
				}
				// 중복제거된 수신처 등록
				Iterator<String> iterator = set.iterator();
				while (iterator.hasNext()) {
					String currentDepCd=iterator.next();
					if(pDepCd.equals(currentDepCd)) continue;
					DepDocumentVO depDoc = new DepDocumentVO();
					depDoc.setDepCd(currentDepCd);
					depDoc.setDocNo(docNo);
					documentDao.insertDepDocument(depDoc);
				}
			}

		} else { // 기안문 등록 실패시

		}
		return result > 0;
	}

	/**
	 * 기안된 문서 상세조회시 결재선 조회
	 * 
	 * @param signpathEmpVO 기안문서번호 이용
	 * @return
	 */
	@Override
	public List<SignpathEmpVO> retrieveSignpathEmpList(SignpathEmpVO signpathEmpVO) {
		return documentDao.selectSignpathEmpList(signpathEmpVO);
	}

	@Override
	public boolean modifySignpathEmp(SignpathEmpVO signpathEmpVO) {
		return documentDao.signpathEmpUpdate(signpathEmpVO) > 0;
	}

	@Override
	public boolean modifyDocument(DocumentVO documentVO) {
		return documentDao.documentUpdate(documentVO) > 0;
	}

	@Override
	public List<AtchFileDetailVO> retrieveAtchFile(AtchFileVO atchFileVO) {
		return documentDao.selectDoucmentAtchFile(atchFileVO);
	}

	@Override
	public boolean modifyDocumentTemp(DocumentVO documentVO,String depCd) {

		SignpathEmpVO preSignpathEmp = new SignpathEmpVO();
		preSignpathEmp.setDocNo(documentVO.getDocNo());

		DepDocumentVO preDepDocument = new DepDocumentVO();
		preDepDocument.setDocNo(documentVO.getDocNo());

		// 결재상태 변경
		documentDao.signpathEmpDelete(preSignpathEmp);
		// 수신처 삭제
		documentDao.depDocumentDelete(preDepDocument);
		// 참조함 삭제
		documentDao.deleteHelpDetail(documentVO);
		// 문서 변경
		documentDao.documentDelete(documentVO);

		processAtchFileGroup(documentVO);
		boolean result  = createDocument(documentVO,depCd);
//		int result = documentDao.insertDocument(documentVO);
//
//		if (result > 0) { // 기안문 등록 성공시
//			String docNo = documentVO.getDocNo(); // 인서트한 document의 번호 받아오기
//
//			// 결재상태 등록 -> 결재선번호와 직원사번(소유자,empCd2)를 이용하여 결재상세를 불러와 그걸 결재상태에 문서번호와 넣어줌
//			SignpathDetailVO signpathDetailVO = new SignpathDetailVO();
//			signpathDetailVO.setSignpathNo(documentVO.getSignpathNo());
//			signpathDetailVO.setEmpCd2(documentVO.getEmpCd());
//			List<SignpathDetailVO> signpathDetailList = documentDao.selectSignPathDetailList(signpathDetailVO);
//			if(documentVO.getDepCdList()==null || documentVO.getDepCdList().size()<1) {
//				documentVO.setDepCdList(new ArrayList<String>());
//			}
//			for (SignpathDetailVO signpathDetail : signpathDetailList) { // 결재상태는 결재상세 갯수에 맞게 들어가야함
//
//				
//				// 수신처를 위한
//				documentVO.getDepCdList().add(signpathDetail.getDepCd());
//
//				SignpathEmpVO signpathEmp = new SignpathEmpVO();
//				signpathEmp.setDocNo(docNo); // 결재문서
//				signpathEmp.setSignpathNo(signpathDetail.getSignpathNo()); // 결재선 번호 먼가 없어도 될것같은데
//				signpathEmp.setEmpCd(signpathDetail.getEmpCd()); // 결재자
//				signpathEmp.setSdTurn(signpathDetail.getSdTurn()); // 결재순서
//				signpathEmp.setCodeMethod(signpathDetail.getCodeMethod()); // 결재방법
//				signpathEmp.setCodeStatus("SE_01"); // 결재상태코드 처음 인서트이기때문에 SE_01(결재요청)
//
//				documentDao.insertSignPathEmp(signpathEmp); // 결재상태 등록
//			}
//
//			// 참조등록
//			if (documentVO.getSignPathDetailList() != null && documentVO.getSignPathDetailList().size() > 0) {
//				for (SignpathDetailVO sighpath : documentVO.getSignPathDetailList()) {
//					HelpDetailVO help = new HelpDetailVO();
//					help.setDocNo(docNo);
//					help.setEmpCd(sighpath.getEmpCd());
//					documentDao.insertHelpDetail(help);
//				}
//			}
//
//			if (documentVO.getDepCdList() != null && documentVO.getDepCdList().size() > 0) {
//				// 수신처 중복제거
//				Set<String> set = new HashSet<String>();
//				for (String depCd : documentVO.getDepCdList()) {
//					set.add(depCd);
//				}
//				// 중복제거된 수신처 등록
//				Iterator<String> iterator = set.iterator();
//				while (iterator.hasNext()) {
//					DepDocumentVO depDoc = new DepDocumentVO();
//					depDoc.setDepCd(iterator.next());
//					depDoc.setDocNo(docNo);
//					documentDao.insertDepDocument(depDoc);
//				}
//			}
//
//		} else { // 기안문 등록 실패시
//
//		}
		return result;
	}

	/**
	 * 임시저장 삭제
	 */
	@Override
	public boolean deleteDocumentTemp(DocumentVO documentVO) {
		SignpathEmpVO preSignpathEmp = new SignpathEmpVO();
		DepDocumentVO preDepDocument = new DepDocumentVO();

		preSignpathEmp.setDocNo(documentVO.getDocNo());
		preDepDocument.setDocNo(documentVO.getDocNo());
		documentDao.signpathEmpDelete(preSignpathEmp);
		documentDao.depDocumentDelete(preDepDocument);
		documentDao.documentDelete(documentVO);
		return true;
	}

	@Override
	public List<DepDocumentVO> retrieveDepDocument(DepDocumentVO depDocumentVO) {
		List<DepDocumentVO> depDocumentList = documentDao.selectDepDocumentList(depDocumentVO);
		return depDocumentList;
	}

	@Override
	public List<DepDocumentVO> retrieveFinDepDocument(DepDocumentVO depDocumentVO) {
		return documentDao.selectFinDepDocumentList(depDocumentVO);
	}

}
