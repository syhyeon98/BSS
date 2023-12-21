package kr.or.ddit.edApproval.vo;

import java.util.List;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "signpathNo")
public class SignpathVO {

	@NotBlank
	private Integer signpathNo;
	@NotBlank
	private String empCd;
	@NotBlank
	private String signpathNm;
	
	private int rnum;
	
}
