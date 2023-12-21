package kr.or.ddit.finapi.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.finapi.dao.SavingPrdtDAO;
import kr.or.ddit.finapi.vo.SavingPrdtVO;
import kr.or.ddit.pagingVO.PaginationInfo;

@Service
public class SavingPrdtServiceImpl implements SavingPrdtService {

	@Inject
	private SavingPrdtDAO savingDao;
	
	@Override
	public List<SavingPrdtVO> retrieveSavingPrdtList(PaginationInfo paging) {
		long totalRecord=savingDao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return savingDao.selectSavingPrdtList(paging);
	}

	@Override
	public SavingPrdtVO rerieveSavingPrdt(SavingPrdtVO savingPrdt) {
		return savingDao.selectSavingPrdt(savingPrdt)  ;
	}

}
