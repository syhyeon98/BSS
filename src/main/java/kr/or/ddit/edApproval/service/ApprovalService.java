package kr.or.ddit.edApproval.service;

import java.util.List;

import kr.or.ddit.department.vo.DepartmentVO;
import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.state.vo.StateVO;

public interface ApprovalService {
	
	/**
	 * 결재선 지정 시 직원 검색을 위한 직원 정보
	 */
	public List<DepartmentVO> retrieveEmpList(PaginationInfo<DepartmentVO> paging); 
	
	/**
	 * 공통코드_결재방법 조회
	 */
	public List<StateVO> selectStateList();
	
	
}