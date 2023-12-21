package kr.or.ddit.salary.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author PC-08
 * 수당이력 테이블
 *   - 급여번호, 직원사번, 수당코드, 수당액, 수당일시
 */
@Data
@EqualsAndHashCode(of= {"salNo","empCd","allowCd"})
public class AllowHistoryVO {

	@NotBlank
	private Integer salNo;
	@NotBlank
	private String empCd;
	@NotBlank
	private String allowCd;
	private Integer allowAmt;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate allowYmd;
	
	private AllowVO allowVO;
}
