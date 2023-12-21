package kr.or.ddit.messenger.service;

import java.util.List;

import kr.or.ddit.messenger.vo.ChatRecordVO;

public interface ChatRecordService{

	/**
	 * 채팅방에 저장된 기록을 가져오는데
	 * @param roomNo 방번호를 기준으로
	 * @return
	 */
	public List<ChatRecordVO> getChatRecord(int roomNo);
	
	/**
	 * 채팅방에 저장된 마지막 기록을 가져온다
	 * @param roomNo 방번호를 기준으로
	 * @return
	 */
	public String getLastChat(int roomNo);
}
