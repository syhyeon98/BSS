package kr.or.ddit.salary.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.salary.vo.AllowHistoryVO;
import kr.or.ddit.salary.vo.SalaryVO;

@Mapper
public interface AllowHistoryDAO {
	
	/**
	 * 수당 이력을 가져오는 메서드
	 * @param allowHistory
	 * @return
	 */
	public List<AllowHistoryVO> selectAllowHistoryList(AllowHistoryVO allowHistory);
	
	/**
	 * 수당이력(기본급)에 데이터를 넣는 메서드
	 * @return
	 */
	public int insertBaseSalAllowHistory();
	
	/**
	 * 수당이력(식비) 추가
	 * @return
	 */
	public int insertMealSalAllowHistory();
	
	/**
	 * 해당기간 (전달 25~ 24)의 추가근무시간 확인
	 * @return 
	 */
	public int countOverTime();
	
	/**
	 * 해당기간 추가근무시간에 따른 수당 insert
	 * @return
	 */
	public int insertOverSalAllowHistory();
	
	/**
	 * 추가수당
	 * @return
	 */
	public int insertAddSalAllowHistory(AllowHistoryVO allowHistoryVO);
	
	/**
	 * 수당이력 삭제
	 * @return
	 */
	public int deleteAllowHistory(SalaryVO salary);
	
	
	/**
	 * 수당이력 선택 삭제
	 * @param allowHistoryVO
	 * @return
	 */
	public int deleteOneAllowHistory(AllowHistoryVO allowHistoryVO);
	
}
