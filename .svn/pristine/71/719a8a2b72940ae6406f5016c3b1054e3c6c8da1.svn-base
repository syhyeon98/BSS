package kr.or.ddit.finapi.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.finapi.vo.AccountVO;
import kr.or.ddit.finapi.vo.BankOptionVO;
import kr.or.ddit.finapi.vo.BankVO;
import kr.or.ddit.finapi.vo.CreditLoanOptionVO;
import kr.or.ddit.finapi.vo.CreditLoanVO;
import kr.or.ddit.finapi.vo.DepositOptionVO;
import kr.or.ddit.finapi.vo.DepositVO;
import kr.or.ddit.finapi.vo.DescriptionVO;
import kr.or.ddit.finapi.vo.ManageBankVO;
import kr.or.ddit.finapi.vo.MortagageLoanOptionVO;
import kr.or.ddit.finapi.vo.MortagageLoanVO;
import kr.or.ddit.finapi.vo.RentHouseLoanOptionVO;
import kr.or.ddit.finapi.vo.RentHouseLoanVO;
import kr.or.ddit.finapi.vo.SavingPrdtOptionVO;
import kr.or.ddit.finapi.vo.SavingPrdtVO;
import kr.or.ddit.finapi.vo.StatisticsInfoVO;
import kr.or.ddit.finapi.vo.StatisticsVO;


@Mapper
public interface ApiDatabaseInsertDAO {
	
	
	/**
	 * 은행정보 데이터 
	 * @param bankList
	 * @return
	 */
	public int bankInsert(List<BankVO> bankList);

	
	/**
	 * 은행정보 옵션 데이터 
	 * @param bankOptionList
	 * @return
	 */
	public int bankOptionInsert(List<BankOptionVO> bankOptionList);
	
	/**
	 * 정기예금데이터 인서트
	 * @param depositList
	 * @return
	 */
	public int depositInsert(List<DepositVO> depositList);
	
	
	/**
	 * 정기예금 옵션 데이터 인서트
	 * @param depositOptionList
	 * @return
	 */
	public int depositOptionInsert(List<DepositOptionVO> depositOptionList);
	
	
	/**
	 * 적금데이터 인서트
	 * @param savingPrdtList
	 * @return
	 */
	public int savingPrdtInsert(List<SavingPrdtVO> savingPrdtList);
	
	
	/**
	 * 적금 옵션 데이터 인서트
	 * @param savingPrdtOptionInsert
	 * @return
	 */
	public int savingPrdtOptionInsert(List<SavingPrdtOptionVO> savingPrdtOptionInsert);
	
	/**
	 * 주택담보대출 데이터 인서트
	 * @param mortagageLoanList
	 * @return
	 */
	public int mortagageLoanInsert(List<MortagageLoanVO> mortagageLoanList);
	
	/**
	 * 주택담보대출 옵션 데이터 인서트
	 * @param mortagageLoanOptionList
	 * @return
	 */
	public int mortagageLoanOptionInsert(List<MortagageLoanOptionVO> mortagageLoanOptionList);
	
	/**
	 * 전세자금대출 데이터 인서트
	 * @param rentHouseLoanList
	 * @return
	 */
	public int rentHouseLoanInsert(List<RentHouseLoanVO> rentHouseLoanList);
	
	/**
	 * 전세자금대출 옵션 데이터 인서트
	 * @param rentHouseLoanOptionList
	 * @return
	 */
	public int rentHouseLoanOptionInsert(List<RentHouseLoanOptionVO> rentHouseLoanOptionList);
	
	
	/**
	 * 개인신용대출 데이터 인서트
	 * @param creditLoanList
	 * @return
	 */
	public int creditLoanInsert(List<CreditLoanVO> creditLoanList);
	
	/**
	 * 개인신용대출옵션 데이터 인서트
	 * @param creditLoanOptionList
	 * @return
	 */
	public int creditLoanOptionInsert(List<CreditLoanOptionVO> creditLoanOptionList);
	
	
	
	
	/**
	 * 경영정보은행 데이터 인서트
	 * @param manageBankList
	 * @return
	 */
	public int manageBankInsert(List<ManageBankVO> manageBankList);
	
	/**
	 * 통계목록 데이터 인서트
	 * @param statisticsList
	 * @return
	 */
	public int statisticInsert(List<StatisticsVO> statisticsList);
	
	
	/**
	 * 계정항목 데이터 인서트
	 * @param accountList
	 * @return
	 */
	public int accountInsert(List<AccountVO> accountList);
	
	/**
	 * 통계정보 데이터 인서트
	 * @param statisticsInfoList
	 * @return
	 */
//	public int statisticInfoInsert(List<StatisticsInfoVO> statisticsInfoList);
	
	public int statisticInfoInsert(StatisticsInfoVO statisticsInfoList);
	
	public int statisticInfoDescriptionInsert(DescriptionVO description);
	
	
	
}
