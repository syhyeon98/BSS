package kr.or.ddit.attendance.vo;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.YearMonth;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.fasterxml.jackson.annotation.JsonFormat;

import kr.or.ddit.department.vo.DepartmentVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.validate.groups.DeleteGroup;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 
 * 출근부 vo
 * 
 */
@Data
@EqualsAndHashCode(of = "atteNo")
public class AttendanceVO {
	
	private long rnum;
	private long currentPage = 1;
	
	@NotNull(groups = {InsertGroup.class, UpdateGroup.class, DeleteGroup.class})
	private Integer atteNo; //출근번호
	
	@NotBlank(groups = {InsertGroup.class, UpdateGroup.class})
	private String empCd;  //직원사번
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd hh:mm")
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime atteStime; //근무시작시간
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd hh:mm")
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime atteEnd;   //근무종료시간
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate atteDate;  //근무일자
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM")
	@DateTimeFormat(iso = ISO.DATE, pattern="yyyy-MM")
	private String atteMonth;  //근무월
	
	private String empName; //직원명
	private String depName; //부서명
	
	private int totalHours;   //총 시간
	private int totalMinutes;//총 분
	
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime overStart; //초과근무 시작
	
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime overEnd;   //초과근무 종료
	
	private String overCont;	     //초과근무 내용
	
}
