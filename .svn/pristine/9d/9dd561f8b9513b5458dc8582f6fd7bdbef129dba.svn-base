package kr.or.ddit.calendar.vo;

import java.util.List;

import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

/**
 * @author PC-08 회사 일정
 */
@Data
public class CompanyVO {
	@JsonProperty("id")
	private Integer comScNo;
	
	@JsonProperty("title")
	private String comTitle;
	private String comWriter;
	@JsonProperty("cont")
	private String comCont;

	@JsonProperty("start")
	private String comStart;

	@JsonProperty("end")
	private String comEnd;
	@JsonProperty("allDay")
	private String comAllday;
	private String comTextcolor;
	private String comBackgroundcolor;
	private String comBordercolor;
	private String comCn;
	
	private List<CompanyVO> companyList;

}
