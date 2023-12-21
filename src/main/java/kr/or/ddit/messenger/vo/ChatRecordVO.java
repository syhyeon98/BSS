package kr.or.ddit.messenger.vo;

import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;

@Data
public class ChatRecordVO {
	@NotBlank
	private String recodeNo;
	@NotBlank
	private String messengerContent;
	@NotBlank
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDateTime messengerTime;
	@NotBlank
	private Integer roomNo;
	@NotBlank
	private String empCd;
	
	private String empName;
	private String lastChat;
}
