package kr.or.ddit.edDocument.service;

import java.util.List;

import kr.or.ddit.edDocument.vo.DocumentVO;
import kr.or.ddit.pagingVO.PaginationInfo;

public interface MyDocumentService {
	
	/**
	 * 페이징리스트
	 * @param paging
	 * @return
	 */
	public List<DocumentVO> retrieveDocumentList(PaginationInfo<DocumentVO> paging);

}
