package kr.or.ddit.messenger.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.messenger.dao.ChatRoomUserDAO;
import kr.or.ddit.messenger.vo.ChatRoomVO;
import kr.or.ddit.messenger.vo.ChatUserVO;

@Service
public class ChatRoomUserServiceImpl implements ChatRoomUserService{
	@Inject
	private ChatRoomUserDAO chatRoomUserDAO;

	@Override
	public int countEmp(int roomNo) {
		int cnt = chatRoomUserDAO.empCnt(roomNo);
		
		return cnt;
	}

	@Override
	public boolean insertOne(ChatRoomVO chatRoom) {
		int cnt = chatRoomUserDAO.insertMe(chatRoom);
		return cnt > 0;
	}

	@Override
	public boolean insertEmpCds(ChatUserVO chatUser) {
		int cnt = chatRoomUserDAO.insertEmps(chatUser);
		
		return cnt > 0;
	}

	@Override
	public List<ChatUserVO> getEmpcds(int roomNo) {
		
		return chatRoomUserDAO.getUser(roomNo);
	}
	
	@Override
	public boolean findEmpCd(ChatUserVO chatUser) {
		boolean result = true;
		
		String empCd = chatRoomUserDAO.selectEmpCds(chatUser);
		
		if(empCd == null) {
			result = false;
		}else {
			
		}
		
		return result;
	}
}
