package kr.or.ddit.employee.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.department.vo.DepartmentVO;
import kr.or.ddit.employee.vo.DepartmentCountVO;
import kr.or.ddit.employee.vo.EmployeeCountVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.employee.vo.TotalSalaryMonthVO;

@Mapper
public interface MainEmployeeDAO {
	
	
	/**
	 * 전체직원수
	 * @return 
	 */
	public int totalCountEmployee();
	
	/**
	 * 부서별 전체 직원수
	 * @return
	 */
	public List<DepartmentCountVO> totalCountDepEmployee();
	
	/**
	 * 이번달 새로 들어온 직원
	 * @return
	 */
	public List<EmployeeVO> newEmployeeList();
	
	/**
	 * 최근 입사자 수
	 * @return
	 */
	public List<EmployeeCountVO> totalCountYearEmployee();
	
	/**
	 * 최근 5개 월급 총액
	 * @return
	 */
	public List<TotalSalaryMonthVO> totalSalary();	
}
