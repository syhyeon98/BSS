package kr.or.ddit.BoardReq.service;

import java.util.List;

import kr.or.ddit.BoardReq.vo.ReqboardVO;
import kr.or.ddit.BoardReqcmnt.vo.CmntVO;
import kr.or.ddit.exception.PKNotFoundException;
import kr.or.ddit.pagingVO.PaginationInfo;

/**
 * 요구사항 CRUD, BLL
 *
 */
public interface ReqboardSerivce {

	//요구사항 상세조회
	public ReqboardVO retrieveReq(int reqNo) throws PKNotFoundException;
	//요구사항 리스트
	public List<ReqboardVO> retrieveReqList(PaginationInfo<ReqboardVO> paging);
	public List<ReqboardVO> myReqList(String empCd);
	//요구사항 등록
	public boolean createReq(ReqboardVO req);
	//요구사항 수정
	public boolean modifyReq(ReqboardVO reqVO);
	//요구사항 삭제
	public boolean delete(ReqboardVO reqVO);
	
	public List<ReqboardVO> reqMainList();
}
