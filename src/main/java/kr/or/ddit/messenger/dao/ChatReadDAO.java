package kr.or.ddit.messenger.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.messenger.vo.ChatReadVO;

@Mapper
public interface ChatReadDAO {

	public void insertRead(ChatReadVO chatRead);
	
	public String getNoRead(ChatReadVO chatRead);
	
	public int changeSelectRead(ChatReadVO chatRead);
}
