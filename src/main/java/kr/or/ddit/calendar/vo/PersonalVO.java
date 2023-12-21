package kr.or.ddit.calendar.vo;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

/**
 * @author PC-08 회사 일정
 */
@Data
public class PersonalVO {
	@JsonProperty("id")
	private Integer perScNo;
	
	private String empCd;
	@JsonProperty("title")
	private String perTitle;
	private String perWriter;
	@JsonProperty("cont")
	private String perCont;
	
	@JsonProperty("start")
	private String perStart;

	@JsonProperty("end")
	private String perEnd;
	@JsonProperty("allDay")
	private String perAllday;
	
	private String perTarget; 	// 공통여부 체크
	private String perTrip; 	// 출장여부 체크
	private String perEdu; 		// 교육여부 체크
	private String perVaca; 	// 휴가여부 체크
	
	private String perTextcolor;
	private String perBackgroundcolor;
	private String perBordercolor;
	
	private List<PersonalVO> personalList;
	
	private String color; // 색상지정
	
}
