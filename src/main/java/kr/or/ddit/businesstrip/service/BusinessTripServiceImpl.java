package kr.or.ddit.businesstrip.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.attendance.vo.AttendanceVO;
import kr.or.ddit.businesstrip.dao.BusinessTripDAO;
import kr.or.ddit.businesstrip.vo.BusinessTripVO;
import kr.or.ddit.pagingVO.PaginationInfo;

@Service
public class BusinessTripServiceImpl implements BusinessTripService {

	@Inject
	private BusinessTripDAO dao;
	
	/**
	 * 출장조회
	 */
	@Override
	public List<BusinessTripVO> retrieveBtrip(BusinessTripVO bTripVO) {
		return dao.selectBtrip(bTripVO);
	}

	/**
	 * 출장등록
	 */
	@Override
	public boolean createBusinessTrip(BusinessTripVO bTripVO) {
		return dao.insertBusinessTrip(bTripVO) > 0;
	}
	
	/**
	 * 출장 선택조회(모달)
	 */
	@Override
	public BusinessTripVO retrieveOneBtrip(int tripNo) {
		return dao.selectOneBtrip(tripNo);
	}

	/**
	 * 출장수정
	 */
	@Override
	public boolean modifyBusinessTrip(BusinessTripVO bTripVO) {
		return dao.updateBusinessTrip(bTripVO) > 0;
	}

	/**
	 * 출장삭제
	 */
	@Override
	public boolean removeBusinessTrip(BusinessTripVO bTripVO) {
		return dao.deleteBusinessTrip(bTripVO) > 0;
	}
	
	
	/**
	 * [마이페이지] SYSDATE 출장 전체조회
	 * 
	 */
	@Override
	public List<BusinessTripVO> mySelectBtrip(PaginationInfo<BusinessTripVO> paging) {
		long totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.mySelectBtrip(paging);
	}

	/**
	 * [마이페이지] 월출장일 총계  
	 */
	@Override
	public int totalBtrip(BusinessTripVO bTripVO) {
		return dao.totalBtrip(bTripVO);
	}
	
	
}
