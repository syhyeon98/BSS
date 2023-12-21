package kr.or.ddit.BoardReq.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.BoardReq.vo.ReqboardVO;
import kr.or.ddit.BoardReqcmnt.vo.CmntVO;
import kr.or.ddit.pagingVO.PaginationInfo;

/**
 *  요구사항 PL
 * 
 */
@Mapper
public interface ReqboardDAO {

	public ReqboardVO selectReq(int reqNo);

	public long selectTotalRecord(PaginationInfo<ReqboardVO> paging);

	public List<ReqboardVO> selectReqList(PaginationInfo<ReqboardVO> paging);
	
	public List<ReqboardVO> myReqBoardList(String empCd);
	
	//요구사항 등록
	public int insertReq(ReqboardVO reqVO);
	
	//수정
	public int updateReq(ReqboardVO reqVO);
	
	public int updateReqCmnt(CmntVO cmnt);
	
	public int deleteReq(ReqboardVO reqVO);
	
	public List<ReqboardVO> reqMainList();
}
