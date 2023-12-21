package kr.or.ddit.finapi.vo;

import java.text.DecimalFormat;

import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 
 *적금상품 VO
 * @author moonyt
 *
 */
@Data
@EqualsAndHashCode(callSuper=false,of={"finPrdtCd","dclsMonth","finCoNo"})
public class SavingPrdtVO extends BankVO{
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
	@JsonProperty("mtrt_int")
	private String mtrtInt;
	@JsonProperty("spcl_cnd")
	private String spclCnd;
	@JsonProperty("join_deny")
	private String joinDeny;
	@JsonProperty("etc_note")
	private String etcNote;
	@JsonProperty("max_limit")
	private Integer maxLimit;
	@JsonProperty("dcls_strt_day")
	private String dclsStrtDay;
	@JsonProperty("dcls_end_day")
	private String dclsEndDay;
	@JsonProperty("fin_co_subm_day")
	private String finCoSubmDay;
	@JsonProperty("join_member")
	private String joinMember;
	
	private String topFinGrpNo;
	
	//가입제한을 숫자가 아닌 이름으로 바꾸기 위함
		private String joinDenyNm;

		public void setJoinDeny(String joinDeny) {
			this.joinDeny = joinDeny;
			switch (joinDeny) {
			case "1":
				this.joinDenyNm="제한없음";
				break;
			case "2":
				this.joinDenyNm="서민적용";
				break;
			case "3":
				this.joinDenyNm="일부제한";
				break;
			default:
				break;
			}
		}
		
		// 은행정보
		private String korCoNm;
		private String dclsChrgMan;
		private String hompUrl;
		private String calTel;
		
		// 상품옵션정보
		private Integer saveTrm;
		private String intrRateType;
		private String intrRateTypeNm;
		private Double intrRate;
		private Double intrRate2;
		private String rsrvType;
		private String rsrvTypeNm;
		
		// 세후 이자율
		private Double afterTexIntrRate;
		// 저축금액
		private long saveMoney;
		// 이자액
		private long intrAmount; 
		
		// 이자액+저축금액
		private String totalMoney;
		
		// 이자액 화면에 표현
		private String dispIntrAmount;
		
		public void setIntrRate(Double intrRate) {
			this.intrRate = intrRate;
			afterTexIntrRate = intrRate * 0.8461;
			afterTexIntrRate = Math.round(afterTexIntrRate*100)/100.0;
		}
		
		//저축금액 저장시 이자액 계싼하기
		public void setSaveMoney(long saveMoney) {
			this.saveMoney = saveMoney;
			if(this.intrRateType.equals("S")) {
				for(int i = 1;i<=saveTrm;i++){
					double monthlyInterestRate = (afterTexIntrRate * i) / saveTrm / 100; // 월별 이자율 계산
				    double monthlyInterest = saveMoney * monthlyInterestRate; // 이번 달에 얻는 이자
				    intrAmount += monthlyInterest;
				}
			}else if(this.intrRateType.equals("M")){
				double monthlyInterestRate = (afterTexIntrRate / 100) / 12; // 월 이자율 계산
				double totalAmount = 0.0;
				for (int i = 1; i <= saveTrm; i++) {
					totalAmount += saveMoney * Math.pow(1 + monthlyInterestRate, i);
				}
				intrAmount = (long) (totalAmount - (saveMoney * saveTrm)); // 총 이자액 계산
			}
			this.dispIntrAmount = formatMoney(intrAmount);
			this.totalMoney = formatMoney((saveMoney+intrAmount)*saveTrm);
		}
		
		public String formatMoney(long money) {
			DecimalFormat df = new DecimalFormat("###,###");
			return df.format(money);
		}
		
		private String topFinGrpNm;
		
		public void setTopFinGrpNo(String topFinGrpNo) {
			this.topFinGrpNo = topFinGrpNo;
			switch (topFinGrpNo) {
			case "020000":
				this.topFinGrpNm="은행";
				break;
			case "030300":
				this.topFinGrpNm="저축은행";
				break;
			default:
				break;
			}
		}
}
