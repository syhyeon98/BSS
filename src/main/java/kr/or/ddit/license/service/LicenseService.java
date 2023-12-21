package kr.or.ddit.license.service;

import java.util.List;

import kr.or.ddit.license.vo.LicenseVO;

public interface LicenseService {

	public List<LicenseVO> retrieveLiList(String empCd);
	public boolean createLicense(List<LicenseVO> licenseList);
	public boolean upCreateLicense(List<LicenseVO> licenseList);
}
