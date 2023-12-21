package kr.or.ddit.finapi.service;

import java.util.List;

import kr.or.ddit.finapi.vo.MortagageLoanVO;
import kr.or.ddit.pagingVO.PaginationInfo;

public interface MortagageLoanService {

	public List<MortagageLoanVO> retrieveMortagageLoanList(PaginationInfo paging);
	public MortagageLoanVO retrieveMortageLoan(MortagageLoanVO mortagageLoan);
	
}
