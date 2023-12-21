package kr.or.ddit.atch.vo;

import java.time.LocalDate;
import java.util.UUID;

import javax.validation.constraints.NotBlank;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.validate.groups.DeleteGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@EqualsAndHashCode(of = { "atchNo", "outAtchCd" })
public class AtchFileDetailVO {
	private MultipartFile uploadFile;

	public AtchFileDetailVO(MultipartFile uploadFile) {
		super();
		this.uploadFile = uploadFile;
		this.outOriginNm = uploadFile.getOriginalFilename();
		this.outAtchExist = FilenameUtils.getExtension(outOriginNm);
		this.outAtchSize = uploadFile.getSize();
//		this.outFileMime = uploadFile.getContentType();

		this.outAtchNm = UUID.randomUUID().toString();

	}

	@NotBlank
	private int outAtchCd;
	@NotBlank //(groups = {UpdateGroup.class, AuthGroup.class, DeleteGroup.class})
	private int atchNo;
	@NotBlank
	private String outStarCours;
	@NotBlank
	private String outAtchNm;
	private String outOriginNm;
	@NotBlank
	private String outAtchExist;
	private LocalDate outAtchDt;
	private String outAtchAt;
	private long outAtchSize;
	@ToString.Exclude
	private String outAtchCn;
	private Integer outFileNo;
//	private String outFileMime;
}
