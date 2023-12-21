package kr.or.ddit.finapi.controller;

import java.time.LocalDate;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.finapi.vo.FinMarketAccountVO;
import kr.or.ddit.finapi.vo.FinMarketItemVO;
import kr.or.ddit.finapi.vo.ParamDataVO;
import kr.or.ddit.finapi.vo.StatisticsInfoVO;

@Controller
@RequestMapping("/finMarket/")
public class FinMarketController {

	@Inject
	private FinMarketProc proc;

	@RequestMapping("exchangeRate")
	public String exchageRate(Model model) {
		List<FinMarketAccountVO> accountList = new ArrayList<FinMarketAccountVO>();
		proc.accountList("731Y001", accountList);
		model.addAttribute("accountList", accountList);
		return "fin/market/exchangeRate";
	}


	@RequestMapping("firstexchangeRateList")
	public String firstexchangeRateList(Model model) {
		List<FinMarketItemVO> itemList = new ArrayList<FinMarketItemVO>();
		String startBaseMm = LocalDate.now().toString().replace("-", "");
		String endBaseMm = LocalDate.now().toString().replace("-", "");
		proc.finMarketItemList(itemList, "731Y001", "D", startBaseMm, endBaseMm, null);
		Set<String> time = new HashSet<String>();
		Set<String> dataName = new HashSet<String>();
	
		
		if (!CollectionUtils.isEmpty(itemList)) {
			for (FinMarketItemVO item : itemList) {
				time.add(item.getTime());
			}

			for (FinMarketItemVO item : itemList) {
				dataName.add(item.getItemName1());
			}
		} else {
			startBaseMm = LocalDate.now().minusDays(1).toString().replace("-", "");
			endBaseMm = LocalDate.now().minusDays(1).toString().replace("-", "");
			proc.finMarketItemList(itemList, "731Y001", "D", startBaseMm, endBaseMm, null);
			for (FinMarketItemVO item : itemList) {
				time.add(item.getTime());
			}
			for (FinMarketItemVO item : itemList) {
				dataName.add(item.getItemName1());
			}
		}

		
		ArrayList<String> timeList = new ArrayList<String>(time);
		Collections.sort(timeList);
		ArrayList<String> dataListNm = new ArrayList<String>(dataName);
		Collections.sort(dataListNm);
//		Map<String, Object> response = new HashMap<>();
		model.addAttribute("itemList", itemList);
		model.addAttribute("timeList", timeList);
		model.addAttribute("dataListNm", dataListNm);
		return "jsonView";
	}
	
	@RequestMapping("mainExchangeRateList")
	public String mainExchangeRateList(Model model) {
		List<FinMarketItemVO> itemList = new ArrayList<FinMarketItemVO>();
		String startBaseMm = LocalDate.now().minusDays(7).toString().replace("-", "");
		String endBaseMm = LocalDate.now().toString().replace("-", "");
		proc.mainMarketItemList(itemList, "731Y001", "D", startBaseMm, endBaseMm, null);
		Set<String> time = new HashSet<String>();
		
		for (FinMarketItemVO item : itemList) {
			time.add(item.getTime());
		}
		ArrayList<String> timeList = new ArrayList<String>(time);
		Collections.sort(timeList);
		
		Set<String> dataName = new HashSet<String>();
		for (FinMarketItemVO item : itemList) {
			dataName.add(item.getItemName1());
		}
		ArrayList<String> dataListNm = new ArrayList<String>(dataName);
		Collections.sort(dataListNm);
//		Map<String, Object> response = new HashMap<>();
		model.addAttribute("itemList", itemList);
		model.addAttribute("timeList", timeList);
		model.addAttribute("dataListNm", dataListNm);
		return "jsonView";
	}
	


