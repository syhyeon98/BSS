package kr.or.ddit.BoardCompl.vo;

import java.util.List;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.validate.groups.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="depCompl")
public class DepVO {
	@NotBlank
	private String depName;
	
	@NotBlank
	private String depCd;
//	private List<ComplboardVO> complList; // has many (1:N)
}






















