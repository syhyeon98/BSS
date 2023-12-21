package kr.or.ddit.finapi.vo;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "financeCd")
public class ManageBankVO {

	@JsonProperty("finance_cd")
	private String financeCd; //회사코드
	@JsonProperty("finance_nm")
	private String financeNm; //회사명
	@JsonProperty("finance_path")
	private String financePath; // tree구조
	
	private List<StatisticsInfoVO> statisticsInfo; // 통계결과
	
	// statisticInfo
//	private String baseMonth;
//	private String accountCd;
//	private String accountNm;
//	private String a;
//	private String b;
//	private String c;
//	private String d;
//	private String e;
//	
//	private String formatBaseMonth;
//	
//	public void setBaseMonth(String baseMonth) {
//		this.baseMonth = baseMonth;
//		this.formatBaseMonth = baseMonth.replaceFirst("(\\d{4})(\\d{2})", "$1년 $2월말");
//	}
//	
//	//descriptionVO
//	private String columnId;
//	private String columnNm;
}
