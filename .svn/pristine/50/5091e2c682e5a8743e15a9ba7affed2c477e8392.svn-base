package kr.or.ddit.edDocument.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import kr.or.ddit.validate.groups.InsertGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "dtNo")
public class DocumentTypeVO {
	
	@NotNull(groups = InsertGroup.class)
	private int dtNo;
	@NotBlank(groups = InsertGroup.class)
	private String dtGroup;
	@NotBlank(groups = InsertGroup.class)
	private String dtCont;
	@NotBlank
	private String dtName;
	private String code;
	
}
