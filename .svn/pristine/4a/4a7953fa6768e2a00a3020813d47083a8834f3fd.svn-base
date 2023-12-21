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
 * @author PC-08 수당 테이블 - 수당코드, 수당기준, 수당명
 */

@Data
@EqualsAndHashCode(of = "allowCd")
public class AllowVO {

	@NotBlank(groups = DeleteGroup.class)
	private String allowCd;
	@NotBlank(groups = { UpdateGroup.class })
	private String allowNm;

	private String allowCrtr;
	private String allowCalc;
	@NotEmpty(groups = { InsertGroup.class })
	private List<AllowVO> allowList;
	
	private String allowUse;
	
	
}
