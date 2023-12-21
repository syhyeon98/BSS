package kr.or.ddit.salary.vo;

import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;

import kr.or.ddit.validate.groups.DeleteGroup;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author PC-08
 * 공제테이블
 * - 공제테이블 공제기준, 공제명
 */
@Data
@EqualsAndHashCode(of="ddcCd")
public class DdcVO {
	
	@NotBlank(groups=DeleteGroup.class)
	private String ddcCd;
	
	@NotBlank(groups= {UpdateGroup.class})
	private String ddcCrtr;
	
	@NotBlank(groups= {UpdateGroup.class})
	private String ddcNm;
	
	@NotEmpty(groups= {InsertGroup.class})
	private List<DdcVO> ddcList;
	
}
