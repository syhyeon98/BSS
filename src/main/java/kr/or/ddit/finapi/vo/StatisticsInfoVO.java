package kr.or.ddit.finapi.vo;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of= {"baseMonth","financeCd"})
public class StatisticsInfoVO {
	
	@JsonProperty("base_month")
	private String baseMonth;
	@JsonProperty("finance_cd")
	private String financeCd;
	@JsonProperty("finance_nm")
	private String financeNm;
	@JsonProperty("account_cd")
	private String accountCd;
	@JsonProperty("account_nm")
	private String accountNm;
	@JsonProperty("a")
	private double a;
	@JsonProperty("b")
	private double b;
	@JsonProperty("c")
	private double c;
	@JsonProperty("d")
	private double d;
	@JsonProperty("e")
	private double e;
	
	private String formatBaseMonth;
	
	public void setBaseMonth(String baseMonth) {
		this.baseMonth = baseMonth;
		this.formatBaseMonth = baseMonth.replaceFirst("(\\d{4})(\\d{2})", "$1년 $2월말");
	}
	
	private List<DescriptionVO> descriptionList;
	
}
