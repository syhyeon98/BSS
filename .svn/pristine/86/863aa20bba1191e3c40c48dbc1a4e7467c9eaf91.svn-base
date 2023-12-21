package kr.or.ddit.attendance.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.or.ddit.attendance.dao.AttendanceDAO;
import kr.or.ddit.attendance.vo.AttendanceVO;
import kr.or.ddit.pagingVO.PaginationInfo;

@Service
public class AttendanceServiceImpl implements AttendanceService {

	@Inject
	private AttendanceDAO dao;
	
	/**
	 * 출퇴근 전체조회, 페이징
	 */
	@Override
	public List<AttendanceVO> retrieveAttendList(PaginationInfo<AttendanceVO> paging){
		long totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectAttendList(paging);
	}
	
	/**
	 * 출퇴근내역 검색조회
	 */
	@Override
	public List<AttendanceVO> searchAttendList(PaginationInfo<AttendanceVO> paging) {
		long totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.searchAttendList(paging);
	}
	
	/**
	 * 출근 등록
	 */
	@Override
	public boolean createAttendStime(AttendanceVO attendVO) {
		return dao.insertAttendStime(attendVO) > 0;
	}
	

	/**
	 * 로그인한 직원의 atteStime이 있는지 조회
	 */
	@Override
	public AttendanceVO retrieveHaveAtteStime(AttendanceVO attendVO) {
		return dao.selectHaveAtteStime(attendVO);
	}
	
	
	/**
	 * 로그인한 직원의 atteEnd이 있는지 조회
	 */
	@Override
	public AttendanceVO retrieveHaveAtteEnd(AttendanceVO attendVO) {
		return dao.selectHaveAtteEnd(attendVO);
	}
	
	
	/**
	 * 퇴근 등록(null > sysdate)
	 */
	@Override
	public boolean UpdateAttendEnd(AttendanceVO attendVO) {
		return dao.UpdateAttendEnd(attendVO) > 0;
	}

	
	/**
	 * 출퇴근 삭제
	 */
	@Override
	public boolean removeAttend(AttendanceVO attendVO) {
		return dao.deleteAttend(attendVO) > 0;
	}
	
	/**
	 * 출퇴근 수정
	 */
	@Override
	public boolean modifyAttend(AttendanceVO attendVO) {
		return dao.updateAttend(attendVO) > 0;
	}


	/**
	 * 출퇴근 선택 조회 (모달)
	 */
	@Override
	public AttendanceVO retrieveOneAttend(int atteNo) {
		return dao.selectOneAttend(atteNo);
	}


	/**
	 * 추가근무 선택 조회 (모달)
	 */
	@Override
	public AttendanceVO retrieveOneOverTime(int atteNo) {
		return dao.selectOneOverTime(atteNo);
	}

	
	/**
	 * [마이페이지] 출퇴근 조회
	 */
	@Override
	public List<AttendanceVO> mypageAttend(PaginationInfo<AttendanceVO> paging){
		long totalRecord = dao.totalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.mypageAttend(paging);
	}

	/**
	 * [마이페이지] 이번달 근무일 검색
	 */
	@Override
	public List<AttendanceVO> myAttendthisMonth(PaginationInfo<AttendanceVO> paging) {
		long totalRecord = dao.thisMonthTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.myAttendthisMonth(paging);
	}

	
	/**
	 * [마이페이지] 전 달 근무일 검색
	 */
	@Override
	public List<AttendanceVO> myAttendbeforeMonth(PaginationInfo<AttendanceVO> paging) {
		long totalRecord = dao.beforeMonthTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.myAttendbeforeMonth(paging);
	}
	
	
	/**
	 * [마이페이지] 클라이언트가 입력한 월에 따라 출근내역 조회
	 */
	@Override
	public List<AttendanceVO> inputMonthAttend(PaginationInfo<AttendanceVO> paging) {
		long tototalRecord = dao.inputTotalMonthRecord(paging);
		paging.setTotalRecord(tototalRecord);
		return dao.inputMonthAttend(paging);
	}
	
}
