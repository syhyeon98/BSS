package kr.or.ddit.salary.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

/**
 * @author PC-08 급여 테이블의 VO - 급여번호, 직원사번, 확정
 * 
 */
@Data
public class SalaryVO {

	@NotBlank
	private Integer salNo;
	@NotBlank
	private String empCd;
	@NotBlank
	private String salCalcYn;

	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate salCalcYmd;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate salCalcStart;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate salCalcEnd;

	private String yearMonth;
	
	private LocalDate giveYmd;

	public void setSalNo(Integer salNo) {
		this.salNo = salNo;
		String stringValue = String.valueOf(salNo - 1);
		String year = stringValue.substring(0, 4);
		String month = stringValue.substring(4, 6);
		this.yearMonth = year + "-" + month + "-";
	}

}
