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
import kr.or.ddit.finapi.dao.RentHouseLoanDAO;
import kr.or.ddit.finapi.service.RentHouseLoanService;
import kr.or.ddit.finapi.vo.BankOptionVO;
import kr.or.ddit.finapi.vo.RentHouseLoanOptionVO;
import kr.or.ddit.finapi.vo.RentHouseLoanVO;
import kr.or.ddit.finapi.vo.SavingPrdtVO;
import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.pagingVO.SimpleCondition;
@Controller
@RequestMapping("/rentHouseLoan/")
public class RentHouseLoanController {

	@Inject
	private BankOptionDAO bankOptionDao;
	
	@Inject
	private RentHouseLoanService rentHouseService;
	
	@Inject
	private RentHouseLoanDAO rentHouseDao;
	
	@ModelAttribute("simpleCondition")
	public SimpleCondition setSimpleCondition() {
		return new SimpleCondition();
	}
	
	/**
	 * 주택담보클릭시 화면
	 * @return
	 */
	@RequestMapping("rentHouseLoan")
	public String RentHouseLoan(Model model) {
		List<BankOptionVO> bankOptionList = bankOptionDao.selectBankOptionList();
		List<RentHouseLoanOptionVO> lendRateTypeList=rentHouseDao.selectOptionLendRateTypeList();
		model.addAttribute("lendRateTypeList", lendRateTypeList);
		model.addAttribute("bankOptionList", bankOptionList);
		return "fin/prdt/rentHouseLoan";
	}
	
	/**
	 * 주택담보대출 총 리스트
	 * @param map
	 * @param model
	 * @return
	 */
	@PostMapping("rentHouseLoantList.do")
	public String RentHouseLoantList(
			@RequestBody HashMap<String, Object> map
			, Model model) {
		int currentPage = (int) map.get("page");
		long loanAmount = Long.parseLong((String)map.get("loanAmount")) ;
		long loanPeriod = Long.parseLong((String)map.get("loanPeriod")) ;
		PaginationInfo<RentHouseLoanVO> paging = new PaginationInfo<>(10, 10);
		paging.setDetailCondition(map);
		paging.setCurrentPage(currentPage);
		SimpleCondition simpleCondition = new SimpleCondition();
		System.out.println(map.get("searchWord"));
		if(map.get("searchWord")!=null && map.get("searchWord")!="") {
			simpleCondition.setSearchType(map.get("searchType").toString());
			simpleCondition.setSearchWord(map.get("searchWord").toString());
		}
		paging.setSimpleCondition(simpleCondition);
		List<RentHouseLoanVO>rentHouseList = rentHouseService.retrieveRentHouseLoanList(paging);
		for(RentHouseLoanVO rentHouse : rentHouseList) {
			rentHouse.setLoanPeriod(loanPeriod);
			rentHouse.setLoanAmount(loanAmount);
		}
		paging.setDataList(rentHouseList);
		model.addAttribute("paging", paging);
		return "fin/prdt/ajax/rentHouseListAjax";
	}
	
	
	@PostMapping("compareRentHouse.do")
	public String compareSavingPrdt(
			@RequestBody HashMap<String, Object> map
			,Model model
	) {
		List<String> arrFinPrdtCd = (List<String>) map.get("finPrdtCdList");
		List<String> finCoNoList = (List<String>) map.get("finCoNoList");
		List<String> rpayTypeList = (List<String>) map.get("rpayTypeList");
		List<String> lendRateTypeList = (List<String>) map.get("lendRateTypeList");
		long loanAmount = Long.parseLong((String) map.get("loanAmount"));
		long loanPeriod = Long.parseLong((String) map.get("loanPeriod"));
		List<RentHouseLoanVO> rentHouseLoanList = new ArrayList<RentHouseLoanVO>();
		for(int i = 0 ; i < arrFinPrdtCd.size();i++) {
			RentHouseLoanVO rentHouseLoan = new RentHouseLoanVO();
			rentHouseLoan.setFinPrdtCd(arrFinPrdtCd.get(i));
			rentHouseLoan.setFinCoNo(finCoNoList.get(i));
			rentHouseLoan.setRpayType(rpayTypeList.get(i));
			rentHouseLoan.setLendRateType(lendRateTypeList.get(i));
			rentHouseLoan = rentHouseService.retrieveRentHouseLoan(rentHouseLoan);
			rentHouseLoan.setLoanPeriod(loanPeriod);
			rentHouseLoan.setLoanAmount(loanAmount);
			rentHouseLoanList.add(rentHouseLoan) ;
		}
		model.addAttribute("rentHouseLoanList", rentHouseLoanList);
		return "fin/prdt/ajax/compareRentHouseLoan";
	}
	
	
}
