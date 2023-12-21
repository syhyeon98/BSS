package kr.or.ddit.university.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.university.dao.UniversityDAO;
import kr.or.ddit.university.vo.UniversityVO;

@Service
public class UniversityServiceImpl implements UniversityService {

	@Inject
	private UniversityDAO uniDAO;
	
	@Override
	public boolean createUniversity(UniversityVO university) {
		int cnt = 0;
		if(university.getUniName() == "" && university.getCode() == "") {
			return false;
		}
		cnt = uniDAO.insertUniversity(university);
		return cnt > 0;
	}

}
