package kr.or.ddit.salary.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author PC-08 공제이력 테이블 - 급여번호, 직원사번, 공제코드, 공제액, 공제일시
 */
@Data
@EqualsAndHashCode(of= {"salNo","empCd","ddcCd"})
public class DdcHistoryVO {

	@NotBlank
	private Integer salNo;
	@NotBlank
	private String empCd;
	@NotBlank
	private String ddcCd;
	private Integer ddcAmt;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate ddcYmd;
	
	private DdcVO ddcVO;

}
