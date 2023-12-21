package kr.or.ddit.salary.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.salary.vo.DdcVO;

@Mapper
public interface DdcDAO {
	
	/**
	 * 모든 공제
	 * @return
	 */
	public List<DdcVO> selectDdcList();
	
	/**
	 * 공제 상세
	 * @param ddcCd
	 * @return
	 */
	public DdcVO selectDdc(String ddcCd);
	
	/**
	 * 공제 추가
	 * @param ddc
	 * @return
	 */
	public int insertDdc(DdcVO ddc);

	/**
	 * 공제 수정
	 * @param ddc
	 * @return
	 */
	public int updateDdc(DdcVO ddc);
	
	/**
	 * 공제삭제
	 * @param ddcCd
	 * @return
	 */
	public int deleteDdc(String ddcCd);
	
}
