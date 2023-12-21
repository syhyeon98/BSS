package kr.or.ddit.attendance.vo;

import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;
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
 * 초과근무 vo
 * 
 * 
 */
@Data
@EqualsAndHashCode(of = "atteNo")
public class OverTimeVO {

	private long rnum;

	@NotNull(groups = {InsertGroup.class, UpdateGroup.class, DeleteGroup.class})
	private Integer atteNo; //출근번호
	
	@DateTimeFormat(iso=ISO.DATE_TIME)
	@NotNull(groups = InsertGroup.class)
	private LocalDateTime overStart; //초과근무시작시간
	
	@DateTimeFormat(iso=ISO.DATE_TIME)
	@NotNull(groups = InsertGroup.class)
	private LocalDateTime overEnd; //초과근무종료시간
	
	private String overCont; //초과근무내용

	private int time; //총근무시간(시간)
	private int minute;  //총근무시간(분)
	
	private int totalHours; //분 합
	private int totalMinutes;   //시간 합
	
	private String empName;
	private String empCd;
	
	private String formattedOverStart; // 포맷팅
	private String formattedOverEnd; // 포맷팅
	
	public void setOverStart(LocalDateTime overStart) {
		this.overStart = overStart;
		this.formattedOverStart =  localDateTimeToString(overStart);
	}
	
	public void setOverEnd(LocalDateTime overEnd) {
		this.overEnd = overEnd;
		this.formattedOverEnd =  localDateTimeToString(overEnd);
	}
	
	private String localDateTimeToString(LocalDateTime before) {
		String after = before.toString().replace("T", " ");
		return  after;
	}
	
	
}
