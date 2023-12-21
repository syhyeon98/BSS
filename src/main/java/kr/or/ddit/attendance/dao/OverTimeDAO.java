package kr.or.ddit.attendance.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.attendance.vo.AttendanceVO;
import kr.or.ddit.attendance.vo.OverTimeVO;
import kr.or.ddit.pagingVO.PaginationInfo;


@Mapper
public interface OverTimeDAO {
		
	/**
	 * 초과근무 전체조회
	 * @return
	 */
	public List<OverTimeVO> selectOverList();
	
	/**
	 * 초과근무 등록
	 * @param overTimeVO
	 * @return
	 */
	public int insertOverTime(OverTimeVO overTimeVO);
	
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
	public int updateOverTime(OverTimeVO overTimeVO);
	
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
