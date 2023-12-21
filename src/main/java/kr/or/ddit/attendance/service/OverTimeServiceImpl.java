package kr.or.ddit.attendance.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.attendance.dao.OverTimeDAO;
import kr.or.ddit.attendance.vo.AttendanceVO;
import kr.or.ddit.attendance.vo.OverTimeVO;
import kr.or.ddit.pagingVO.PaginationInfo;

@Service
public class OverTimeServiceImpl implements OverTimeService {
	
	@Inject
	public OverTimeDAO dao;
	
	/**
	 * 초과근무 전체조회
	 */
	@Override
	public List<OverTimeVO> retrieveOverList() {
		return dao.selectOverList();
		
	}
	
	/**
	 * 초과근무 등록
	 */
	@Override
	public boolean createOverTime(OverTimeVO overTimeVO) {
		return dao.insertOverTime(overTimeVO) > 0;
	}

	/**
	 * 초과근무 기간 조회
	 */
	@Override
	public List<OverTimeVO> overTimeSearch(OverTimeVO overTimeVO) {
		return dao.overTimeSearch(overTimeVO);
	}
	
	/**
	 * 초과근무 수정
	 */
	@Override
	public boolean modifyOverTime(OverTimeVO overTimeVO) {
		return dao.updateOverTime(overTimeVO) > 0;
	}
	
	/**
	 * [마이페이지] 초과근무 전체 조회
	 */
	@Override
	public List<OverTimeVO> mypageSelectOverList(OverTimeVO overTimeVO) {
		return dao.mypageSelectOverList(overTimeVO);
	}
	
	
	/**
	 * [마이페이지] 이 달의 초과근무 시간
	 */
	@Override
	public OverTimeVO totalOvertime(OverTimeVO overTimeVO) {
		return dao.totalOvertime(overTimeVO);
	}

}
