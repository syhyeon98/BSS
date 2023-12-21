package kr.or.ddit.salary.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.salary.vo.SalaryVO;

@Mapper
public interface SalaryDAO {
	
	/**
	 * 급여테이블에 넣는다
	 * @return
	 */
	public int insertSalary();
	
	/**
	 * 급여 가져오기
	 * @return
	 */
	public List<SalaryVO> salaryList();
	
	/**
	 * 직원별급여 리스트 가져오기
	 * @return
	 */
	public List<SalaryVO> salaryPersonalList(EmployeeVO employee);
	
	/**
	 * 급여 생성 전 현재월 작성해놓은 급여가 잇는지 확인
	 * @return
	 */
	public List<SalaryVO> checkBeforeInsert();
	
	
	/**
	 * 급여테이블 삭제
	 * @return
	 */
	public int deleteSalary(SalaryVO salary);
	
	/**
	 * 급여계산 완료를 위함
	 * @return
	 */
	public int updateSalary(SalaryVO salary);
}
