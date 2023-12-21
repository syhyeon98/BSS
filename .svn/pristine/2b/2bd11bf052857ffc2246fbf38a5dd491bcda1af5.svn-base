package kr.or.ddit.salary.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.salary.vo.AllowVO;

@Mapper
public interface AllowDAO {
	
	
	/**
	 * 모든 수당
	 * @return
	 */
	public List<AllowVO> selectAllowList();
	
	/**
	 * 수당 상세
	 * @param allowCd
	 * @return
	 */
	public AllowVO selectAllow(String allowCd);
	
	/**
	 * 수당 추가
	 * @param allow
	 * @return
	 */
	public int insertAllow(AllowVO allow);

	/**
	 * 수당 수정
	 * @param allow
	 * @return
	 */
	public int updateAllow(AllowVO allow);
	
	/**
	 * 수당삭제
	 * @param allowCd
	 * @return
	 */
	public int deleteAllow(String allowCd);
	
}