	@PostMapping("exchangeRateList")
	public String exchageRateList(Model model, @RequestBody ParamDataVO param) {

		List<FinMarketItemVO> itemList = new ArrayList<FinMarketItemVO>();
		String startBaseMm = param.getStartBaseMm();
		String endBaseMm = param.getEndBaseMm();
		List<String> accountCdList = param.getAccountCd();
		for (String accountCd : accountCdList) {
			proc.finMarketItemList(itemList, "731Y001", "D", startBaseMm, endBaseMm, accountCd);
		}
		Set<String> time = new HashSet<String>();
		Set<String> dataName = new HashSet<String>();
		if (!CollectionUtils.isEmpty(itemList)) {
			for (FinMarketItemVO item : itemList) {
				time.add(item.getTime());
			}

			for (FinMarketItemVO item : itemList) {
				dataName.add(item.getItemName1());
			}
		} else {
			startBaseMm = LocalDate.now().minusDays(1).toString().replace("-", "");
			endBaseMm = LocalDate.now().minusDays(1).toString().replace("-", "");
			proc.finMarketItemList(itemList, "731Y001", "D", startBaseMm, endBaseMm, null);
			for (FinMarketItemVO item : itemList) {
				time.add(item.getTime());
			}
			for (FinMarketItemVO item : itemList) {
				dataName.add(item.getItemName1());
			}
		}
		ArrayList<String> timeList = new ArrayList<String>(time);
		Collections.sort(timeList);
		ArrayList<String> dataListNm = new ArrayList<String>(dataName);
		Collections.sort(dataListNm);
		model.addAttribute("itemList", itemList);
		model.addAttribute("timeList", timeList);
		model.addAttribute("dataListNm", dataListNm);
		return "jsonView";
	}

	@RequestMapping("stockMarket")
	public String stockMarket(Model model) {

		List<FinMarketAccountVO> accountList = new ArrayList<FinMarketAccountVO>();
		proc.accountList("802Y001", accountList);
		model.addAttribute("accountList", accountList);
		return "fin/market/stockMarket";

	}

	@RequestMapping("firstStockMarket")
	public String firstStockMarket(Model model) {
		List<FinMarketItemVO> itemList = new ArrayList<FinMarketItemVO>();
		String startBaseMm = LocalDate.now().toString().replace("-", "");
		String endBaseMm = LocalDate.now().toString().replace("-", "");
		Set<String> dataName = new HashSet<String>();
		Set<String> time = new HashSet<String>();
		proc.finMarketItemList(itemList, "802Y001", "D", startBaseMm, endBaseMm, null);

		if (!CollectionUtils.isEmpty(itemList)) {
			for (FinMarketItemVO item : itemList) {
				time.add(item.getTime());
			}

			for (FinMarketItemVO item : itemList) {
				dataName.add(item.getItemName1());
			}
		} else {
			startBaseMm = LocalDate.now().minusDays(1).toString().replace("-", "");
			endBaseMm = LocalDate.now().minusDays(1).toString().replace("-", "");
			proc.finMarketItemList(itemList, "802Y001", "D", startBaseMm, endBaseMm, null);
			for (FinMarketItemVO item : itemList) {
				time.add(item.getTime());
			}
			for (FinMarketItemVO item : itemList) {
				dataName.add(item.getItemName1());
			}
		}

		ArrayList<String> timeList = new ArrayList<String>(time);
		Collections.sort(timeList);
		ArrayList<String> dataListNm = new ArrayList<String>(dataName);
		Collections.sort(dataListNm);
//		Map<String, Object> response = new HashMap<>();
		model.addAttribute("itemList", itemList);
		model.addAttribute("timeList", timeList);
		model.addAttribute("dataListNm", dataListNm);
		return "jsonView";
	}
	@RequestMapping("mainStockMarket")
	public String mainStockMarket(Model model) {
		List<FinMarketItemVO> itemList = new ArrayList<FinMarketItemVO>();
		String startBaseMm = LocalDate.now().minusDays(7).toString().replace("-", "");
		String endBaseMm = LocalDate.now().toString().replace("-", "");
		Set<String> dataName = new HashSet<String>();
		Set<String> time = new HashSet<String>();
		proc.mainMarketItemList(itemList, "802Y001", "D", startBaseMm, endBaseMm, "0001000");
		proc.mainMarketItemList(itemList, "802Y001", "D", startBaseMm, endBaseMm, "0089000");
		
		if (!CollectionUtils.isEmpty(itemList)) {
			for (FinMarketItemVO item : itemList) {
				time.add(item.getTime());
			}
			
			for (FinMarketItemVO item : itemList) {
				dataName.add(item.getItemName1());
			}
		} else {
			startBaseMm = LocalDate.now().minusDays(1).toString().replace("-", "");
			endBaseMm = LocalDate.now().minusDays(1).toString().replace("-", "");
			proc.finMarketItemList(itemList, "802Y001", "D", startBaseMm, endBaseMm, null);
			for (FinMarketItemVO item : itemList) {
				time.add(item.getTime());
			}
			for (FinMarketItemVO item : itemList) {
				dataName.add(item.getItemName1());
			}
		}
		
		ArrayList<String> timeList = new ArrayList<String>(time);
		Collections.sort(timeList);
		ArrayList<String> dataListNm = new ArrayList<String>(dataName);
		Collections.sort(dataListNm);
//		Map<String, Object> response = new HashMap<>();
		model.addAttribute("itemList", itemList);
		model.addAttribute("timeList", timeList);
		model.addAttribute("dataListNm", dataListNm);
		return "jsonView";
	}

