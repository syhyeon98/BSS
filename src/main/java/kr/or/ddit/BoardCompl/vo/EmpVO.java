package kr.or.ddit.BoardCompl.vo;

import java.util.List;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="empCompl")
public class EmpVO {
	@NotBlank
	private int empCd;
	@NotBlank
	private String empName;
	@NotBlank
	private String depCd;
}
