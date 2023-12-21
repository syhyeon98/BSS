package kr.or.ddit.family.service;

import java.util.List;

import kr.or.ddit.family.vo.FamilyVO;

public interface FamilyService {

	public boolean createFamily(List<FamilyVO> familyList);
	public boolean upCreateFamily(List<FamilyVO> familyList);
	public List<FamilyVO> famList(String empCd);
	public boolean modifyFamily(FamilyVO family);
	public FamilyVO retrieveFam(String famNo);

}
