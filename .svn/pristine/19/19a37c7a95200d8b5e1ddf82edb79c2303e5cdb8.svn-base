package kr.or.ddit.BoardNtc.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="ntcNo")
public class NtcboardVO {

	@NotNull
	private int ntcNo;
	@NotBlank(groups = InsertGroup.class)
	private String empCd;
	@NotBlank(groups = {InsertGroup.class, UpdateGroup.class})
	private String ntcTtl;
	@NotBlank(groups = {InsertGroup.class, UpdateGroup.class})
	private String ntcCn;
	
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate ntcDt;
	private String empName;
	private String empPw;
	private String depName;
	
	private Integer rnum;
	
	
	private MultipartFile[] boFiles;
	
	private int atchNo;
	private Integer outAtchCd;
	
	private AtchFileVO fileGroup; // has a
}
