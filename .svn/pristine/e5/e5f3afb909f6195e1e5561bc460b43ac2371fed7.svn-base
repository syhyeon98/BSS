package kr.or.ddit.BoardCompl.service;

import java.util.List;

import kr.or.ddit.BoardCompl.vo.ComplboardVO;
import kr.or.ddit.exception.PKNotFoundException;
import kr.or.ddit.pagingVO.PaginationInfo;

/**
 * 공지사항 CRUD, BLL
 *
 */
public interface ComplboardSerivce {

	public boolean createCompl(ComplboardVO compl);

	public ComplboardVO retrieveCompl(int complNo) throws PKNotFoundException;

	public List<ComplboardVO> retrieveComplList(PaginationInfo<ComplboardVO> paging);
	public List<ComplboardVO> myComplList(String empCd);
	
	public ComplboardVO showComplEmp(ComplboardVO com);
	
	public boolean removeCompl(ComplboardVO compl);
	
	public boolean modifyCompl(ComplboardVO compl);
}
