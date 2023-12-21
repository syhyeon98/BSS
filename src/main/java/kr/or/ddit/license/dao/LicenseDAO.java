package kr.or.ddit.license.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.license.vo.LicenseVO;

@Mapper
public interface LicenseDAO {
	
	public List<LicenseVO> licenseList(String empCd);
	public int insertLicense(LicenseVO license);
	public int upInsertLicense(LicenseVO license);
}
