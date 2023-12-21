package kr.or.ddit.edDocument.service;

import java.util.List;

import kr.or.ddit.department.vo.DepDocumentVO;
import kr.or.ddit.edDocument.vo.DocumentVO;
import kr.or.ddit.pagingVO.PaginationInfo;

// 각각의 보관함 사용할 Service
public interface DocumentPagingService {

	/**
	 * 결재요청 
	 * @param paging
	 * @return
	 */
	public List<DocumentVO> retrieveReqDocumentList(PaginationInfo<DocumentVO> paging);
	
	/**
	 * 진행함
	 * @param paging
	 * @return
	 */
	public List<DocumentVO> retrieveIngDocumentList(PaginationInfo<DocumentVO> paging);
	
	/**
	 * 대기함
	 * @param paging
	 * @return
	 */
	public List<DocumentVO> retrieveWaitDocumentList(PaginationInfo<DocumentVO> paging);
	
	/**
	 * 참조
	 * @param paging
	 * @return
	 */
	public List<DocumentVO> retrieveRefDocumentList(PaginationInfo<DocumentVO> paging);
	
	/**
	 * 반려문서
	 * @param paging
	 * @return
	 */
	public List<DocumentVO> retrieveReturnDocumentList (PaginationInfo<DocumentVO> paging);
	
	/**
	 * 수신함
	 * @param paging
	 * @return
	 */
	public List<DepDocumentVO> retrieveRegDocumentList(PaginationInfo<DepDocumentVO> paging);
	
}
