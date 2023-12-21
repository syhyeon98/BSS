package kr.or.ddit.salary.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.salary.dao.AllowHistoryDAO;
import kr.or.ddit.salary.vo.AllowHistoryVO;

@Service
public class AllowHistoryServiceImpl implements AllowHistoryService {

	@Inject
	private AllowHistoryDAO allowHistoryDao;

	@Override
	public int addAllowHistory(AllowHistoryVO allowHistory) {
		return allowHistoryDao.insertAddSalAllowHistory(allowHistory);
	}

	@Override
	public int removeAllowHistory(AllowHistoryVO allowHistory) {
		return allowHistoryDao.deleteOneAllowHistory(allowHistory);
	}

}
