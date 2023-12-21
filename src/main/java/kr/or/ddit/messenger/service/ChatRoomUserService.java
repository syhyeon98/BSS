package kr.or.ddit.messenger.service;

import java.util.List;

import kr.or.ddit.messenger.vo.ChatRoomVO;
import kr.or.ddit.messenger.vo.ChatUserVO;

public interface ChatRoomUserService {
	
	/**
	 * 방에 접속해 있는 인원수 반환
	 * @param roomNo
	 * @return
	 */
	public int countEmp(int roomNo);
	
	/**
	 * 채팅방 생성시에 자신이 채팅방에 들어가도록
	 * @param chatRoom
	 * @return
	 */
	public boolean insertOne(ChatRoomVO chatRoom);
	
	/**
	 * 채팅방에 사번을 입력함으로서
	 * @param chatRoom 해당 채팅방 번호에 있는 사원을 구분
	 * @return
	 */
	public boolean insertEmpCds(ChatUserVO ChatUser);
	
	/**
	 * 방에 있는 사람들의 사번을 가져옴 
	 * @param roomNo
	 * @return 사번 반환
	 */
	public List<ChatUserVO> getEmpcds(int roomNo);
	
	/**
	 * 채팅방에 이미 사원이 있는지 확인
	 * @param chatRoom
	 * @return
	 */
	public boolean findEmpCd(ChatUserVO chatUser);
}
