package kr.or.ddit.attendance.service;

import java.util.List;

import kr.or.ddit.attendance.vo.AttendanceVO;
import kr.or.ddit.pagingVO.PaginationInfo;

public interface AttendanceService {
	
	/**
	 * 출퇴근내역 전체조회
	 * @param paging
	 * @return
	 */
	public List<AttendanceVO> retrieveAttendList(PaginationInfo<AttendanceVO> paging);
	
	/**
	 * 출퇴근내역 검색조회
	 * @param paging
	 * @return
	 */
	public List<AttendanceVO> searchAttendList(PaginationInfo<AttendanceVO> paging);
	
	/**
	 * 출근 등록
	 * @param attendVO
	 * @return
	 */
	public boolean createAttendStime(AttendanceVO attendVO);
	
	/**
	 * 로그인한 사람의 atteStime 값이 있는지 조회 
	 * @param attendVO
	 * @return
	 */
	public AttendanceVO retrieveHaveAtteStime(AttendanceVO attendVO);
	
	/**
	 * 로그인한 사람의 atteEnd 값이 있는지 조회 
	 * @param attendVO
	 * @return
	 */
	public AttendanceVO retrieveHaveAtteEnd(AttendanceVO attendVO);
	
	/**
	 * 퇴근 등록(null > sysdate)
	 * @param attendVO
	 * @return
	 */
	public boolean UpdateAttendEnd(AttendanceVO attendVO);
	
	/**
	 * 출퇴근 삭제
	 * @param attendVO
	 * @return
	 */
	public boolean removeAttend(AttendanceVO attendVO);
	
	/**
	 * 출퇴근 수정
	 * @param attendVO
	 * @return
	 */
	public boolean modifyAttend(AttendanceVO attendVO);
	
	/**
	 * 출퇴근 선택 조회 (모달)
	 * @param atteNo
	 * @return
	 */
	public AttendanceVO retrieveOneAttend(int atteNo);
	/**
	 * 추가근무 선택 조회 (모달)
	 * @param atteNo
	 * @return
	 */
	public AttendanceVO retrieveOneOverTime(int atteNo);
	
	
	/**
	 * [마이페이지] 출근부 조회
	 * @param attendVO
	 * @return
	 */
	public List<AttendanceVO> mypageAttend(PaginationInfo<AttendanceVO> paging);

	/**
	 * [마이페이지] 이번달 출근 검색
	 * @param paging
	 * @return
	 */
	public List<AttendanceVO> myAttendthisMonth(PaginationInfo<AttendanceVO> paging);

	/**
	 * [마이페이지] 전 달 출근 검색
	 * @param paging
	 * @return
	 */
	public List<AttendanceVO> myAttendbeforeMonth(PaginationInfo<AttendanceVO> paging);

	/**
	 * [마이페이지] 클라이언트가 입력한 월에 따라 출근내역 조회
	 * @param paging
	 * @return
	 */
	public List<AttendanceVO> inputMonthAttend(PaginationInfo<AttendanceVO> paging);
}
