package kr.or.ddit.salary.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.salary.vo.DdcHistoryVO;
import kr.or.ddit.salary.vo.SalaryVO;


@Mapper
public interface DdcHistoryDAO {
	
	/**
	 * 공제이력 전체 조회
	 * @param ddcHistory
	 * @return
	 */
	public List<DdcHistoryVO> selectDdcHistoryList(DdcHistoryVO ddcHistory);
	
	/**
	 * 공제이력 데이터 insert
	 * @return
	 */
	public int insertDdcHistory();
	
	/**
	 * 공제이력 데이터 삭제
	 * @return
	 */
	public int deleteDdcHistory(SalaryVO salary);
	
}
