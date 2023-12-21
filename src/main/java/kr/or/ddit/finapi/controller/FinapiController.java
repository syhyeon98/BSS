 package kr.or.ddit.finapi.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.finapi.dao.ApiDatabaseInsertDAO;
import kr.or.ddit.finapi.vo.BankOptionVO;
import kr.or.ddit.finapi.vo.BankVO;
import kr.or.ddit.finapi.vo.CreditLoanOptionVO;
import kr.or.ddit.finapi.vo.CreditLoanVO;
import kr.or.ddit.finapi.vo.DepositOptionVO;
import kr.or.ddit.finapi.vo.DepositVO;
import kr.or.ddit.finapi.vo.MortagageLoanOptionVO;
import kr.or.ddit.finapi.vo.MortagageLoanVO;
import kr.or.ddit.finapi.vo.RentHouseLoanOptionVO;
import kr.or.ddit.finapi.vo.RentHouseLoanVO;
import kr.or.ddit.finapi.vo.SavingPrdtOptionVO;
import kr.or.ddit.finapi.vo.SavingPrdtVO;

@Controller
@RequestMapping("/finApi/")
public class FinapiController {

	@Inject
	private ApiDatabaseInsertDAO dao;

	@Inject
	private BankInsertProc proc;

	@RequestMapping("finMain")
	public String finMain() {
		String searchContent; // ex)companySearch.json?
		String topFinGrpNo = "020000"; // 은행 권역코드

		// 은행정보 인서트
		/*
		 * searchContent = "companySearch.json?"; List<BankVO> bankList = new
		 * ArrayList<BankVO>(); List<BankOptionVO> bankOptionList = new
		 * ArrayList<BankOptionVO>(); proc.takeBankData(bankList, bankOptionList,
		 * BankVO.class, BankOptionVO.class, searchContent, topFinGrpNo, 3);
		 * dao.bankInsert(bankList); dao.bankOptionInsert(bankOptionList);
		 */

		// 정기예금 데이터를 테이블에 저장
		/*
		 * searchContent = "depositProductsSearch.json?"; List<DepositVO> depositList =
		 * new ArrayList<DepositVO>(); List<DepositOptionVO> depositOptionList = new
		 * ArrayList<DepositOptionVO>(); proc.takeBankData(depositList,
		 * depositOptionList, DepositVO.class, DepositOptionVO.class, searchContent,
		 * topFinGrpNo, 3); dao.depositInsert(depositList);
		 * dao.depositOptionInsert(depositOptionList);
		 */

		// 적금 데이터를 테이블에 저장
//		searchContent = "savingProductsSearch.json?";
//		List<SavingPrdtVO> savingPrdtList = new ArrayList<SavingPrdtVO>();
//		List<SavingPrdtOptionVO> savingPrdtOptionList = new ArrayList<SavingPrdtOptionVO>();
//		proc.takeBankData(savingPrdtList, savingPrdtOptionList, SavingPrdtVO.class, SavingPrdtOptionVO.class, searchContent,
//				topFinGrpNo, 3);
//		dao.savingPrdtInsert(savingPrdtList);
//		dao.savingPrdtOptionInsert(savingPrdtOptionList);
		
		// 주택담보대출 데이터를 테이블에 저장
//		searchContent = "mortgageLoanProductsSearch.json?";
//		List<MortagageLoanVO> mortagageLoanList = new ArrayList<MortagageLoanVO>();
//		List<MortagageLoanOptionVO> mortagageLoanOptionList = new ArrayList<MortagageLoanOptionVO>();
//		proc.takeBankData(mortagageLoanList, mortagageLoanOptionList, MortagageLoanVO.class, MortagageLoanOptionVO.class,
//				searchContent, topFinGrpNo, 3);
//		dao.mortagageLoanInsert(mortagageLoanList);
//		dao.mortagageLoanOptionInsert(mortagageLoanOptionList);
		
		// 전세자금대출 데이터를 테이블에 저장
//		searchContent = "rentHouseLoanProductsSearch.json?";
//		List<RentHouseLoanVO> rentHouseLoanList = new ArrayList<RentHouseLoanVO>();
//		List<RentHouseLoanOptionVO> rentHouseLoanOptionList = new ArrayList<RentHouseLoanOptionVO>();
//		proc.takeBankData(rentHouseLoanList, rentHouseLoanOptionList, RentHouseLoanVO.class, RentHouseLoanOptionVO.class,
//				searchContent, topFinGrpNo, 3);
//		dao.rentHouseLoanInsert(rentHouseLoanList);
//		dao.rentHouseLoanOptionInsert(rentHouseLoanOptionList);
		
		// 개인신용대출 데이터를 테이블에 저장
//		searchContent = "creditLoanProductsSearch.json?";
//		List<CreditLoanVO> creditLoanList = new ArrayList<CreditLoanVO>();
//		List<CreditLoanOptionVO> creditLoanOptionList = new ArrayList<CreditLoanOptionVO>();
//		proc.takeBankData(creditLoanList, creditLoanOptionList, CreditLoanVO.class, CreditLoanOptionVO.class,
//				searchContent, topFinGrpNo, 3);
//		dao.creditLoanInsert(creditLoanList);
//		dao.creditLoanOptionInsert(creditLoanOptionList);
		return "fin/prdt/prdtList";
	}


}
