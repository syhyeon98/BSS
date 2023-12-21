package kr.or.ddit.messenger.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.messenger.vo.ChatRoomVO;
import kr.or.ddit.messenger.vo.ChatUserVO;

@Mapper
public interface ChatRoomUserDAO {
	
	public int empCnt(int roomNo);
	
	public int insertMe(ChatRoomVO chatRoom); 
	
	public int insertEmps(ChatUserVO chatUser);
	
	public List<ChatUserVO> getUser(int roomNO);
	
	public String selectEmpCds(ChatUserVO chatRoom);
}
