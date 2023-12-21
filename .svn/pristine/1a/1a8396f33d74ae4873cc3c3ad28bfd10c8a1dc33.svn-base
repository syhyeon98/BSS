package kr.or.ddit.messenger.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.messenger.dao.ChatReadDAO;
import kr.or.ddit.messenger.vo.ChatReadVO;

@Service
public class ChatReadServiceImpl implements ChatReadService{
	@Inject
	private ChatReadDAO chatReadDAO;

	@Override
	public String getNotReadNo(ChatReadVO chatRead) {
		return chatReadDAO.getNoRead(chatRead);
	}

	@Override
	public boolean changeRead(ChatReadVO chatRead) {
		int cnt = chatReadDAO.changeSelectRead(chatRead);
		
		return cnt > 0;
	}
}
