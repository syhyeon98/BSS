package kr.or.ddit.messenger.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.messenger.vo.ChatRoomVO;
import kr.or.ddit.messenger.vo.ChatUserVO;

@Mapper
public interface ChatRoomDAO {

	public List<ChatRoomVO> selectChatRoomList(String empCd);

	public int inviteEmpToChatRoom();
	
	public int createChatRoom(ChatRoomVO chatRoom);
	
	public String getChatRoomName(int roomNo);
	
	public int outChatRoom(ChatUserVO chatUser);

	public ChatRoomVO getChatRoomDetail(String chrId);
}
