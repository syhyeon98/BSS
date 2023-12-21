package kr.or.ddit.salary.service;

import java.util.List;

import kr.or.ddit.salary.vo.AllowVO;

public interface AllowService {

	/**
	 * 수당기준을 가져오는 메서드
	 * 
	 * @return
	 */
	public List<AllowVO> retrieveAllowList();

	/**
	 * 수당 기준 상세
	 * 
	 * @param allowCd
	 * @return
	 */
	public AllowVO retrieveAllow(String allowCd);

	/**
	 * 수당기준 수정
	 * 
	 * @param allow
	 * @return
	 */
	public boolean modifyAllow(AllowVO allow);

	/**
	 * 수당기준 추가하는 메서드
	 * 
	 * @param allowList
	 * @return
	 */
	public boolean createAllow(List<AllowVO> allowList);

	/**
	 * 수당기준 삭제하는 메서드
	 * 
	 * @param allowCd
	 * @return
	 */
	public boolean removeAllow(String[] allowCd);

}
