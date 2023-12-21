package kr.or.ddit.finapi.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.finapi.vo.SavingPrdtVO;
import kr.or.ddit.pagingVO.PaginationInfo;

@Mapper
public interface SavingPrdtDAO {


	/**
	 * 전체건수
	 * @param paging
	 * @return
	 */
	public long selectTotalRecord(PaginationInfo paging);
	
	/**
	 * 전체조회 
	 * @param paging
	 * @return
	 */
	public List<SavingPrdtVO> selectSavingPrdtList(PaginationInfo paging);
	
	public SavingPrdtVO selectSavingPrdt(SavingPrdtVO savingPrdt);
	

}
