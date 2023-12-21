package kr.or.ddit.position.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.position.dao.PositionDAO;
import kr.or.ddit.position.vo.PositionVO;

@Service
public class PositionServiceImpl implements PositionService {

	@Inject
	PositionDAO poDAO;
	
	@Override
	public boolean createPosition(PositionVO position) {
		int cnt = 0;
		
		if(position.getPoCd() == "") {
			return false;
		}
		cnt = poDAO.insertPosition(position);
		
		return cnt > 0;
	}

}
