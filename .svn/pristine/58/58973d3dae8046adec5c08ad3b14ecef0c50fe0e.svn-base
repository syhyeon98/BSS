package kr.or.ddit.businesstrip.service;


import java.util.List;

import kr.or.ddit.attendance.vo.AttendanceVO;
import kr.or.ddit.businesstrip.vo.BusinessTripVO;
import kr.or.ddit.pagingVO.PaginationInfo;

public interface BusinessTripService {
	
	/**
	 * 출장조회
	 * @param bTripVO
	 * @return
	 */
	public List<BusinessTripVO> retrieveBtrip(BusinessTripVO bTripVO);
	
	/**
	 * 출장등록
	 * @param bTripVO
	 * @return
	 */
	public boolean createBusinessTrip(BusinessTripVO bTripVO);
	
	/**
	 * 출장 선택 조회 (모달)
	 * @param tripNo
	 * @return
	 */
	public BusinessTripVO retrieveOneBtrip(int tripNo);
	
	/**
	 * 출장수정
	 * @param bTripVO
	 * @return
	 */
	public boolean modifyBusinessTrip(BusinessTripVO bTripVO);
	
	/**
	 * 출장삭제
	 * @param bTripVO
	 * @return
	 */
	public boolean removeBusinessTrip(BusinessTripVO bTripVO);
	
	/**
	 * [마이페이지] SYSDATE 출장 전체조회
	 * @param bTripVO
	 * @return
	 */
	public List<BusinessTripVO> mySelectBtrip(PaginationInfo<BusinessTripVO> paging);
	
	
	/**
	 * [마이페이지] 월출장일 총계
	 * @param paging
	 * @return
	 */
	public int totalBtrip(BusinessTripVO bTripVO);
}
