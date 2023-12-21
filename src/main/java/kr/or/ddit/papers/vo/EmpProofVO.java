package kr.or.ddit.papers.vo;

import java.time.LocalDate;

import lombok.Data;

@Data
public class EmpProofVO {

	private Integer prNoo;
	private String proUse;
	private LocalDate proDate;
	private String code;
}
