package kr.or.ddit.BoardCompl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.BoardCompl.vo.DepVO;
import kr.or.ddit.BoardCompl.vo.EmpVO;

/**
 * 칭찬 등록/수정 양식에서 사용될 부서정보 직원정보 조회.
 *
 */
@Mapper
public interface OthersDAO {
	public List<EmpVO> selectEmpList();
	public List<DepVO> selectDepList();
}
