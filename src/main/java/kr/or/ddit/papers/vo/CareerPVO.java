package kr.or.ddit.papers.vo;

import java.time.LocalDate;

import lombok.Data;

@Data
public class CareerPVO {

	private Integer cpNo;
	private String cpUse;
	private LocalDate cpDate;
	private String code;
}
