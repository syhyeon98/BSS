package kr.or.ddit.messenger.vo;

import java.util.List;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class ChatRoomVO {
	@NotBlank
	private Integer roomNo;
	@NotBlank
	private String roomName;
	private String roomLink;
	private String empCd;

	private String empName;
	private int cntEmp;
	
	
	private List<ChatUserVO> chatUserList;
}
