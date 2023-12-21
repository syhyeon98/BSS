package kr.or.ddit.salary.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.salary.dao.AllowHistoryDAO;
import kr.or.ddit.salary.dao.DdcHistoryDAO;
import kr.or.ddit.salary.dao.SalaryDetailDAO;
import kr.or.ddit.salary.vo.AllowHistoryVO;
import kr.or.ddit.salary.vo.DdcHistoryVO;
import kr.or.ddit.salary.vo.SalaryDetailVO;
import kr.or.ddit.salary.vo.SalaryVO;

@Service
public class SalaryDetailServiceImpl implements SalaryDetailService {
	
	@Inject
	private SalaryDetailDAO salaryDetailDao;

	@Inject
	private AllowHistoryDAO allowHistoryDAO;
	
	@Inject
	private DdcHistoryDAO ddcHistoryDao;
	

	@Override
	public List<SalaryDetailVO> retrieveSalaryDetailList(SalaryDetailVO psalaryDetail) {
		List<SalaryDetailVO> salaryDetailList = salaryDetailDao.selectSalaryDetailList(psalaryDetail);
		for(SalaryDetailVO salaryDetail :salaryDetailList) {
			AllowHistoryVO allowHistory = new AllowHistoryVO();
			allowHistory.setSalNo(salaryDetail.getSalNo());
			allowHistory.setEmpCd(salaryDetail.getEmpCd());
			List<AllowHistoryVO> allowHistoryList = allowHistoryDAO.selectAllowHistoryList(allowHistory);
			salaryDetail.setAllowHistoryList(allowHistoryList);
			DdcHistoryVO ddcHistory = new DdcHistoryVO();
			ddcHistory.setSalNo(salaryDetail.getSalNo());
			ddcHistory.setEmpCd(salaryDetail.getEmpCd());
			List<DdcHistoryVO> ddcHistoryList = ddcHistoryDao.selectDdcHistoryList(ddcHistory);
			salaryDetail.setAllowHistoryList(allowHistoryList);
			salaryDetail.setDdcHistoryList(ddcHistoryList);
		}
		return salaryDetailList;
	}

	@Override
	public List<SalaryDetailVO> retrieveSalaryDetailList(int salNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modifySalaryGiveYmd(SalaryVO salary) {
		return 0<salaryDetailDao.updateSalaryGiveYmd(salary);
	}

}
