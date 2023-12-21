package kr.or.ddit.salary.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.salary.dao.DdcDAO;
import kr.or.ddit.salary.vo.DdcVO;

@Service
public class DdcServiceImpl implements DdcService {

	@Inject
	private DdcDAO ddcDao;
	
	@Override
	public List<DdcVO> retrieveDdcList() {
		return ddcDao.selectDdcList();
	}

	@Override
	public boolean createDdc(List<DdcVO> ddcList) {
		int cnt = 0;
		for(DdcVO ddc:ddcList) {
			if(ddc.getDdcCrtr()=="" ||ddc.getDdcNm()=="") {
				return false;
			}
			cnt += ddcDao.insertDdc(ddc);
		}
		return 0<cnt;
	}

	@Override
	public boolean removeDdc(String[] ddcCd) {
		int cnt=0;
		for(String cd : ddcCd) {
			cnt += ddcDao.deleteDdc(cd);
		}
		return cnt>0;
	}

	@Override
	public DdcVO retrieveDdc(String ddcCd) {
		return ddcDao.selectDdc(ddcCd);
	}

	@Override
	public boolean modifyDdc(DdcVO ddc) {
		return 0<ddcDao.updateDdc(ddc);
	}

}
