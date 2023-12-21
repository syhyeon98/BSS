package kr.or.ddit.mail.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.employee.vo.EmployeeVO;
import lombok.Data;

@Data
public class MailDetailVO {
	@NotBlank
	private String empCd;
	@NotBlank
	private String mailToken;
	private LocalDate tokenEnd;
	private String tokenRefresh;
	private String tokenWay;
}