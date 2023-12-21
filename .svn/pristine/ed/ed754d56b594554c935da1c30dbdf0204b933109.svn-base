package kr.or.ddit.BoardReq.vo;

import java.time.LocalDate;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import kr.or.ddit.BoardReqcmnt.vo.CmntVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="reqNo")
public class ReqboardVO {
	
	@NotBlank
	private Integer reqNo;
	@NotBlank
	private String empCd;
	private String empPw;
	@NotBlank
	private String reqTtl;
	@NotBlank
	private String reqCn;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate reqDt;
	@NotBlank
	private Integer reqPw;
	private String empName;
	private String depName; 
	private Integer rnum;
	private String reqCheck;
	private Integer rcnmtNo;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate rcnmtDt;
	
	private String rcmntCn;

	private CmntVO cmnt;
	
	private List<ReqboardVO> reqList;
}