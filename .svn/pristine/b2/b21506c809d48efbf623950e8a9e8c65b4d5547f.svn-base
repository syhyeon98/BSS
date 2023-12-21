package kr.or.ddit.finapi.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.finapi.dao.MortagageLoanDAO;
import kr.or.ddit.finapi.vo.MortagageLoanVO;
import kr.or.ddit.pagingVO.PaginationInfo;

@Service
public class MortagageLoanServiceImpl implements MortagageLoanService {

	@Inject
	private MortagageLoanDAO mortagageDao;
	
	@Override
	public List<MortagageLoanVO> retrieveMortagageLoanList(PaginationInfo paging) {
		long totalRecord=mortagageDao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return mortagageDao.selectMortagageLoanList(paging);
	}

	@Override
	public MortagageLoanVO retrieveMortageLoan(MortagageLoanVO mortagageLoan) {
		return mortagageDao.selectMortagageLoan(mortagageLoan);
	}

}
