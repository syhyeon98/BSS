package kr.or.ddit.vocation.vo;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 직원 연가
 * @author PC-27
 *
 */
@Data
@EqualsAndHashCode(of = "vocationNo")
public class VocationVO {
	
	private int rnum;
	private long currentPage = 1;

	@NotNull
	private Integer vocationNo; // 연가번호

	@NotBlank
	private String vocationCode; // 연가코드

	private List<String> vocationCodes; // 여러개 삭제

	@NotBlank
	private String empCd; // 직원사번

	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate vocationSday; // 연가시작일

	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate vocationEday; // 연가종료일

	private int vocationAll; // 총 연가

	private int vocationUse; // 사용연가

	private String empName; // 직원이름

	private String depName; // 부서명

	private LocalDate enpStart; // 입사일

	private int vocationUseable; // 잔여연가

	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate vocationAddDate; // 신청일
	
//	public boolean getDayCheck() { //연가시작일 지났는지 체크
//		return vocationEday.isBefore(LocalDate.now());
//	}
	
	
}
