package kr.or.ddit.calendar.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.calendar.vo.PersonalVO;

@Mapper
public interface PersonalDAO {
	/**
	 * 개인일정조회
	 * @return
	 */
	public List<PersonalVO> selectperList(PersonalVO personal);
	
	/**
	 * 개인일정 상세
	 * @param personalSCNO
	 * @return
	 */
	public PersonalVO selectCompany(String personalSCNO);
	
	/**
	 * 개인일정 추가
	 * @param personal
	 * @return
	 */
	public int insertPersonal(PersonalVO personal);
	
	/**
	 * 개인일정 수정
	 * @param personal 
	 * @return
	 */
	public int updatePersonal(PersonalVO personal);
	
	/**
	 * 개인 일정 삭제
	 * @param personalSCNO
	 * @return
	 */
	public int deletePersonal(PersonalVO personal);

	public static Object builder() {
		return null;
	}
	
}
