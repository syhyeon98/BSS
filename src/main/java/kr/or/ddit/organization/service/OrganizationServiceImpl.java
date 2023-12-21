package kr.or.ddit.organization.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.organization.dao.OrganizationDAO;
import kr.or.ddit.pagingVO.PaginationInfo;

@Controller
public class OrganizationServiceImpl implements OrganizationService {
	
	@Inject
	private OrganizationDAO orDAO;

	@Override
	public List<EmployeeVO> departmentEmployeeList(String depCd) {
		return orDAO.departmentEmployeeList(depCd);
	}
	@Override
	public EmployeeVO retrieveEmpDetail(String empCd) {
		return orDAO.empDetail(empCd);
	}
	

}
