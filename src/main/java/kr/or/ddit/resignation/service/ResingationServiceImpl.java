package kr.or.ddit.resignation.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.resignation.dao.ResignationDAO;
import kr.or.ddit.resignation.vo.ResignationVO;

@Service
public class ResingationServiceImpl implements ResignationService {

	@Inject
	private ResignationDAO reDAO;
	
//	@Override
//	public boolean createResignation(ResignationVO resgination) {
//		int cnt = 0;
//		if(resgination.getCode() == "") {
//			return false;
//		}
//		cnt = reDAO.insertResination(resgination);
//		
//		return cnt > 0;
//	}

	@Override
	public List<ResignationVO> retrieveResignationList(PaginationInfo paging) {
		long totalRecord = reDAO.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return reDAO.reEmployeeList(paging);
	}

	@Override
	public ResignationVO reEmployeeDetail(String empCd) {
		return reDAO.reEmployeeDetail(empCd);
	}

}
