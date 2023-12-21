package kr.or.ddit.organization.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.pagingVO.PaginationInfo;

@Mapper
public interface OrganizationDAO {
	
	List<EmployeeVO> departmentEmployeeList(String depCd);
	
	public EmployeeVO empDetail(String empCd);
	
}
