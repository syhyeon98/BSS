package kr.or.ddit.university.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.university.vo.UniversityVO;

@Mapper
public interface UniversityDAO {
	
	public int insertUniversity(UniversityVO university);

}