	@PostMapping("stockMarketList")
	public String stockMarketList(Model model, @RequestBody ParamDataVO param) {

		List<FinMarketItemVO> itemList = new ArrayList<FinMarketItemVO>();
		String startBaseMm = param.getStartBaseMm();
		String endBaseMm = param.getEndBaseMm();
		List<String> accountCdList = param.getAccountCd();
		for (String accountCd : accountCdList) {
			proc.finMarketItemList(itemList, "802Y001", "D", startBaseMm, endBaseMm, accountCd);
		}
		Set<String> time = new HashSet<String>();
		for (FinMarketItemVO item : itemList) {
			time.add(item.getTime());
		}
		ArrayList<String> timeList = new ArrayList<String>(time);
		Collections.sort(timeList);
		Map<String, Object> response = new HashMap<>();
		Set<String> dataName = new HashSet<String>();
		for (FinMarketItemVO item : itemList) {
			dataName.add(item.getItemName1());
		}
		ArrayList<String> dataListNm = new ArrayList<String>(dataName);
		Collections.sort(dataListNm);
		model.addAttribute("itemList", itemList);
		model.addAttribute("timeList", timeList);
		model.addAttribute("dataListNm", dataListNm);
		return "jsonView";
	}

	@RequestMapping("nationalIndex")
	public String nationalIndex(Model model) {

		List<FinMarketAccountVO> accountList = new ArrayList<FinMarketAccountVO>();
		proc.accountList("902Y002", accountList);

		if (accountList != null) {
			List<String> valuesToRemove = Arrays.asList("A", "Q");
			accountList.removeIf(account -> valuesToRemove.contains(account.getCycle()));
		}

		model.addAttribute("accountList", accountList);
		return "fin/market/nationalIndex";

	}

	@RequestMapping("firstNationalIndex")
	public String firstNationalIndex(Model model) {
		List<FinMarketItemVO> itemList = new ArrayList<FinMarketItemVO>();

		YearMonth ym = YearMonth.now();
		String endBaseMm = ym.toString().replace("-", "");
		String startBaseMm = ym.minusMonths(1).toString().replace("-", "");
		proc.finMarketItemList(itemList, "902Y002", "M", startBaseMm, endBaseMm, null);
		Set<String> time = new HashSet<String>();
		for (FinMarketItemVO item : itemList) {
			time.add(item.getTime());
		}
		ArrayList<String> timeList = new ArrayList<String>(time);
		Collections.sort(timeList);

		Set<String> dataName = new HashSet<String>();
		for (FinMarketItemVO item : itemList) {
			dataName.add(item.getItemName1());
		}
		ArrayList<String> dataListNm = new ArrayList<String>(dataName);
		Collections.sort(dataListNm);
//		Map<String, Object> response = new HashMap<>();
		model.addAttribute("itemList", itemList);
		model.addAttribute("timeList", timeList);
		model.addAttribute("dataListNm", dataListNm);
		return "jsonView";
	}

