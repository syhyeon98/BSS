package kr.or.ddit.edApproval.vo;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class SignImgVO {

	@NotBlank
	private String empCd;
	private Integer atchNo;
	
	// 첨부파일 위한
	private MultipartFile[] signImgFiles;
}
