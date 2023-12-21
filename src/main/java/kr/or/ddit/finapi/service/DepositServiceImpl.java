package kr.or.ddit.finapi.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.finapi.dao.DepositDAO;
import kr.or.ddit.finapi.vo.DepositVO;
import kr.or.ddit.pagingVO.PaginationInfo;

@Service
public class DepositServiceImpl implements DepositService{

	@Inject
	private DepositDAO depositDao;
	
	@Override
	public List<DepositVO> retrieveDepositList(PaginationInfo<DepositVO> paging) {
		long totalRecord=depositDao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return depositDao.selectDepositList(paging);
	}

	@Override
	public DepositVO retrieveDeposit(DepositVO deposit) {
		return depositDao.selectDeposit(deposit);
	}

}
