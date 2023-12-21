package kr.or.ddit.finapi.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.finapi.dao.ManageInfoDAO;
import kr.or.ddit.finapi.vo.AccountVO;
import kr.or.ddit.finapi.vo.ManageBankVO;
import kr.or.ddit.finapi.vo.StatisticsInfoVO;
import kr.or.ddit.finapi.vo.StatisticsVO;

@Service
public class ManageInfoServiceImpl implements ManageInfoService {

	@Inject
	private ManageInfoDAO dao;
	
	@Override
	public List<ManageBankVO> retrieveManageBankList() {
		return dao.selectManageBankList();
	}

	@Override
	public List<StatisticsVO> retrieveStaticsList(String smlDivNm) {
		return dao.selectStatisticsList(smlDivNm);
	}

	@Override
	public List<AccountVO> retrieveAccountList(String listNo) {
		return dao.selectAccountList(listNo);
	}

	@Override
	public List<ManageBankVO> retrieveManageBankList(StatisticsInfoVO statisticsInfo) {
		return dao.selectStatisticInfoList(statisticsInfo);
	}
//	@Override
//	public List<StatisticsInfoVO> retrieveManageBankList(StatisticsInfoVO statisticsInfo) {
//		return dao.selectStatisticInfoList(statisticsInfo);
//	}

}
