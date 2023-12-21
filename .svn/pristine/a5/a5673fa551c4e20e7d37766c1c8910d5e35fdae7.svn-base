package kr.or.ddit.employee.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.employee.vo.MyBoardVO;
import kr.or.ddit.pagingVO.PaginationInfo;

@Mapper
public interface EmployeeDAO{
	/**
	 * @param paging
	 * @return
	 */
	public long selectTotalRecord(PaginationInfo paging);
	/**
	 * 전체 리스트 페이징
	 * @param paging 
	 * @return
	 */
	public List<EmployeeVO> selectEmpList(PaginationInfo paging);
	/**
	 * 검색을 위한
	 * @return
	 */
	public List<EmployeeVO> employeeList();
	/**
	 * 직원등록
	 * @param emp
	 * @return
	 */
	public int insertEmployee(EmployeeVO employee);
	/**
	 * 직원상세
	 * @param empCd
	 * @return
	 */
	public EmployeeVO empDetail(String empCd);
	/**
	 * 직원 수정
	 * @param emp
	 * @return
	 */
	public int updateEmployee(EmployeeVO emp);
	
	public EmployeeVO selectEmployeeForAuth(String empCd);
	
	/**
	 * 전체 리스트(페이징 X)
	 * @return
	 */
	public List<EmployeeVO> empListNotPaging(PaginationInfo<EmployeeVO> paging);
	
	public List<MyBoardVO> myBoard(PaginationInfo paging);
	
	public int updateEmployeeReg(EmployeeVO empCd);
	
	public List<EmployeeVO> empRoleList();
	
	public int roleUpdate(EmployeeVO empCd);
}
