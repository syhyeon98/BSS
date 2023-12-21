package kr.or.ddit.training.vo;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.fasterxml.jackson.annotation.JsonFormat;

import kr.or.ddit.validate.groups.DeleteGroup;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 
 * 직원교육 vo
 * 
 */
@Data
@EqualsAndHashCode(of = "trainNo")
public class TrainingVO {
	
	private long currentPage = 1;
	
	private long rnum;
	
	private String code; //교육신청여부 코드
	
	@NotNull(groups = {DeleteGroup.class, UpdateGroup.class})
	private Integer trainNo; //교육번호
	
	@NotBlank
	private String lectorId; //강사ID
	
	@NotBlank(groups = InsertGroup.class)
	private String trainPlace; //교육장소
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd hh:mm")
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime trainDate; //교육일시
	
	@NotNull(groups = InsertGroup.class)
	private Integer trainTime; //교육소요시간
	
	@NotBlank(groups = InsertGroup.class)
	private String trainTarget; //교육대상
	
	@NotBlank(groups = InsertGroup.class)
	private String trainName; //교육이름
	
	@NotBlank(groups = InsertGroup.class)
	private String trainContent; //교육내용
	
	@NotNull(groups = InsertGroup.class)
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate trainPeriod; //신청마감일
	
	@NotBlank(groups = InsertGroup.class)
	private String trainSign; //신청방법
	
	private String lectorName; //강사명
	
	private int capacity; //정원
	
	private int applyCount; //신청인원 가상컬럼
	
	public boolean getTimeCheck() { //마감기한 지났는지 체크
		return trainPeriod.isBefore(LocalDate.now()); 
	}
	
	private String empCd; //사원번호
	private String appCheck; //수강여부(신청마감일 지나면 수강으로)
	
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate taDate; //신청날짜
	
}
