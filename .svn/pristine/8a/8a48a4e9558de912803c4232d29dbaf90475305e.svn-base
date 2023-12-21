package kr.or.ddit.BoardReqcmnt.vo;

import java.time.LocalDate;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import kr.or.ddit.BoardReq.vo.ReqboardVO;
import lombok.Data;

@Data
public class CmntVO {
	
	private ReqboardVO reqBoard;
	private Integer rcnmtNo;
	private String empPw;
	@NotBlank
	private Integer reqNo;
	
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate rcnmtDt;
	@NotBlank
	private String rcmntCn;
	
	private List<CmntVO> cmntList;
}
