package kr.or.ddit.finapi.controller;

import java.time.YearMonth;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.finapi.dao.ApiDatabaseInsertDAO;
import kr.or.ddit.finapi.vo.AccountVO;
import kr.or.ddit.finapi.vo.ManageBankVO;
import kr.or.ddit.finapi.vo.StatisticsInfoVO;
import kr.or.ddit.finapi.vo.StatisticsVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/finApi/")
public class ManageInfoController {
	
	@Inject
	private ApiDatabaseInsertDAO dao;
	
	@Inject
	private ManageInfoProc proc;
	
	@RequestMapping("general")
	public String insertData() {
		
		// 은행정보 받아서 넣기
		List<ManageBankVO> bankList = new ArrayList<ManageBankVO>();
		proc.bankList(bankList);
//		dao.manageBankInsert(bankList);
		
		// 통계목록 인서트
		List<StatisticsVO> statisticsList = new ArrayList<StatisticsVO>();
		proc.statisticsList(statisticsList);  
//		dao.statisticInsert(statisticsList);
		
		// 계정항목 인서트
//		List<AccountVO> accountList = new ArrayList<AccountVO>();
//		for(StatisticsVO statistics:statisticsList) {
//			proc.accountList(statistics.getListNo(), accountList);
//		}
//		dao.accountInsert(accountList);
		
		// 통계정보 인서트
//		List<StatisticsInfoVO> infoList=  new ArrayList<StatisticsInfoVO>();
//		YearMonth ym = YearMonth.now();
//		String endBaseMm = ym.toString().replace("-", "");
//		String startBaseMm = ym.minusYears(1).toString().replace("-", "");
//		String term="Q";
//		for(ManageBankVO bankVO : bankList) {
//			for(StatisticsVO statistics:statisticsList) {
//				proc.statisticsInfo(infoList, bankVO.getFinanceCd(), statistics.getListNo(), term, startBaseMm, endBaseMm);
//			}
//			infoList.clear();
//		}
		
		return "redirect:/general/general";
	}
	
	
	@RequestMapping("apiBusiness")
	public String apiBusiness() {
		return"fin/manageInfo/apiBusiness";
	}
	@RequestMapping("finance")
	public String finance() {
		return"fin/manageInfo/finance";
	}
	@RequestMapping("majorManagement")
	public String majorManagement() {
		return"fin/manageInfo/majorManagement";
	}
	
}
