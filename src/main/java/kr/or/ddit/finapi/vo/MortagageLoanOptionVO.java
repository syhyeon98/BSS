package kr.or.ddit.finapi.vo;

import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of= {"mrtgType","rpayType","lendRateType","finPrdtCd","dclsMonth","finCoNo"})
public class MortagageLoanOptionVO {

	@JsonProperty("mrtg_type")
	@NotBlank
	private String mrtgType;
	@JsonProperty("rpay_type")
	@NotBlank
	private String rpayType;
	@JsonProperty("lend_rate_type")
	@NotBlank
	private String lendRateType;
	@JsonProperty("fin_prdt_cd")
	@NotBlank
	private String finPrdtCd;
	@JsonProperty("dcls_month")
	@NotBlank
	private String dclsMonth;
	@JsonProperty("fin_co_no")
	@NotBlank
	private String finCoNo;
	@JsonProperty("mrtg_type_nm")
	private String mrtgTypeNm;
	@JsonProperty("rpay_type_nm")
	private String rpayTypeNm;
	@JsonProperty("lend_rate_type_nm")
	private String lendRateTypeNm;
	@JsonProperty("lend_rate_min")
	private double lendRateMin;
	@JsonProperty("lend_rate_max")
	private double lendRateMax;
	@JsonProperty("lend_rate_avg")
	private double lendRateAvg;

}
