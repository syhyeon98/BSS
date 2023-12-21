package kr.or.ddit.finapi.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.finapi.vo.AccountVO;
import kr.or.ddit.finapi.vo.ManageBankVO;
import kr.or.ddit.finapi.vo.StatisticsInfoVO;
import kr.or.ddit.finapi.vo.StatisticsVO;

// 경영지표 관련 DAO
@Mapper
public interface ManageInfoDAO {

	// 은행 리스트 가져오기
	public List<ManageBankVO> selectManageBankList();
	
	// 통계목록 가져오기
	public List<StatisticsVO> selectStatisticsList(String smlDivNm);
	
	// 계정몽록 가져오기
	public List<AccountVO> selectAccountList(String listNo);

	// 결과 가져오기
//	public List<StatisticsInfoVO> selectStatisticInfoList(StatisticsInfoVO statisticsInfo);
	public List<ManageBankVO> selectStatisticInfoList(StatisticsInfoVO statisticsInfo);
	
	// 결과 은행만 가져오기
	public ManageBankVO selectDistinctManageBankList(StatisticsInfoVO statisticsInfo);
}
