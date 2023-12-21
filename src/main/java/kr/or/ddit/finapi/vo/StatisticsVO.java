package kr.or.ddit.finapi.vo;

import java.util.List;

import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class StatisticsVO {

	@JsonProperty("lrg_div_nm")
	private String lrgDivNm; // 금융권역명
	@JsonProperty("sml_div_nm")
	private String smlDivNm; // 통계표분류명
	@JsonProperty("list_no")
	private String listNo; // 통계코드
	@JsonProperty("list_nm")
	private String listNm;// 통계명


}
