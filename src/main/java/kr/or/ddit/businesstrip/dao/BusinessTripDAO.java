package kr.or.ddit.businesstrip.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.attendance.vo.AttendanceVO;
import kr.or.ddit.businesstrip.vo.BusinessTripVO;
import kr.or.ddit.edDocument.vo.DocumentVO;
import kr.or.ddit.pagingVO.PaginationInfo;

@Mapper
public interface BusinessTripDAO {
	
	/**
	 * 출장 조회
	 * @param bTripVO
	 * @return
	 */
	public List<BusinessTripVO> selectBtrip(BusinessTripVO bTripVO);
	
	/**
	 * 출장 신청(등록)
	 * @param bTripVO
	 * @return
	 */
	public int insertBusinessTrip(BusinessTripVO bTripVO);
	
	/**
	 * 출장 선택 조회 (모달)
	 * @param tripNo
	 * @return
	 */
	public BusinessTripVO selectOneBtrip(int tripNo);
	

	/**
	 * 출장 수정
	 * @param bTripVO
	 * @return
	 */
	public int updateBusinessTrip(BusinessTripVO bTripVO);
	
	/**
	 * 출장 삭제 
	 * @param bTripVO
	 * @return
	 */
	public int deleteBusinessTrip(BusinessTripVO bTripVO);
	
	
	/**
	 * [마이페이지] 출장 전체조회 페이징
	 * @param paging
	 * @return
	 */
	public long selectTotalRecord(PaginationInfo<BusinessTripVO> paging);
	
	/**
	 * [마이페이지] SYSDATE 출장 전체조회
	 * @param bTripVO
	 * @return
	 */
	public List<BusinessTripVO> mySelectBtrip(PaginationInfo<BusinessTripVO> paging);
	
	
	/**
	 * [마이페이지] SYSDATE 출장일수
	 * @param bTripVO
	 * @return
	 */
	public long mySelectCountBtrip(PaginationInfo<BusinessTripVO> paging);
	
	
	/**
	 * 기안등록전 출장등록 
	 * @param bTripVO
	 * @return
	 */
	public int insertBtripForDoc(BusinessTripVO bTripVO);
	
	/**
	 * 기안등록을 위한 상세조회
	 * @return
	 */
	public BusinessTripVO selectBtripForDoc(BusinessTripVO bTripVO);
	
	/**
	 *  [마이페이지] 월출장일 총계  
	 */
	public int totalBtrip(BusinessTripVO bTripVO);
	
	/**
	 * 출장 승인이 완료되었을 경우 출장 목적 장소 시작일 종료일을 가져오기 위함
	 * @param document docNo를 이용한다
	 * @return
	 */
	public BusinessTripVO selectBtripForCalendar(DocumentVO document);
	
	
}
