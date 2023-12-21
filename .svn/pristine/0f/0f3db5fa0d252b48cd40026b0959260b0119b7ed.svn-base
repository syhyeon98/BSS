package kr.or.ddit.salary.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.salary.dao.AllowDAO;
import kr.or.ddit.salary.vo.AllowVO;

@Service
public class AllowServiceImpl implements AllowService {

	@Inject
	private AllowDAO allowDao;

	@Override
	public List<AllowVO> retrieveAllowList() {
		return allowDao.selectAllowList();
	}

	@Override
	public AllowVO retrieveAllow(String allowCd) {
		return allowDao.selectAllow(allowCd);
	}

	@Override
	public boolean modifyAllow(AllowVO allow) {
		return 0<allowDao.updateAllow(allow);
	}

	@Override
	public boolean createAllow(List<AllowVO> allowList) {
		int cnt = 0;
		for (AllowVO allow : allowList) {
			if (allow.getAllowCd() == "" || allow.getAllowNm() == "") {
				return false;
			}
			cnt += allowDao.insertAllow(allow);
		}
		return 0 < cnt;
	}

	@Override
	public boolean removeAllow(String[] allowCd) {
		int cnt=0;
		for(String cd : allowCd) {
			cnt += allowDao.deleteAllow(cd);
		}
		return cnt>0;
	}

}
