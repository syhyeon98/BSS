package kr.or.ddit.finapi.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.finapi.vo.BankVO;
import kr.or.ddit.finapi.vo.DepositVO;
import kr.or.ddit.pagingVO.PaginationInfo;

@Mapper
public interface DepositDAO {
	
	/**
	 * 전체건수
	 * @return
	 */
	public long selectTotalRecord(PaginationInfo paging);
	
	/**
	 *  전체조회
	 * 단, 조건은 저축예정기간 12개월
	 * @param paging
	 * @return
	 */
	public List<DepositVO> selectDepositList(PaginationInfo paging);
	
	/**
	 * ㅅ
	 * @param deposit
	 * @return
	 */
	public DepositVO selectDeposit(DepositVO deposit);
	
}
