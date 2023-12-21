package kr.or.ddit.edApproval.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = {"empCd", "empCd2"})
public class ApprovalVO {

	@NotBlank
	private String empCd;
	@NotBlank
	private String empCd2;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate appStart;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate appEnd;
	
}
