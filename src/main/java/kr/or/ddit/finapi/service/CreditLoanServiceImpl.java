package kr.or.ddit.finapi.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.finapi.dao.CreditLoanDAO;
import kr.or.ddit.finapi.dao.RentHouseLoanDAO;
import kr.or.ddit.finapi.vo.CreditLoanVO;
import kr.or.ddit.finapi.vo.RentHouseLoanVO;
import kr.or.ddit.pagingVO.PaginationInfo;

@Service
public class CreditLoanServiceImpl implements CreditLoanService {

	@Inject
	private CreditLoanDAO credtiDao;
	
	@Override
	public List<CreditLoanVO> retrieveCreditLoanList(PaginationInfo paging) {
		long totalRecord=credtiDao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return credtiDao.selectCreditLoanList(paging);
	}

	@Override
	public CreditLoanVO retrieveCreditLoan(CreditLoanVO creditLoan) {
		return credtiDao.selectCreditLoan(creditLoan);
	}

	@Override
	public List<CreditLoanVO> retrieveCreditLoanList() {
		return credtiDao.selectAllCreditLoanList();
	}

}
