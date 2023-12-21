package kr.or.ddit.salary.service;

import kr.or.ddit.salary.vo.AllowHistoryVO;

public interface AllowHistoryService {

	
	
	/**
	 * 수당이력추가 (선택)
	 * @param allowHistory
	 * @return
	 */
	public int addAllowHistory(AllowHistoryVO allowHistory);
	
	/**
	 * 수당이력삭제(선택)
	 * @param allowHistory
	 * @return
	 */
	public int removeAllowHistory(AllowHistoryVO allowHistory);
}
