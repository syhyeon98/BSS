package kr.or.ddit.attendance.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.attendance.vo.AttendanceVO;
import kr.or.ddit.department.vo.DepartmentVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.pagingVO.PaginationInfo;

@Mapper
public interface AttendanceDAO {
	
	/**
	 * 출퇴근 전체출력 페이징 총 갯수
	 * @param paging
	 * @return
	 */
	public long selectTotalRecord(PaginationInfo<AttendanceVO> paging);
	
	/**
	 * [마이페이지] 출퇴근 전체출력 페이징 총 갯수
	 * @param paging
	 * @return
	 */
	public long totalRecord(PaginationInfo<AttendanceVO> paging);
	
	
	/**
	 * [마이페이지] 이번달 출퇴근 페이징 총 갯수
	 * @param paging
	 * @return
	 */
	public long thisMonthTotalRecord(PaginationInfo<AttendanceVO> paging);
	
	
	/**
	 * [마이페이지] 전 달 출퇴근 페이징 총 갯수
	 * @param paging
	 * @return
	 */
	public long beforeMonthTotalRecord(PaginationInfo<AttendanceVO> paging);
	
	
	/**
	 * 출퇴근내역 전체조회
	 * @param paging
	 * @return
	 */
	public List<AttendanceVO> selectAttendList(PaginationInfo<AttendanceVO> paging);
	
	/**
	 * 출퇴근 검색조회
	 * @param paging
	 * @return
	 */
	public List<AttendanceVO> searchAttendList(PaginationInfo<AttendanceVO> paging);
	
	/**
	 * 출퇴근내역 (직원조회)
	 * @return
	 */
	public List<EmployeeVO> selectEmpList();

	/**
	 * 출근 등록
	 * @param attendVO
	 * @return
	 */
	public int insertAttendStime(AttendanceVO attendVO);
	
	
	/**
	 * 로그인한 사람의 atteStime 값이 있는지 조회
	 * @param attendVO
	 * @return
	 */
	public AttendanceVO selectHaveAtteStime(AttendanceVO attendVO);
	
	/**
	 * 로그인한 사람의 atteEnd 값이 있는지 조회
	 * @param attendVO
	 * @return
	 */
	public AttendanceVO selectHaveAtteEnd(AttendanceVO attendVO);
	
	
	/**
	 * 퇴근 등록(null > sysdate)
	 * @param attendVO
	 * @return
	 */
	public int UpdateAttendEnd(AttendanceVO attendVO);
	
	/**
	 * 출퇴근 삭제
	 * @param attendVO
	 * @return
	 */
	public int deleteAttend(AttendanceVO attendVO);

	/**
	 * 출퇴근 수정
	 * @param attendVO
	 * @return
	 */
	public int updateAttend(AttendanceVO attendVO);
	
	/**
	 * 출퇴근 선택 조회 (모달)
	 * @param atteNo
	 * @return
	 */
	public AttendanceVO selectOneAttend(int atteNo);
	
	/**
	 * 추가근무 선택 조회 (모달)
	 * @param atteNo
	 * @return
	 */
	public AttendanceVO selectOneOverTime(int atteNo);
	
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
	 * [마이페이지] 클라이언트가 입력한 월에 따라 출근내역 총 갯수 조회
	 * @param paging
	 * @return
	 */
	public long inputTotalMonthRecord(PaginationInfo<AttendanceVO> paging);
	
	/**
	 * [마이페이지] 클라이언트가 입력한 월에 따라 출근내역 조회
	 * @param paging
	 * @return
	 */
	public List<AttendanceVO> inputMonthAttend(PaginationInfo<AttendanceVO> paging);
	
	
}
