package kr.or.ddit.family.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.family.dao.FamilyDAO;
import kr.or.ddit.family.vo.FamilyVO;

@Service
public class FamilyServiceImpl implements FamilyService {

	@Inject
	private FamilyDAO famDAO;
	
	@Override
	public boolean createFamily(List<FamilyVO> familyList) {
		int cnt = 0;
		for(FamilyVO family : familyList) {
			if(family.getFamNo() == "" && family.getFamName() == "" 
					&& family.getFamClassify() == "") {
				return false;
			}
			cnt += famDAO.insertFamily(family);
		}
		return cnt > 0;
	}

	@Override
	public List<FamilyVO> famList(String emp) {
		return famDAO.selectFamily(emp);
	}

	@Override
	public boolean modifyFamily(FamilyVO family) {
		return famDAO.updateFamily(family) > 0;
	}

	@Override
	public FamilyVO retrieveFam(String famNo) {
		return famDAO.selectFam(famNo);
	}

	@Override
	public boolean upCreateFamily(List<FamilyVO> familyList) {
		int cnt = 0;
		for(FamilyVO family : familyList) {
			if(family.getFamNo() == "" && family.getFamName() == "" 
					&& family.getFamClassify() == "") {
				return false;
			}
			cnt += famDAO.upInsertFamily(family);
		}
		return cnt > 0;
	}

}
