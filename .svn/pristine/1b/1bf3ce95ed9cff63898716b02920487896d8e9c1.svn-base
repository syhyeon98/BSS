package kr.or.ddit.finapi.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.finapi.dao.RentHouseLoanDAO;
import kr.or.ddit.finapi.vo.RentHouseLoanVO;
import kr.or.ddit.pagingVO.PaginationInfo;

@Service
public class RentHouseLoanServiceImpl implements RentHouseLoanService {

	@Inject
	private RentHouseLoanDAO rentHouseDao;
	
	@Override
	public List<RentHouseLoanVO> retrieveRentHouseLoanList(PaginationInfo paging) {
		long totalRecord=rentHouseDao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return rentHouseDao.selectRentHouseLoanList(paging);
	}

	@Override
	public RentHouseLoanVO retrieveRentHouseLoan(RentHouseLoanVO RentHouseLoan) {
		return rentHouseDao.selectRentHouseLoan(RentHouseLoan);
	}

}
