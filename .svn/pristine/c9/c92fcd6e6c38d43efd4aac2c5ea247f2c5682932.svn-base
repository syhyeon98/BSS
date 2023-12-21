package kr.or.ddit.attendance.service;

import java.util.List;

import kr.or.ddit.attendance.vo.AttendanceVO;
import kr.or.ddit.attendance.vo.OverTimeVO;
import kr.or.ddit.pagingVO.PaginationInfo;

public interface OverTimeService {
	/**
	 * 초과근무 전체조회
	 * @return
	 */
	public List<OverTimeVO> retrieveOverList();
	
	/**
	 * 초과근무 등록
	 * @return
	 */
	public boolean createOverTime(OverTimeVO overTimeVO);
	
	/**
	 * 초과근무 기간 조회
	 * @param overTimeVO
	 * @return
	 */
	public List<OverTimeVO> overTimeSearch(OverTimeVO overTimeVO);
	
	/**
	 * 초과근무 수정
	 * @param overTimeVO
	 * @return
	 */
	public boolean modifyOverTime(OverTimeVO overTimeVO);
	
	/**
	 * [마이페이지] 초과근무 전체조회
	 * @return
	 */
	public List<OverTimeVO> mypageSelectOverList(OverTimeVO overTimeVO);
	
	/**
	 * [마이페이지] 이 달의 초과근무 시간 
	 * @param paging
	 * @return
	 */
	public OverTimeVO totalOvertime(OverTimeVO overTimeVO);
}	

