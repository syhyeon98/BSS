package kr.or.ddit.appointments.vo;

import java.time.LocalDate;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = {"appNo", "empCd"})
public class AppointmentsVO {
	private Integer appNo;
	@NotBlank
	private String empCd;
	@NotBlank
	private String appEmp;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate appDate;
	@NotBlank
	private String nowDep;
	@NotBlank
	private String newDep;
	@NotBlank
	private String newPo;
	@NotBlank
	private String appCont;
	
	private List<AppointmentsVO> appInsertList;
	
}
