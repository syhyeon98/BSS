package kr.or.ddit.finapi.vo;

import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of= {"saveTrm","finPrdtCd","dclsMonth","finCoNo","intrRateType"})
public class DepositOptionVO {
	@JsonProperty("save_trm")
	@NotBlank
	private Integer saveTrm;
	@JsonProperty("fin_prdt_cd")
	@NotBlank
	private String finPrdtCd;
	@JsonProperty("dcls_month")
	@NotBlank
	private String dclsMonth;
	@JsonProperty("fin_co_no")
	@NotBlank
	private String finCoNo;
	@JsonProperty("intr_rate_type")
	private String intrRateType;
	@JsonProperty("intr_rate_type_nm")
	private String intrRateTypeNm;
	@JsonProperty("intr_rate")
	private Double intrRate;
	@JsonProperty("intr_rate2")
	private Double intrRate2;
}
