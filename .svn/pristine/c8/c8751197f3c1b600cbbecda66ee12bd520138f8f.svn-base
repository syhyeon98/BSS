package kr.or.ddit.edDocument.service;

import java.util.List;

import org.springframework.security.core.Authentication;

import kr.or.ddit.atch.vo.AtchFileDetailVO;
import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.department.vo.DepDocumentVO;
import kr.or.ddit.edApproval.vo.SignpathEmpVO;
import kr.or.ddit.edDocument.vo.DocumentTypeVO;
import kr.or.ddit.edDocument.vo.DocumentVO;
import kr.or.ddit.pagingVO.PaginationInfo;


public interface DocumentService {
	
	/**
	 * 양식 생성
	 */
	public boolean createForm(DocumentTypeVO docTypeVO);	
	
	/**
	 * 문서 양식 목록 조회
	 */
	public List<DocumentTypeVO> retrieveDocumentTypeList();
	
	/**
	 * 문서 양식 상세
	 */
	public DocumentTypeVO retrieveDtCont(Integer dtNo);
	
	/**
	 * 기안된 문서 조회
	 */
	public DocumentVO retrieveDocument(String docNo);
	
	/**
	 * 기안된 문서 상세조회시 결재선 조회
	 * @param signpathEmpVO 기안문서번호 이용
	 * @return 
	 */
	public List<SignpathEmpVO> retrieveSignpathEmpList(SignpathEmpVO signpathEmpVO);
	
	/**
	 * 문서 insert
	 */
//	public boolean createDocument(DocumentVO documentVO);
	public boolean createDocument(DocumentVO documentVO,String depCd);
	
	/**
	 * 임시저장함
	 */
	public List<DocumentVO> retrieveKeepList(String empCd);
	
	/**
	 * 결재요청함
	 */
	public List<DocumentVO> retrieveRequestList(String empCd); 
	
	/**
	 * 결재대기함
	 */
	public List<DocumentVO> retrieveWaitList(String empCd); 
	
	/**
	 * 결재진행함
	 */
	public List<DocumentVO> retrieveIngList(String empCd); 
	
	/**
	 * 참조문서함
	 */
	public List<DocumentVO> retrieveRefList(String empCd);
	
	/**
	 * 결재진행함
	 */
	public List<DocumentVO> retrieveReturnList(String empCd); 
	
	/**
	 * 보관함, paging에 depCd 정보 포함됨
	 */
	public List<DocumentVO> retrieveRegPublicList(PaginationInfo paging);
	
	/**
	 * 결재선승인 또는 반려 수정
	 * @param signpathEmpVO
	 * @return
	 */
	public boolean modifySignpathEmp(SignpathEmpVO signpathEmpVO);
	
	/**
	 * 결재문서변경
	 * @param documentVO
	 * @return
	 */
	public boolean modifyDocument(DocumentVO documentVO);
	
	/**
	 * 결재문서에 해당하는 첨부파일
	 * @param atchFileVO
	 * @return
	 */
	public List<AtchFileDetailVO> retrieveAtchFile(AtchFileVO atchFileVO);
	
	/**
	 * 임시저장된 결재문서 수정
	 * @param documentVO
	 * @return
	 */
	public boolean modifyDocumentTemp(DocumentVO documentVO,String depCd);
	
	/**
	 * 임시저장된 결재문서 삭제
	 * @param documentVO
	 * @return
	 */
	public boolean deleteDocumentTemp(DocumentVO documentVO);
	
	/**
	 * 등록된 수신처 겨자오기
	 * @param depDocumentVO
	 * @return
	 */
	public List<DepDocumentVO> retrieveDepDocument(DepDocumentVO depDocumentVO);
	
	
	/**
	 * 결재가 끝난 문서, 수신함
	 * @param depDocumentVO
	 * @return
	 */
	public List<DepDocumentVO> retrieveFinDepDocument(DepDocumentVO depDocumentVO);
	
	
	
}




