package kr.or.ddit.BoardCompl.vo;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import kr.or.ddit.validate.groups.DeleteGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="complNo")
public class ComplboardVO implements Serializable{
	@NotBlank(groups = {UpdateGroup.class, DeleteGroup.class})
	private Integer complNo;
	@NotBlank
	private String empCd;
	private String empPw;
	@NotBlank
	private String complEmpCd;
	@NotBlank
	private String complTtl;
	@NotBlank
	private String complCn;
	
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate complDt;
	private String empName;
	private String complEmpName;
	
	private String depName;
	private String depCd;
	
	private DepVO dep;
	private EmpVO emp;
	
	private Integer rnum;
	
	private List<ComplboardVO> complList;
}