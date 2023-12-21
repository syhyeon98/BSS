package kr.or.ddit.finapi.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.finapi.dao.BankOptionDAO;
import kr.or.ddit.finapi.service.SavingPrdtService;
import kr.or.ddit.finapi.vo.BankOptionVO;
import kr.or.ddit.finapi.vo.DepositVO;
import kr.or.ddit.finapi.vo.SavingPrdtVO;
import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.pagingVO.SimpleCondition;

@Controller
@RequestMapping("/saving/")
public class SavingPrdtController {

	@Inject
	private BankOptionDAO bankOptionDao;

	@Inject
	private SavingPrdtService savingService;
	
	@ModelAttribute("simpleCondition")
	public SimpleCondition setSimpleCondition() {
		return new SimpleCondition();
	}
	
	/**
	 * 적금 클릭시 화면
	 * @param model
	 * @return
	 */
	@RequestMapping("savingPrdt")
	public String savingPrdtForm(Model model) {
		List<BankOptionVO> bankOptionList = bankOptionDao.selectBankOptionList();
		model.addAttribute("bankOptionList", bankOptionList);
		return "fin/prdt/savingPrdt";
	}
	
	
	/**
	 * 적금 총 리스트
	 * @param map
	 * @param model
	 * @return
	 */
	@PostMapping("savingPrdtList.do")
	public String savingPrdtList(
			@RequestBody HashMap<String, Object> map
			, Model model) {
		int currentPage = (int) map.get("page");
		long saveMoney = Long.parseLong((String)map.get("saveMoney")) ;
		PaginationInfo<SavingPrdtVO> paging = new PaginationInfo<>(10, 10);
		paging.setDetailCondition(map);
		paging.setCurrentPage(currentPage);
		SimpleCondition simpleCondition = new SimpleCondition();
		System.out.println(map.get("searchWord"));
		if(map.get("searchWord")!=null && map.get("searchWord")!="") {
			simpleCondition.setSearchType(map.get("searchType").toString());
			simpleCondition.setSearchWord(map.get("searchWord").toString());
		}
		paging.setSimpleCondition(simpleCondition);
		List<SavingPrdtVO> savingPrdtList = savingService.retrieveSavingPrdtList(paging);
		for(SavingPrdtVO savingPrdt:savingPrdtList) {
			savingPrdt.setSaveMoney(saveMoney);
		}
		paging.setDataList(savingPrdtList);
		model.addAttribute("paging", paging);
		return "fin/prdt/ajax/savingPrdtListAjax";
	}
	
	@PostMapping("compareSavingPrdt.do")
	public String compareSavingPrdt(
			@RequestBody HashMap<String, Object> map
			,Model model
	) {
		List<String> arrFinPrdtCd = (List<String>) map.get("finPrdtCdList");
		List<String> intrRateTypeList = (List<String>) map.get("intrRateTypeList");
		List<String> finCoNoList = (List<String>) map.get("finCoNoList");
		List<String> saveTrmList = (List<String>) map.get("saveTrmList");
		List<String> rsrvTypeList = (List<String>) map.get("rsrvTypeList");
		long saveMoney = Long.parseLong((String) map.get("saveMoney"));
		List<SavingPrdtVO> savingPrdtList = new ArrayList<SavingPrdtVO>();
		for(int i = 0 ; i < arrFinPrdtCd.size();i++) {
			SavingPrdtVO savingPrdt = new SavingPrdtVO();
			savingPrdt.setFinPrdtCd(arrFinPrdtCd.get(i));
			savingPrdt.setIntrRateType(intrRateTypeList.get(i));
			savingPrdt.setFinCoNo(finCoNoList.get(i));
			savingPrdt.setSaveTrm(Integer.parseInt(saveTrmList.get(i)) );
			savingPrdt.setRsrvType(rsrvTypeList.get(i));
			savingPrdt = savingService.rerieveSavingPrdt(savingPrdt);
			savingPrdt.setSaveMoney(saveMoney);
			savingPrdtList.add(savingPrdt) ;
		}
		model.addAttribute("savingPrdtList", savingPrdtList);
		return "fin/prdt/ajax/compareSavingPrdt";
	}
	
	
	
}
