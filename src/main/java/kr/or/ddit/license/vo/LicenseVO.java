package kr.or.ddit.license.vo;

import java.time.LocalDate;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = {"licenseCd", "empCd"})
public class LicenseVO {
	@NotNull
	private Integer licenseCd;
	@NotBlank
	private String empCd;
	private String licenseNm;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate licenseDate;
	private String licenseAgency;
	
	private List<LicenseVO> licenseList;
}
