package kr.or.ddit.mail.vo;

import java.time.LocalDate;

import javax.mail.Multipart;
import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import lombok.Data;
import lombok.ToString;

@Data
public class MailBoxVO {
	
	private long rnum;

	@NotBlank
	private Integer receiveMailNo;
	@NotBlank
	private String empCd;
	@NotBlank
	private String receiveMailSender;
	@NotBlank
	private String receiveMailReceiver;
	private String receiveMailContent;
	// private Multipart receive11;
	@NotBlank
	private String receiveMailTitle;
	@NotBlank
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate receiveMailDate;
	@NotBlank
	private String mailImpo;
	@NotBlank
	private Integer mailDelete;
	@NotBlank
	private Integer mailDeleteOther;
	@NotBlank
	private Integer mailTemp;
	@NotBlank
	private String mailImpoOther;

	private String loginEmpCd; // 로그인 한 직원의 코드
	private String loginEmpMail; // 로그인 한 직원의 메일
	
	private Integer atchNo;
	private String atchType;
	private LocalDate atchDt;
	private boolean atchAt;
	private MultipartFile[] mailFiles;
	private AtchFileVO fileGroup;
	
	private int outAtchCd;
	private String outStarCours;
	private String outAtchNm;
	private String outOriginNm;
	private String outAtchExist;
	private LocalDate outAtchDt;
	private String outAtchAt;
	private long outAtchSize;
	private String outAtchCn;
	private Integer outFileNo;
//	private String outFileMime;
	
}
