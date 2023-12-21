package kr.or.ddit.finapi.vo;

import java.text.DecimalFormat;

import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false, of = { "finPrdtCd", "dclsMonth", "finCoNo" })
public class RentHouseLoanVO extends BankVO{
	@JsonProperty("fin_prdt_cd")
	@NotBlank
	private String finPrdtCd;
	@JsonProperty("dcls_month")
	@NotBlank
	private String dclsMonth;
	@JsonProperty("fin_co_no")
	@NotBlank
	private String finCoNo;
	@JsonProperty("fin_prdt_nm")
	private String finPrdtNm;
	@JsonProperty("join_way")
	private String joinWay;
	@JsonProperty("dcls_strt_day")
	private String dclsStrtDay;
	@JsonProperty("dcls_end_day")
	private String dclsEndDay;
	@JsonProperty("fin_co_subm_day")
	private String finCoSubmDay;
	@JsonProperty("join_member")
	private String joinMember;
	@JsonProperty("loan_inci_expn")
	private String loanInciExpn;
	@JsonProperty("erly_rpay_fee")
	private String erlyRpayFee;
	@JsonProperty("dly_rate")
	private String dlyRate;
	@JsonProperty("loan_lmt")
	private String loanLmt;
	private String topFinGrpNo;

	// 은행정보
	private String korCoNm;
	private String dclsChrgMan;
	private String hompUrl;
	private String calTel;

	// 주택대출 옵션
	private String mrtgType;
	private String rpayType;
	private String lendRateType;
	private String mrtgTypeNm;
	private String rpayTypeNm;
	private String lendRateTypeNm;
	private double lendRateMin;
	private double lendRateMax;
	private double lendRateAvg;

	private String topFinGrpNm;

	public void setTopFinGrpNo(String topFinGrpNo) {
		this.topFinGrpNo = topFinGrpNo;
		switch (topFinGrpNo) {
		case "020000":
			this.topFinGrpNm = "은행";
			break;
		case "030300":
			this.topFinGrpNm = "저축은행";
			break;
		default:
			break;
		}
	}

	private long loanPeriod;// 대출기간
	private long loanAmount; // 대출액
	private long monthlyPayment; // 월상환금
	private long totalLoanAmount; //총 대출비용
	
	private String dispMonthlyPayment;//월상환금 포맷
	private String disptotalLoanAmount;//총대출비용포맷
	public void setLoanAmount(long loanAmount) {
		this.loanAmount = loanAmount;
		int loanPeriodMonths = (int) (loanPeriod*12);
		double annualInterestRate = lendRateAvg/100; // 연이자
		double monthlyInterestRate = annualInterestRate / 12;
		this.monthlyPayment = (long) ((loanAmount * monthlyInterestRate)
				/ (1 - Math.pow(1 + monthlyInterestRate, -loanPeriodMonths)));
		this.dispMonthlyPayment=formatMoney(monthlyPayment);
		this.totalLoanAmount =  monthlyPayment*(loanPeriod*12);
		this.disptotalLoanAmount = formatMoney(totalLoanAmount);
	}
	
	public String formatMoney(long money) {
		DecimalFormat df = new DecimalFormat("###,###");
		return df.format(money);
	}
}
