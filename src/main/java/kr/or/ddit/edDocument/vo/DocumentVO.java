package kr.or.ddit.edDocument.vo;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.edApproval.vo.SignpathDetailVO;
import kr.or.ddit.validate.groups.InsertGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "docNo")
public class DocumentVO {

	private long rnum;
	
//	@NotBlank
	private String docNo;
	@NotBlank(groups = InsertGroup.class)
	private String empCd;
	@NotNull(groups = InsertGroup.class)
	private int signpathNo;
	@NotNull(groups = InsertGroup.class)
	private int dtNo;
	@NotBlank(groups = InsertGroup.class)
	private String docTitle;
	@NotBlank(groups = InsertGroup.class)
	private String docContent;
	@NotBlank(groups = InsertGroup.class)
	private String docType;
//	@NotBlank
//	private LocalDate docUpdatedate;
//	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd hh:mm")
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private LocalDateTime docUpdatedate;
	private long docSign;
	private String code;
	
	// 임시저장한거 삭제할때 필요
	private List<String> docArrayNo;
	// 수신처
	private List<String> depCdList;
	
	// 첨부파일 위한
	private MultipartFile[] documentFiles;
	private int atchNo; // 첨부파일 번호
	private AtchFileVO fileGroup;
	// 추가 결재자
	private String approvalEmpCd; // 결재자사번 (별칭 사용을 위한)
	private String approvalEmpName; // 결재자 (별칭 사용을 위한)
	private String approvalDepCd; // 결재자 부서코드 (별칭 사용을 위한)
	private String approvalDepName; // 결재자 부서 (별칭 사용을 위한)
	private String approvalPoCd; // 결재자 직급 코드 (별칭 사용을 위한)
	private String approvalPoName; // 결재자 직급명 (별칭 사용을 위한)
	
	// 기안자
	private String empName; // 기안자 (별칭으로도 사용)
	private String depCd; // 기안자 부서코드
	private String depName; // 기안 부서
	private String poCd; // 기안자 직급코드
	private String poName; // 기안자 직급명
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm") 
	private LocalDateTime hdDate; // 참조일시
	private int sdTurn; // 결재순번
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm") 
	private LocalDateTime seDate; // 승인완료일
	private String seCode; // 결재상태
	private String seReject; // 반려의견
	private String dtName; // 문서양식명

	// 결재등록시 사용하기 위한 결재자 또는 참조자
	private List<SignpathDetailVO> signPathDetailList;
	
	// 포맷팅된 일자
	private LocalDate formatDocUpdate;
	private LocalDate formatHdDate;
	private LocalDate formatSeDate;
	
	// 읽었는지확인(Y/N)
	private String docRead; 
	
	
	public void setDocUpdatedate(LocalDateTime docUpdatedate) {
		this.docUpdatedate = docUpdatedate;
		this.formatDocUpdate = dateFormat(docUpdatedate);
	}
	
	public void setHdDate(LocalDateTime hdDate) {
		this.hdDate = hdDate;
		this.formatHdDate = dateFormat(hdDate);
	}
	
	public void setSeDate(LocalDateTime seDate) {
		this.seDate = seDate;
		this.formatSeDate = dateFormat(seDate);
	}
	
	// 포맷팅
	private LocalDate dateFormat(LocalDateTime beforeDate) {
		LocalDate afterDate = beforeDate.toLocalDate();
		return afterDate;
	}
	
	
	// 상태코드->상태명
	private String codeKoName;
	
	public void setCode(String code) {
		this.code = code;
		switch (code) {
		case "D_01":
			this.codeKoName="진행";
			break;
		case "D_02":
			this.codeKoName="승인";
			break;
		case "D_03":
			this.codeKoName="임시";
			break;
		case "D_04":
			this.codeKoName="반려";
			break;

		default:
			break;
		}
	}
	
	
}
