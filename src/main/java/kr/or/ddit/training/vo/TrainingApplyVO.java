package kr.or.ddit.training.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

/**
 *  
 * 교육 신청자 조회
 *  
 */
@Data
public class TrainingApplyVO {
	private long rnum;
	
	@NotBlank
	private Integer trainNo; //교욱번호
	@NotBlank
	private String empCd;	 //직원사번
	@NotBlank
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate taDate; //신청날짜
	private String code; 	  //교육취소여부
	
	private String empName; //직원이름
	private String depName; //부서이름
	private String trainName; //교육이름
	private String trainDate; //교육일
	private String lectorName; //강사명
	private String trainPlace; //교육장소
	private Integer trainTime; //교육소요시간
	
	private String formatTrainDate;// 포맷
	
	public void setTrainDate(String trainDate) {
		this.trainDate = trainDate;
		this.formatTrainDate = formatTrainDate(trainDate);
	}
	
	private String formatTrainDate(String before) {
		String after = before.substring(0, before.indexOf(" "));
		return after;
	}
	
}
