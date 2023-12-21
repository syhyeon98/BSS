package kr.or.ddit.messenger.service;

import java.util.List;

import kr.or.ddit.messenger.vo.ChatRoomVO;
import kr.or.ddit.messenger.vo.ChatUserVO;

public interface ChatRoomService {
	/**
	 * 채팅방 상세 정보를 조회한다
	 * @param chrId
	 * @return
	 */
	public ChatRoomVO retrieveChatRoomDetail(String roomNo);

	/**
	 * 채팅방에 사번을 기준으로 초대
	 * @param chatRoom 
	 * @return 초대 여부를 반환
	 */
	public boolean inviteChatRoom(ChatRoomVO chatRoom);
	
	/**
	 * 채팅방 생성
	 * @param chatRoom
	 * @return
	 */
	public boolean createChatRoom(ChatRoomVO chatRoom);
	
	/**
	 * 채팅방 리스트를
	 * @param empCd 로그인된 사번으로 조회해서
	 * @return List를 반환해준다
	 */
	public List<ChatRoomVO> retrieveChatRoomList(String empCd);
	
	/**
	 * 채팅방 이름 죄회
	 * @param roomNo 를 기준으로
	 * @return
	 */
	public String getRoomName(int roomNo);
	
	/**
	 * 채팅방 나가기
	 * @param chatUser 안에 있는 방에서 나간다
	 * @return
	 */
	public boolean outRoom(ChatUserVO chatUser);
}
