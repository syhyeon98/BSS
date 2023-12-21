package kr.or.ddit.university.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import kr.or.ddit.state.vo.StateVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "empCd")
public class UniversityVO {
	@NotBlank
	private String empCd;
	private String uniName;
	private String uniMajor;
	private String uniDegree;
	private String code;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate uniStart;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate uniEnd;
	
	private StateVO state;
}
