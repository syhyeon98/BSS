package kr.or.ddit.finapi.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.finapi.vo.CreditLoanVO;
import kr.or.ddit.pagingVO.PaginationInfo;

@Mapper
public interface CreditLoanDAO {
	
	
	public long selectTotalRecord(PaginationInfo paging);
	
	public List<CreditLoanVO> selectCreditLoanList(PaginationInfo paging);

	// 대출방법과 상관없이
	public List<CreditLoanVO> selectAllCreditLoanList();
	
	
	
	public CreditLoanVO selectCreditLoan(CreditLoanVO CreditLoan);
}
