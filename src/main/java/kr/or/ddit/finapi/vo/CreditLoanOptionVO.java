package kr.or.ddit.finapi.vo;

import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = { "finPrdtCd", "dclsMonth", "finCoNo","crdtPrdtType" })
public class CreditLoanOptionVO {
	@JsonProperty("crdt_lend_rate_type")
	@NotBlank
	private String crdtLendRateType;
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
	@JsonProperty("crdt_lend_rate_type_nm")
	private String crdtLendRateTypeNm;
	@JsonProperty("crdt_grad_1") 
	private double crdtGrad1; // 900점 초과
	@JsonProperty("crdt_grad_4")
	private double crdtGrad4; // 801~900
	@JsonProperty("crdt_grad_5")
	private double crdtGrad5; // 701 800
	@JsonProperty("crdt_grad_6")
	private double crdtGrad6; // 601~700
	@JsonProperty("crdt_grad_10")
	private double crdtGrad10; // 501~600
	@JsonProperty("crdt_grad_11")
	private double crdtGrad11; // 401~500
	@JsonProperty("crdt_grad_12")
	private double crdtGrad12; // 301~400
	@JsonProperty("crdt_grad_13")
	private double crdtGrad13; // 300이하
	@JsonProperty("crdt_grad_avg")
	private double crdtGradAvg;
}
