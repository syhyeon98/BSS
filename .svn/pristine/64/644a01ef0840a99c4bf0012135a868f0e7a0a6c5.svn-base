package kr.or.ddit.license.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.license.dao.LicenseDAO;
import kr.or.ddit.license.vo.LicenseVO;

@Service
public class LicenseServiceImpl implements LicenseService {

	@Inject
	LicenseDAO liDAO;
	
	@Override
	public boolean createLicense(List<LicenseVO> licenseList) {
		int cnt = 0;
		for(LicenseVO license : licenseList) {
			if(license.getLicenseCd() == null && license.getLicenseDate() == null 
					&& license.getLicenseAgency() == "") {
				return false;
			}
			cnt += liDAO.insertLicense(license);
		}
		
		
		return cnt > 0;
	}

	@Override
	public List<LicenseVO> retrieveLiList(String empCd) {
		return liDAO.licenseList(empCd);
	}

	@Override
	public boolean upCreateLicense(List<LicenseVO> licenseList) {
		int cnt = 0;
		for(LicenseVO license : licenseList) {
			if(license.getLicenseCd() == null && license.getLicenseDate() == null 
					&& license.getLicenseAgency() == "") {
				return false;
			}
			cnt += liDAO.upInsertLicense(license);
		}
		
		
		return cnt > 0;
	}

}
