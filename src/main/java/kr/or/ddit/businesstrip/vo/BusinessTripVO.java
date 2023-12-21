package kr.or.ddit.businesstrip.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import kr.or.ddit.validate.groups.DeleteGroup;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 
 * 출장 vo
 * 
 */
@Data
@EqualsAndHashCode(of = "tripNo")
public class BusinessTripVO {

	private long rnum;
	
	@NotNull(groups = {UpdateGroup.class, DeleteGroup.class})
	private Integer tripNo;       //출장번호
	@NotBlank(groups = InsertGroup.class)
	private String empCd;     	  //직원번호
	
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate tripDate;   //출장일
	private String tripPurpose;   //출장목적
	private String tripPlace;     //출장장소

	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate tripSdate;  //출장시작일
	
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate tripEdate;  //출장종료일
	
	private String empName;
	
	// 기안문등록을 위한 변수	
	private String poName; //직급
	private String empPh;// 연락처
	private String depName;// 부서명
	private String docNo; // 기안문서 번호
	private String code;  // 결재상태
	private LocalDate date;//기안작성일
	private String docTitle;//기안문제목
}
