package kr.or.ddit.messenger.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.messenger.vo.ChatRecordVO;

@Mapper
public interface ChatRecordDAO {
	public int insertMsg(ChatRecordVO chatRecord);
	
	public List<ChatRecordVO> recieveChatRecord(int roomNo);
	
	public String recieveLastChat(int roomNo);
}
