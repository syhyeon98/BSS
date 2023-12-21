package kr.or.ddit.edApproval.service;

import java.util.Collections;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.department.vo.DepartmentVO;
import kr.or.ddit.edApproval.dao.ApprovalDao;
import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.state.vo.StateVO;

@Service
public class ApprovalServiceImpl implements ApprovalService {
	
	@Inject
	private ApprovalDao approvalDao;
	
	/**
	 * 결재선 지정 시 직원 검색을 위한 직원 정보
	 */
	public List<DepartmentVO> retrieveEmpList(PaginationInfo<DepartmentVO> paging){
		long totalRecord = approvalDao.selectTotalRecord(paging);
//		paging.setTotalRecord(totalRecord);
		return approvalDao.selectEmpList(paging);
	}
	
	/**
	 * 결재선 지정 시 직원 검색을 위한 직원 정보
	 */
	public List<StateVO> selectStateList(){
		return approvalDao.selectStateList();
	}
	
	
}




