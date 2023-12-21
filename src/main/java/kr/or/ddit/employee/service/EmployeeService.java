package kr.or.ddit.employee.service;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

import kr.or.ddit.appointments.vo.AppointmentsVO;
import kr.or.ddit.business.vo.BusinessVO;
import kr.or.ddit.career.vo.CareerVO;
import kr.or.ddit.department.vo.DepartmentVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.employee.vo.MyBoardVO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.family.vo.FamilyVO;
import kr.or.ddit.license.vo.LicenseVO;
import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.position.vo.PositionVO;
import kr.or.ddit.resignation.vo.ResignationVO;
import kr.or.ddit.university.vo.UniversityVO;

public interface EmployeeService extends UserDetailsService{
	
	public List<EmployeeVO> retrieveEmpList(PaginationInfo paging);
	
	public List<EmployeeVO> employeeList();
	
	public boolean createEmployee(EmployeeVO employee);
	
	public EmployeeVO retrieveEmpDetail(String empCd);
	
	public boolean modifyEmployee(EmployeeVO emp);
	
	public List<EmployeeVO> empListNotPaging(PaginationInfo<EmployeeVO> paging);
	
	public List<MyBoardVO> myBoard(PaginationInfo paging);
	
	public boolean modifyEmpReq(EmployeeVO empCd);
	
	public List<EmployeeVO> empRoleList();
	
	public boolean roleModify(EmployeeVO empCd);
}
