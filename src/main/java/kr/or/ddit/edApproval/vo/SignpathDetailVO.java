package kr.or.ddit.edApproval.vo;

import java.util.List;

import javax.validation.constraints.NotBlank;

import lombok.Data;


/**
 * @author PC-08
 *
 */
@Data
public class SignpathDetailVO {
	
	@NotBlank
	private String empCd; // 결재자
	@NotBlank
	private Integer signpathNo;
	@NotBlank
	private String empCd2; // 소유자
	@NotBlank
	private Integer sdTurn;
	private String codeMethod;
	
	// 추가

	private String signpathNm; // 결재선명
	
	// json배열을 받기위한
	private List<String> selectEmpCodes; // 결재자 사번
	private List<String> selectMethodsCodes; // 결재자의 결재방법 
	private List<Integer> selectSn; // 결재순번
	
	private String empName; // 결재자명
	private String poName; // 결재자의 직급
	
	private String depName; // 결재자 부서명
	private String depCd;   // 결재자 부서코드
	
	private String codeMethodName;
	public void setCodeMethod(String codeMethod) {
		this.codeMethod = codeMethod;
		switch (codeMethod) {
		case "SD_01":
			this.codeMethodName="결재"; 
			break;
		case "SD_02":
			this.codeMethodName="협조"; 
			break;
		case "SD_03":
			this.codeMethodName="참조"; 
			break;
		case "SD_04":
			this.codeMethodName="전결"; 
			break;
		case "SD_05":
			this.codeMethodName="대결"; 
			break;
		default:
			break;
		}
	}
	
}
