package kr.or.ddit.finapi.controller;


import java.time.YearMonth;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.finapi.dao.ManageInfoDAO;
import kr.or.ddit.finapi.service.ManageInfoService;
import kr.or.ddit.finapi.vo.AccountVO;
import kr.or.ddit.finapi.vo.ManageBankVO;
import kr.or.ddit.finapi.vo.ParamDataVO;
import kr.or.ddit.finapi.vo.StatisticsInfoVO;
import kr.or.ddit.finapi.vo.StatisticsVO;

@Controller
@RequestMapping("/general/")
public class GeneralController {
	
	@Inject
	private ManageInfoProc proc;
	
	@Inject
	private ManageInfoDAO dao;
	
	@Inject
	private ManageInfoService service;
	
	@RequestMapping("general")
	public String general(Model model) {
		List<StatisticsVO> statisticsList = new ArrayList<StatisticsVO>();
		proc.statisticsList(statisticsList, "A");

		List<ManageBankVO> bankList = new ArrayList<ManageBankVO>();

		proc.bankList(bankList);

		model.addAttribute("bankList", bankList);
		model.addAttribute("statisticsList", statisticsList);
		
//		List<ManageBankVO> bankList = service.retrieveManageBankList();
//		model.addAttribute("bankList", bankList);
//		List<StatisticsVO> statisticsList = service.retrieveStaticsList("일반현황");
//		model.addAttribute("statisticsList", statisticsList);
		return "fin/manageInfo/general";
	}
	@RequestMapping("finance")
	public String finance(Model model) {
		List<StatisticsVO> statisticsList = new ArrayList<StatisticsVO>();
		proc.statisticsList(statisticsList, "B");
		
		List<ManageBankVO> bankList = new ArrayList<ManageBankVO>();
		
		proc.bankList(bankList);
		
		model.addAttribute("bankList", bankList);
		model.addAttribute("statisticsList", statisticsList);
		
//		List<ManageBankVO> bankList = service.retrieveManageBankList();
//		model.addAttribute("bankList", bankList);
//		List<StatisticsVO> statisticsList = service.retrieveStaticsList("일반현황");
//		model.addAttribute("statisticsList", statisticsList);
		return "fin/manageInfo/general";
	}
	
	@RequestMapping("majorManagement")
	public String majorManagement(Model model) {
		List<StatisticsVO> statisticsList = new ArrayList<StatisticsVO>();
		proc.statisticsList(statisticsList, "C");
		
		List<ManageBankVO> bankList = new ArrayList<ManageBankVO>();
		
		proc.bankList(bankList);
		
		model.addAttribute("bankList", bankList);
		model.addAttribute("statisticsList", statisticsList);
		
		return "fin/manageInfo/general";
	}
	
	@RequestMapping("apiBusiness")
	public String apiBusiness(Model model) {
		List<StatisticsVO> statisticsList = new ArrayList<StatisticsVO>();
		proc.statisticsList(statisticsList, "D");
		
		List<ManageBankVO> bankList = new ArrayList<ManageBankVO>();
		
		proc.bankList(bankList);
		
		model.addAttribute("bankList", bankList);
		model.addAttribute("statisticsList", statisticsList);
		
		return "fin/manageInfo/general";
	}
	
	
	
//	@RequestMapping("finance")
//	public String finance(Model model) {
//		List<ManageBankVO> bankList = service.retrieveManageBankList();
//		model.addAttribute("bankList", bankList);
//		List<StatisticsVO> statisticsList = service.retrieveStaticsList("재무현황");
//		model.addAttribute("statisticsList", statisticsList);
//		return "fin/manageInfo/general2";
//	}

	@GetMapping("accountList.do")
	public String accountList(Model model, String listNo) {
		List<AccountVO> accountList = new ArrayList<AccountVO>();
		proc.accountList(listNo, accountList);
//		List<AccountVO> accountList = service.retrieveAccountList(listNo);
		model.addAttribute("accountList", accountList);
		return "fin/manageInfo/ajax/accountList";
	}

	@PostMapping("statisticsInfo.do")
	public String statisticsInfo(Model model, @RequestBody ParamDataVO param) {
		List<StatisticsInfoVO> infoList = new ArrayList<StatisticsInfoVO>();
		String listNo = param.getListNo();
		String startBaseMm = param.getStartBaseMm();
		String endBaseMm = param.getEndBaseMm();
//		String term = param.getTerm();
//		YearMonth ym = YearMonth.now();
//		String endBaseMm = ym.toString().replace("-", "");
//		String startBaseMm = ym.minusYears(1).toString().replace("-", "");
		String term = "Q";
		param.getBankCd().remove("");
		param.getAccountCd().remove("");
		
		List<String> financeCdList = param.getBankCd();
		List<String> accountCdList = param.getAccountCd();
		List<String> unitList = new ArrayList<String>();
		for(String financeCd : financeCdList) {
			for(String accountCd: accountCdList) {
				proc.statisticsInfo(infoList, financeCd, listNo, accountCd, term, startBaseMm, endBaseMm,unitList);
			}
		}
		Set<String> baseMonthSet = new HashSet<String>();
		Set<String> bankSet = new HashSet<String>();
		for(StatisticsInfoVO info:infoList) {
			baseMonthSet.add(info.getBaseMonth());
			bankSet.add(info.getFinanceNm());
		}
		
		ArrayList<String> baseMonthList = new ArrayList<String>(baseMonthSet);
		ArrayList<String> bankList = new ArrayList<String>(bankSet);
		Collections.sort(baseMonthList);
		Collections.sort(bankList);
		model.addAttribute("unitList",unitList);
		model.addAttribute("baseMonthList", baseMonthList);
		model.addAttribute("bankList", bankList);
		model.addAttribute("accountCdList", accountCdList);
		model.addAttribute("infoList", infoList);
		return "fin/manageInfo/ajax/statisticsInfo";
	}
//	@PostMapping("statisticsInfo.do")
//	public String statisticsInfo(Model model, @RequestBody ParamDataVO param) {
//		List<StatisticsInfoVO> infoList = new ArrayList<StatisticsInfoVO>();
//		List<ManageBankVO> infoList = new ArrayList<ManageBankVO>();
//		List<ManageBankVO> bankList = new ArrayList<ManageBankVO>();
//		String listNo = param.getListNo();
//		String startBaseMm = param.getStartBaseMm();
//		String endBaseMm = param.getEndBaseMm();
//		String term = param.getTerm();
		
//		List<String> financeCdList = param.getBankCd();
//		List<String> accountCdList = param.getAccountCd();
//		List<String> accountNmList = param.getAccountNm();
//		
//		for(String financeCd:financeCdList) {
//			StatisticsInfoVO info = null ;
//			for(int i = 0 ; i<accountCdList.size();i++) {
//				 info = new StatisticsInfoVO();
//				info.setAccountCd(accountCdList.get(i));
//				info.setAccountNm(accountNmList.get(i));
//				info.setFinanceCd(financeCd);
//				infoList.addAll(service.retrieveManageBankList(info));
//			}
//			ManageBankVO mb = dao.selectDistinctManageBankList(info);
//			bankList.add(mb);
//		}
//		
//		model.addAttribute("infoList", infoList);
//		model.addAttribute("bankList", bankList);
//		return "fin/manageInfo/ajax/statisticsInfo";
//	}

}
