package kr.or.ddit.edApproval.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class SignpathEmpVO {

	@NotBlank
	private Integer signpathNo;
	@NotBlank
	private String empCd;
	@NotBlank
	private String docNo;
	private LocalDate seDate;
	private Integer sdTurn;
	private String codeMethod; // 결재방법코드
	private String seReject;
	private String codeStatus; // 결재상태코드
	private String docRead; // 읽음확인
	
	// 추가
	private String empName;// 결재자명
	private String poCd; // 결재자 직급코드
	private String poName; // 결재자 직급명
	private String depCd; // 결재자 부서코드
	private String depName; // 결재자 부서명
	private Integer currentTurn;// 현재 결재 순서
	private Integer maxTurn; // 결재선의 최대 순번
	
	// 결재방법포맷
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
	
	private String codeStatusName;
	public void setCodeStatus(String codeStatus) {
		this.codeStatus = codeStatus;
		switch (codeStatus) {
		case "SE_01":
			this.codeStatusName="결재대기";
			break;
		case "SE_02":
			this.codeStatusName="결재승인";
			break;
		case "SE_03":
			this.codeStatusName="반려";
			break;
		default:
			break;
		}
	}
	
	private int signImg;//결재도장을 위한 파일번호
}
