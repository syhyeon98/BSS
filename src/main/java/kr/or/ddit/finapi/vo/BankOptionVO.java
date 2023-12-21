package kr.or.ddit.finapi.vo;

import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false, of = {"finCoNo","areaCd"})
public class BankOptionVO extends BankVO{
	@JsonProperty("area_cd")
	@NotBlank
	private String areaCd;
	@JsonProperty("fin_co_no")
	@NotBlank
	private String finCoNo;
	@JsonProperty("area_nm")
	private String areaNm;
	@JsonProperty("exis_yn")
	private String exisYn;
}
