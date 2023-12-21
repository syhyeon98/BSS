package kr.or.ddit.family.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.family.vo.FamilyVO;

@Mapper
public interface FamilyDAO {

	public int insertFamily(FamilyVO familyList);
	public int upInsertFamily(FamilyVO family);
	public List<FamilyVO> selectFamily(String empCd);
	public int updateFamily(FamilyVO family);
	public FamilyVO selectFam(String famNo);

}
