package kr.or.ddit.finapi.vo;

import java.util.List;

import lombok.Data;

@Data
public class ParamDataVO {

	private String term;
	private String startBaseMm;
	private String endBaseMm;
	private String listNo;
	private List<String> bankCd;
	private List<String> accountCd; 
	private List<String> accountNm;
}
