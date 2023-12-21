package kr.or.ddit.finapi.vo;

import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false, of = { "finPrdtCd", "dclsMonth", "finCoNo" })
public class CreditLoanVO extends BankVO{
	@JsonProperty("fin_prdt_cd")
	@NotBlank
	private String finPrdtCd;
	@JsonProperty("dcls_month")
	@NotBlank
	private String dclsMonth;
	@JsonProperty("crdt_prdt_type")
	@NotBlank
	private String crdtPrdtType;
	@JsonProperty("fin_co_no")
	@NotBlank
	private String finCoNo;
	@JsonProperty("fin_prdt_nm")
	private String finPrdtNm;
	@JsonProperty("crdt_prdt_type_nm")
	private String crdtPrdtTypeNm;
	@JsonProperty("join_way")
	private String joinWay;
	@JsonProperty("dcls_strt_day")
	private String dclsStrtDay;
	@JsonProperty("dcls_end_day")
	private String dclsEndDay;
	@JsonProperty("fin_co_subm_day")
	private String finCoSubmDay;
	@JsonProperty("top_fin_grp_no")
	private String topFinGrpNo;
	@JsonProperty("cb_name")
	private String cbName;
	
	
	
	// 옵션
	private String crdtLendRateType;
	private String crdtLendRateTypeNm;
	private double crdtGrad1; // 900점 초과
	private double crdtGrad4; // 801~900
	private double crdtGrad5; // 701 800
	private double crdtGrad6; // 601~700
	private double crdtGrad10; // 501~600
	private double crdtGrad11; // 401~500
	private double crdtGrad12; // 301~400
	private double crdtGrad13; // 300이하
	private double crdtGradAvg;
	
	// 은행정보
	private String korCoNm;
	private String dclsChrgMan;
	private String hompUrl;
	private String calTel;
	
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
	
}
