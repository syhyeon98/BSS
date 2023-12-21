package kr.or.ddit.department.vo;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.fasterxml.jackson.annotation.JsonFormat;

import kr.or.ddit.validate.groups.InsertGroup;
import lombok.Data;

@Data
public class DepDocumentVO {
	
	private long rnum;
	
	// 수신부서
	@NotBlank
	private String docNo;
	@NotBlank
	private String depCd;
	private Integer depDocumentViews;
	
	// 결재문서를 위한 변수
	private String empCd; // 기안자
	private int signpathNo;
	private int dtNo;
	private String docTitle;
	private String docContent;
	private String docType;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd hh:mm")
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime docUpdatedate;
	private long docSign;
	private String code;
	
	// 기안자 기본
	private String depCd2;// 기안자의 부서코드
	private String poCd;  // 기안자의 직급코드
	private String empName; // 기안자 이름
	private String depName; // 기안자의 부서명
	private String poName;  // 기안자의 직급명
	
	// 포맷팅된 일자
	private LocalDate formatDocUpdate;
	
	public void setDocUpdatedate(LocalDateTime docUpdatedate) {
		this.docUpdatedate = docUpdatedate;
		this.formatDocUpdate = dateFormat(docUpdatedate);
	}
	// 포맷팅
	private LocalDate dateFormat(LocalDateTime beforeDate) {
		LocalDate afterDate = beforeDate.toLocalDate();
		return afterDate;
	}
	
	
}
