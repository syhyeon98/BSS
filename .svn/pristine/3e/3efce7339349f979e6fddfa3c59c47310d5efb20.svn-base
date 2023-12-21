package kr.or.ddit.BoardNtc.service;

import java.util.List;

import kr.or.ddit.BoardNtc.vo.NtcboardVO;
import kr.or.ddit.atch.vo.AtchFileDetailVO;
import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.exception.PKNotFoundException;
import kr.or.ddit.pagingVO.PaginationInfo;

/**
 * 공지사항 CRUD, BLL
 *
 */
public interface NtcboardSerivce {

	//공지사항 등록
	public boolean createNtc(NtcboardVO ntc);
	/**
	 * @param ntcNo
	 * @return
	 */
	public NtcboardVO retrieveNtc(int ntcNo) throws PKNotFoundException;
	/**
	 * @return
	 */
	public List<NtcboardVO> retrieveNtcList(PaginationInfo<NtcboardVO> paging);
	public List<NtcboardVO> retrievemainNtcList();
	/**
	 * @param ntc
	 * @return
	 */
	public boolean modifyNtc(NtcboardVO ntc);
	
	public boolean removeNtc(NtcboardVO ntc);
	
	public List<AtchFileDetailVO> retrievemainNtcList(AtchFileVO atchFileVo);
	
}
