package kr.or.ddit.finapi.controller;

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
import kr.or.ddit.finapi.service.CreditLoanService;
import kr.or.ddit.finapi.vo.BankOptionVO;
import kr.or.ddit.finapi.vo.CreditLoanVO;
import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.pagingVO.SimpleCondition;

@Controller
@RequestMapping("/creditLoan/")
public class CreditLoanController {

	@Inject
	private BankOptionDAO bankOptionDao;
	
	@Inject
	private CreditLoanService creditService;
	
	@ModelAttribute("simpleCondition")
	public SimpleCondition setSimpleCondition() {
		return new SimpleCondition();
	}
	
	@RequestMapping("creditLoan")
	public String CreditLoan(Model model) {
		List<BankOptionVO> bankOptionList = bankOptionDao.selectBankOptionList();
		model.addAttribute("bankOptionList", bankOptionList);
		return "fin/prdt/creditLoan";
	}
	
	/**
	 * 개인신용대출리스트
	 * @param map
	 * @param model
	 * @return
	 */
	@PostMapping("creditLoanList.do")
	public String CreditLoanList(
			@RequestBody HashMap<String, Object> map
			, Model model) {
		int currentPage = (int) map.get("page");
		PaginationInfo<CreditLoanVO> paging = new PaginationInfo<>(10, 10);
		paging.setDetailCondition(map);
		paging.setCurrentPage(currentPage);
		SimpleCondition simpleCondition = new SimpleCondition();
		if(map.get("searchWord")!=null && map.get("searchWord")!="") {
			simpleCondition.setSearchType(map.get("searchType").toString());
			simpleCondition.setSearchWord(map.get("searchWord").toString());
		}
		paging.setSimpleCondition(simpleCondition);
		List<CreditLoanVO>creditLoanList = creditService.retrieveCreditLoanList(paging);
		List<CreditLoanVO>allCreditLoanList= creditService.retrieveCreditLoanList();
		paging.setDataList(creditLoanList);
		model.addAttribute("paging", paging);
		model.addAttribute("allCreditLoanList", allCreditLoanList);
		return "fin/prdt/ajax/creditLoanListAjax";
	}
	
	
}
