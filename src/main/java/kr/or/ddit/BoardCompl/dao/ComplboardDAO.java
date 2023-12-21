package kr.or.ddit.BoardCompl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.BoardCompl.vo.ComplboardVO;
import kr.or.ddit.pagingVO.PaginationInfo;

/**
 * 칭찬합니다 PL
 * 
 */
@Mapper
public interface ComplboardDAO {

	public int insertCompl(ComplboardVO compl);

	public ComplboardVO selectCompl(int complNo);

	public long selectTotalRecord(PaginationInfo<ComplboardVO> paging);

	public List<ComplboardVO> selectComplList(PaginationInfo<ComplboardVO> paging);
	
	public List<ComplboardVO> myComplBoardList(String empCd);
	
	/**
	 * 
	 * @param complEmpName
	 * @return
	 */
	public ComplboardVO selectComplEmp(ComplboardVO com);
	
	/**
	 * 칭찬글 삭제
	 * @param compl
	 * @return
	 */
	public int deleteCompl(ComplboardVO compl);
	
	/** 
	 * 칭찬글 수정
	 * @param compl
	 * @return
	 */
	public int updateCompl(ComplboardVO compl);
}
