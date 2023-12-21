package kr.or.ddit.messenger.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.messenger.dao.ChatRoomDAO;
import kr.or.ddit.messenger.vo.ChatRoomVO;
import kr.or.ddit.messenger.vo.ChatUserVO;

@Service
public class ChatRoomServiceImpl implements ChatRoomService {
	@Inject
	private ChatRoomDAO chatRoomDAO;

	@Override
	public ChatRoomVO retrieveChatRoomDetail(String roomNO) {
		return chatRoomDAO.getChatRoomDetail(roomNO);
	}

	@Override
	public List<ChatRoomVO> retrieveChatRoomList(String empCd) {
		
		return chatRoomDAO.selectChatRoomList(empCd);
	}

	@Override
	public boolean inviteChatRoom(ChatRoomVO chatRoom) {
		int cnt = chatRoomDAO.inviteEmpToChatRoom();
		return false;
	}

	@Override
	public boolean createChatRoom(ChatRoomVO chatRoom) {
		int cnt = chatRoomDAO.createChatRoom(chatRoom);
		return cnt > 0;
	}

	@Override
	public String getRoomName(int roomNo) {
		String chatRoomName = chatRoomDAO.getChatRoomName(roomNo);
		
		return chatRoomName;
	}

	@Override
	public boolean outRoom(ChatUserVO chatUser) {
		int cnt = chatRoomDAO.outChatRoom(chatUser);
		return cnt > 0;
	}
}
