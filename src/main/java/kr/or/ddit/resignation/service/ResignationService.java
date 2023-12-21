package kr.or.ddit.resignation.service;

import java.util.List;

import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.resignation.vo.ResignationVO;

public interface ResignationService {

//	public boolean createResignation(ResignationVO resgination);

	public List<ResignationVO> retrieveResignationList(PaginationInfo paging);
	
	public ResignationVO reEmployeeDetail(String empCd);
}
