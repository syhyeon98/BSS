package kr.or.ddit.finapi.service;

import java.util.List;

import kr.or.ddit.finapi.vo.CreditLoanVO;
import kr.or.ddit.pagingVO.PaginationInfo;

public interface CreditLoanService {

	public List<CreditLoanVO> retrieveCreditLoanList(PaginationInfo paging);
	public List<CreditLoanVO> retrieveCreditLoanList(); 
	
	public CreditLoanVO retrieveCreditLoan(CreditLoanVO creditLoan);
	
}
