package kr.or.ddit.edDocument.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.atch.vo.AtchFileDetailVO;
import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.department.vo.DepDocumentVO;
import kr.or.ddit.edApproval.vo.HelpDetailVO;
import kr.or.ddit.edApproval.vo.SignpathDetailVO;
import kr.or.ddit.edApproval.vo.SignpathEmpVO;
import kr.or.ddit.edApproval.vo.SignpathVO;
import kr.or.ddit.edDocument.vo.DocumentTypeVO;
import kr.or.ddit.edDocument.vo.DocumentVO;
import kr.or.ddit.pagingVO.PaginationInfo;


@Mapper
public interface DocumentDao {
	
	/**
	 * 양식 생성
	 */
	public int insertForm(DocumentTypeVO docTypeVO);	
	
	/**
	 * 문서 양식 목록 조회
	 */
	public List<DocumentTypeVO> selectDocumentTypeList();
	
	/**
	 * 문서 양식 상세
	 */
	public DocumentTypeVO selectDtCont(Integer dtNo);
	
	/**
	 * 기안된 문서 조회
	 * 결재선
	 */
	public DocumentVO selectDocument(String docNo);
	
	/**
	 * 문서 insert
	 */
	public int insertDocument(DocumentVO documentVO);
	
	/**
	 * 임시저장함
	 */
	public List<DocumentVO> retrieveKeepList(String empCd);
	
	/**
	 * 결재선 insert
	 * @param 
	 * @return
	 */
	public int insertSignPath(SignpathVO signpathVO);
	
	/**
	 * 결재상세 insert
	 * @param signpathDetailVO DcoumentVO에 있는 signPathDetailList
	 * @return
	 */
	public int insertSignPathDetail(SignpathDetailVO signpathDetailVO);
	
	/**
	 * 결재상태 insert
	 * @param signpathEmpVO (DocumentVO로 SignpathEmpVO 직원사번이랑,문서번호만들고 code만들기SE_01결재요청 )
	 * @return
	 */
	public int insertSignPathEmp(SignpathEmpVO signpathEmpVO);
	
	
	/**
	 * 참협조상세 insert
	 * @param helpDetailVO 
	 * @return
	 */
	public int insertHelpDetail(HelpDetailVO helpDetailVO);
	
	/**
	 * 결재요청함
	 */
	public List<DocumentVO> selectReqList(String empCd);
	
	/**
	 * 결재대기함
	 */
	public List<DocumentVO> selectWaitList(String empCd);
	
	/**
	 * 결재진행함
	 */
	public List<DocumentVO> selectIngList(String empCd);
	
	/**
	 * 참조문서함
	 */
	public List<DocumentVO> selectRefList(String empCd);
	
	/**
	 * 반려문서함
	 */
	public List<DocumentVO> selectReturnList(String empCd);
	
	/**
	 * 보관함 페이징을 위한 전체 레코드 수 조회
	 */
	public long selectTotalRecord(PaginationInfo paging);
	
	/**
	 * 보관함, paging에 depCd 정보 포함됨
	 */
	public List<DocumentVO> selectRegPublicList(PaginationInfo paging);
	
	
	/**
	 * 결재상세 리스트로 가져오기 , 결재
	 * @param signPathDetailVO 
	 * @return
	 */
	public List<SignpathDetailVO> selectSignPathDetailList(SignpathDetailVO signPathDetailVO);
	
	/**
	 * 결재선 리스트 가져오기
	 * @param signpathVO
	 * @return
	 */
	public List<SignpathVO> selectSignpathList(SignpathVO signpathVO);
	
	/**
	 * 선택 문서에 해당하는 결재상태 리스트 조회
	 * @param signpathEmpVO
	 * @return
	 */
	public List<SignpathEmpVO> selectSignpathEmpList(SignpathEmpVO signpathEmpVO);
	
	/**
	 * 승인 또는 반려시 결재상태 변경
	 * @param signpathEmpVo
	 * @return
	 */
	public int signpathEmpUpdate(SignpathEmpVO signpathEmpVo);
	
	
	/**
	 * 결재 최종 승인또는 반려시 결재문서 변경
	 * @param documentVO
	 * @return
	 */
	public int documentUpdate(DocumentVO documentVO);
	
	/**
	 * 선택 결재문서에 해당하는 첨부파일
	 * @param atchfileVO
	 * @return
	 */
	public List<AtchFileDetailVO> selectDoucmentAtchFile(AtchFileVO atchfileVO);	
	
	/**
	 * 결재문서 삭제
	 * @param documentVO
	 * @return
	 */
	public int documentDelete(DocumentVO documentVO);
	
	/**
	 * 임시저장문서 수정시 결재선삭제
	 * @param signpathEmpVO
	 * @return
	 */
	public int signpathEmpDelete(SignpathEmpVO signpathEmpVO);
	
	/**
	 * 수신처 등록
	 * @param depDocumentVO
	 * @return
	 */
	public int insertDepDocument(DepDocumentVO depDocumentVO);
	
	/**
	 * 수신처 삭제
	 * @param depDocumentVO
	 * @return
	 */
	public int depDocumentDelete(DepDocumentVO depDocumentVO);
	
	/**
	 * 등록된 수신처 가져오기
	 * @param depDocumentVO docNo를 이용
	 * @return
	 */
	public List<DepDocumentVO> selectDepDocumentList(DepDocumentVO depDocumentVO);
	
	/**
	 * 수신함 문서 가져오기
	 * @param depDocumentVO 로그인 객체의 depCd를 이용
	 * @return
	 */
	public List<DepDocumentVO> selectFinDepDocumentList(DepDocumentVO depDocumentVO);
	
	
	/**
	 * 결재대기 수
	 * @return
	 */
	public int selectWaitTotalCount(String empCd);
	
	
	
	/**
	 * 결재진행 수(결재선에 내가 포함된 수)
	 * @return
	 */
	public int selectIngTotalCount(String empCd);
	
	/**
	 * 수신함 수
	 * @param depDocumentVO 로그인 객체의 depCd를 이용
	 * @return
	 */
	public int selectFinDepDocumentTotalCount(DepDocumentVO depDocumentVO);
	
	
	
	/**
	 * 참조문서함 수
	 * @param empCd
	 * @return
	 */
	public int selectRefTotalCount(String empCd);
	
	
	/**
	 * 반려사유를위한
	 * @param docNo
	 * @return
	 */
	public DocumentVO selectReturnDcoument(String docNo);
	
	/**
	 * 참조삭제
	 * @param documentVO
	 * @return
	 */
	public int deleteHelpDetail(DocumentVO documentVO);
}




