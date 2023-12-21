package kr.or.ddit.messenger.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.messenger.dao.ChatRecordDAO;
import kr.or.ddit.messenger.vo.ChatRecordVO;

@Service
public class ChatRecordServiceImpl implements ChatRecordService{
	@Inject
	private ChatRecordDAO chatRecordDAO;

	@Override
	public List<ChatRecordVO> getChatRecord(int roomNo) {
		return chatRecordDAO.recieveChatRecord(roomNo);
	}

	@Override
	public String getLastChat(int roomNo) {
		return chatRecordDAO.recieveLastChat(roomNo);
	}
}
