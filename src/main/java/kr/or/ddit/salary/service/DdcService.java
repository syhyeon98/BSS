package kr.or.ddit.salary.service;

import java.util.List;

import kr.or.ddit.salary.vo.DdcVO;

public interface DdcService {
	
	/**
	 * 공제기준을 가져오는 메서드
	 * 
	 * @return
	 */
	public List<DdcVO> retrieveDdcList();
	
	/**
	 * 공제 기준 상세
	 * @param ddcCd
	 * @return
	 */
	public DdcVO retrieveDdc(String ddcCd);
	
	/**
	 * 공제기준 수정
	 * @param ddc
	 * @return
	 */
	public boolean modifyDdc(DdcVO ddc);	
	
	
	/**
	 * 공제기준 추가하는 메서드
	 * @param ddcList
	 * @return
	 */
	public boolean createDdc(List<DdcVO> ddcList);
	
	
	/**
	 * 공제기준 삭제하는 메서드
	 * @param ddcCd
	 * @return
	 */
	public boolean removeDdc(String[] ddcCd);
	
}
