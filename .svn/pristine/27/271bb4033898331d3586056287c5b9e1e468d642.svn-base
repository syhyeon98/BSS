package kr.or.ddit.edApproval.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.department.vo.DepartmentVO;
import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.state.vo.StateVO;

@Mapper
public interface ApprovalDao {
	
	/**
	 * @param paging
	 * @return
	 */
	public long selectTotalRecord(PaginationInfo<DepartmentVO> paging);
	
	/**
	 * 결재선 지정 시 직원 검색을 위한 직원 정보
	 */
	public List<DepartmentVO> selectEmpList(PaginationInfo<DepartmentVO> pagingVO); //EmployeeVO empVO
	
	
	/**
	 * 공통코드_결재방법 조회
	 */
	public List<StateVO> selectStateList();
	
}
