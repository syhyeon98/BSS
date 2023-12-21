package kr.or.ddit.edDocument.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.department.vo.DepDocumentVO;
import kr.or.ddit.edDocument.vo.DocumentVO;
import kr.or.ddit.pagingVO.PaginationInfo;

// 각각의 보관함에서 사용할 DAO
@Mapper
public interface DocumentPagingDAO {

	// 요청함 총 갯수 
	public int selectTotalReqDocument(PaginationInfo paging);
	// 요청함 리스트
	public List<DocumentVO> selectReqDocumentList(PaginationInfo paging);
	
	// 진행 총 갯수
	public int selectTotalIngDocument(PaginationInfo paging);
	// 진행함 리스트
	public List<DocumentVO> selectIngDocumentList(PaginationInfo paging);

	// 대기 총 갯수
	public int selectTotalWaitDocument(PaginationInfo paging);
	// 대기함 리스트
	public List<DocumentVO> selectWaitDocumentList(PaginationInfo paging);

	// 참조 총 갯수
	public int selectTotalRefDocument(PaginationInfo paging);
	// 참조함 리스트
	public List<DocumentVO> selectRefDocumentList(PaginationInfo paging);

	// 반려 총 갯수
	public int selectTotalReturnDocument(PaginationInfo paging);
	// 반려함 리스트
	public List<DocumentVO> selectReturnDocumentList(PaginationInfo paging);

	// 수신 총 갯수
	public int selectTotalRegDocument(PaginationInfo paging);
	// 수신함 리스트
	public List<DepDocumentVO> selectRegDocumentList(PaginationInfo paging);
	
	
}
