package kr.or.ddit.finapi.vo;

import java.util.List;

import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "finCoNo")
public class BankVO {
	
	@JsonProperty("fin_co_no")
	@NotBlank
	private String finCoNo;
	@JsonProperty("kor_co_nm")
	private String korCoNm;
	@JsonProperty("dcls_month")
	private String dclsMonth;
	@JsonProperty("dcls_chrg_man")
	private String dclsChrgMan;
	@JsonProperty("homp_url")
	private String hompUrl;
	@JsonProperty("cal_tel")
	private String calTel;
	
}
