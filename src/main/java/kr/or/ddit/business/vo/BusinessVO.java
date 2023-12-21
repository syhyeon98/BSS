package kr.or.ddit.business.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class BusinessVO {
	@NotBlank
	private String busCd;
	@NotBlank
	private String busName;
	
}
