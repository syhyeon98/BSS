package kr.or.ddit.state.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class StateVO {
	@NotBlank
	private String code;
	@NotBlank
	private String stateNm;
}
