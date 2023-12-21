package kr.or.ddit.finapi.vo;

import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 적금상품 옵션 VO
 * @author moonyt
 *
 */
@Data
@EqualsAndHashCode(of={"finPrdtCd","dclsMonth","finCoNo","saveTrm","rsrvType"})
public class SavingPrdtOptionVO {
	@NotBlank
	@JsonProperty("rsrv_type")
	private String rsrvType;
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
	private Integer intrRate;
	@JsonProperty("intr_rate2")
	private Integer intrRate2;
	@JsonProperty("rsrv_type_nm")
	private String rsrvTypeNm;
	
}