	@PostMapping("nationalIndexList")
	public String nationalIndexList(Model model, @RequestBody ParamDataVO param) {

		List<FinMarketItemVO> itemList = new ArrayList<FinMarketItemVO>();
		String startBaseMm = param.getStartBaseMm();
		String endBaseMm = param.getEndBaseMm();
		List<String> accountCdList = param.getAccountCd();
		for (String accountCd : accountCdList) {
			proc.finMarketItemList(itemList, "902Y002", "M", startBaseMm, endBaseMm, accountCd);
		}
		Set<String> time = new HashSet<String>();
		for (FinMarketItemVO item : itemList) {
			time.add(item.getTime());
		}
		ArrayList<String> timeList = new ArrayList<String>(time);
		Collections.sort(timeList);
		Map<String, Object> response = new HashMap<>();
		Set<String> dataName = new HashSet<String>();
		for (FinMarketItemVO item : itemList) {
			dataName.add(item.getItemName1());
		}
		ArrayList<String> dataListNm = new ArrayList<String>(dataName);
		Collections.sort(dataListNm);
		model.addAttribute("itemList", itemList);
		model.addAttribute("timeList", timeList);
		model.addAttribute("dataListNm", dataListNm);
		return "jsonView";
	}

	@RequestMapping("internalIntrRates")
	public String internalIntrRates(Model model) {

		List<FinMarketAccountVO> accountList = new ArrayList<FinMarketAccountVO>();
		proc.accountList("902Y001", accountList);

		if (accountList != null) {
			List<String> valuesToRemove = Arrays.asList("A", "Q");
			accountList.removeIf(account -> valuesToRemove.contains(account.getCycle()));
		}
		model.addAttribute("accountList", accountList);
		return "fin/market/internalIntrRates";

	}

	@RequestMapping("firstInternalIntrRates")
	public String firstInternalIntrRates(Model model) {
		List<FinMarketItemVO> itemList = new ArrayList<FinMarketItemVO>();
		YearMonth ym = YearMonth.now();
		String endBaseMm = ym.toString().replace("-", "");
		String startBaseMm = ym.minusMonths(1).toString().replace("-", "");
		proc.finMarketItemList(itemList, "902Y001", "M", startBaseMm, endBaseMm, null);
		Set<String> time = new HashSet<String>();
		for (FinMarketItemVO item : itemList) {
			time.add(item.getTime());
		}
		ArrayList<String> timeList = new ArrayList<String>(time);
		Collections.sort(timeList);

		Set<String> dataName = new HashSet<String>();
		for (FinMarketItemVO item : itemList) {
			dataName.add(item.getItemName1());
		}
		ArrayList<String> dataListNm = new ArrayList<String>(dataName);
		Collections.sort(dataListNm);
//		Map<String, Object> response = new HashMap<>();
		model.addAttribute("itemList", itemList);
		model.addAttribute("timeList", timeList);
		model.addAttribute("dataListNm", dataListNm);
		return "jsonView";
	}

	@PostMapping("internalIntrRatesList")
	public String internalIntrRatesList(Model model, @RequestBody ParamDataVO param) {

		List<FinMarketItemVO> itemList = new ArrayList<FinMarketItemVO>();
		String startBaseMm = param.getStartBaseMm();
		String endBaseMm = param.getEndBaseMm();
		List<String> accountCdList = param.getAccountCd();
		for (String accountCd : accountCdList) {
			proc.finMarketItemList(itemList, "902Y001", "M", startBaseMm, endBaseMm, accountCd);
		}
		Set<String> time = new HashSet<String>();
		for (FinMarketItemVO item : itemList) {
			time.add(item.getTime());
		}
		ArrayList<String> timeList = new ArrayList<String>(time);
		Collections.sort(timeList);
		Map<String, Object> response = new HashMap<>();
		Set<String> dataName = new HashSet<String>();
		for (FinMarketItemVO item : itemList) {
			dataName.add(item.getItemName1());
		}
		ArrayList<String> dataListNm = new ArrayList<String>(dataName);
		Collections.sort(dataListNm);
		model.addAttribute("itemList", itemList);
		model.addAttribute("timeList", timeList);
		model.addAttribute("dataListNm", dataListNm);
		return "jsonView";
	}

}
