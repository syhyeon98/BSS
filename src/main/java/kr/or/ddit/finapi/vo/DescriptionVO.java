package kr.or.ddit.finapi.vo;

import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class DescriptionVO {
	
	@JsonProperty("column_id")
	@NotBlank
	private String columnId;
	@JsonProperty("finance_cd")
	@NotBlank
	private String financeCd;
	@JsonProperty("base_month")
	@NotBlank
	private String baseMonth;
	@JsonProperty("account_cd")
	@NotBlank
	private String accountCd;
	@JsonProperty("account_nm")
	@NotBlank
	private String accountNm;
	@JsonProperty("column_nm")
	private String columnNm;
	
	
}
