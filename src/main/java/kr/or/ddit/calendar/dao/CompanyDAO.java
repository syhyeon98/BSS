package kr.or.ddit.calendar.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.calendar.vo.CompanyVO;

@Mapper
public interface CompanyDAO {

	
	/**
	 * 회사일정 
	 * @return
	 */
	public List<CompanyVO> selectcomList(CompanyVO company);
	
	/**
	 * 회사일정 상세
	 * @param companySCNO
	 * @return
	 */
	public CompanyVO selectCompany(String companySCNO);
	
	/**
	 * 회사일정 추가
	 * @param company
	 * @return
	 */
	public int insertCompany(CompanyVO company);
	
	/**
	 * 회사일정 수정
	 * @param company 
	 * @return
	 */
	public int updateCompany(CompanyVO company);
	
	/**
	 * 회사 일정 삭제
	 * @param companySCNO
	 * @return
	 */
	public int deleteCompany(CompanyVO company);

	public static Object builder() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
