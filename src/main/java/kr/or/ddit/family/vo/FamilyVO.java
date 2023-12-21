package kr.or.ddit.family.vo;

import java.util.List;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.state.vo.StateVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "famNo")
public class FamilyVO {
	@NotBlank
	private String empCd;
	@NotBlank
	private String famNo;
	private String famName;
	private String famJob;
	private String famBir;
	private String famEdu;
	private String famNote;
	private String famClassify;
	private String code;
	private String stateNm;

	private StateVO state;

	private List<FamilyVO> famList;// 가족
}
