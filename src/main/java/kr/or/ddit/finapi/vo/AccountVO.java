package kr.or.ddit.finapi.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class AccountVO {

	@JsonProperty("list_no")
	private String listNo; // 통계코드
	@JsonProperty("list_nm")
	private String listNm; // 통계명
	@JsonProperty("account_cd")
	private String accountCd; // 계정항목코드
	@JsonProperty("account_nm") 
	private String accountNm; // 계정항목명
	
}