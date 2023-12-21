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
import kr.or.ddit.finapi.dao.MortagageLoanDAO;
import kr.or.ddit.finapi.service.MortagageLoanService;
import kr.or.ddit.finapi.vo.BankOptionVO;
import kr.or.ddit.finapi.vo.MortagageLoanOptionVO;
import kr.or.ddit.finapi.vo.MortagageLoanVO;
import kr.or.ddit.finapi.vo.SavingPrdtVO;
import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.pagingVO.SimpleCondition;
@Controller
@RequestMapping("/mortagageLoan/")
public class MortagageLoanController {

	@Inject
	private BankOptionDAO bankOptionDao;
	
	@Inject
	private MortagageLoanService mortagageService;
	
	@Inject
	private MortagageLoanDAO mortageDao;
	
	@ModelAttribute("simpleCondition")
	public SimpleCondition setSimpleCondition() {
		return new SimpleCondition();
	}
	
	/**
	 * 주택담보클릭시 화면
	 * @return
	 */
	@RequestMapping("mortagageLoan")
	public String mortagageLoan(Model model) {
		List<BankOptionVO> bankOptionList = bankOptionDao.selectBankOptionList();
		List<MortagageLoanOptionVO> lendRateTypeList=mortageDao.selectOptionLendRateTypeList();
		List<MortagageLoanOptionVO> mrtgTypeList = mortageDao.selectOptionMrtgTypeList();
		model.addAttribute("mrtgTypeList", mrtgTypeList);
		model.addAttribute("lendRateTypeList", lendRateTypeList);
		model.addAttribute("bankOptionList", bankOptionList);
		return "fin/prdt/mortagageLoan";
	}
	
	/**
	 * 주택담보대출 총 리스트
	 * @param map
	 * @param model
	 * @return
	 */
	@PostMapping("mortagageLoantList.do")
	public String mortagageLoantList(
			@RequestBody HashMap<String, Object> map
			, Model model) {
		int currentPage = (int) map.get("page");
		long loanAmount = Long.parseLong((String)map.get("loanAmount")) ;
		long loanPeriod = Long.parseLong((String)map.get("loanPeriod")) ;
		PaginationInfo<MortagageLoanVO> paging = new PaginationInfo<>(10, 10);
		paging.setDetailCondition(map);
		paging.setCurrentPage(currentPage);
		SimpleCondition simpleCondition = new SimpleCondition();
		System.out.println(map.get("searchWord"));
		if(map.get("searchWord")!=null && map.get("searchWord")!="") {
			simpleCondition.setSearchType(map.get("searchType").toString());
			simpleCondition.setSearchWord(map.get("searchWord").toString());
		}
		paging.setSimpleCondition(simpleCondition);
		List<MortagageLoanVO> mortagageList = mortagageService.retrieveMortagageLoanList(paging);
		for(MortagageLoanVO mortagage : mortagageList) {
			mortagage.setLoanPeriod(loanPeriod);
			mortagage.setLoanAmount(loanAmount);
		}
		paging.setDataList(mortagageList);
		model.addAttribute("paging", paging);
		return "fin/prdt/ajax/mortagageListAjax";
	}
	
	
	@PostMapping("compareMortagage.do")
	public String compareSavingPrdt(
			@RequestBody HashMap<String, Object> map
			,Model model
	) {
		List<String> arrFinPrdtCd = (List<String>) map.get("finPrdtCdList");
		List<String> finCoNoList = (List<String>) map.get("finCoNoList");
		List<String> mrtgTypeList = (List<String>) map.get("mrtgTypeList");
		List<String> rpayTypeList = (List<String>) map.get("rpayTypeList");
		List<String> lendRateTypeList = (List<String>) map.get("lendRateTypeList");
		long loanAmount = Long.parseLong((String) map.get("loanAmount"));
		long loanPeriod = Long.parseLong((String) map.get("loanPeriod"));
		List<MortagageLoanVO> mortagageLoanList = new ArrayList<MortagageLoanVO>();
		for(int i = 0 ; i < arrFinPrdtCd.size();i++) {
			MortagageLoanVO mortagageLoan = new MortagageLoanVO();
			mortagageLoan.setFinPrdtCd(arrFinPrdtCd.get(i));
			mortagageLoan.setFinCoNo(finCoNoList.get(i));
			mortagageLoan.setMrtgType(mrtgTypeList.get(i));
			mortagageLoan.setRpayType(rpayTypeList.get(i));
			mortagageLoan.setLendRateType(lendRateTypeList.get(i));
			mortagageLoan = mortagageService.retrieveMortageLoan(mortagageLoan);
			mortagageLoan.setLoanPeriod(loanPeriod);
			mortagageLoan.setLoanAmount(loanAmount);
			mortagageLoanList.add(mortagageLoan) ;
		}
		model.addAttribute("mortagageLoanList", mortagageLoanList);
		return "fin/prdt/ajax/compareMortagageLoan";
	}
	
	
}
