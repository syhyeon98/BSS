package kr.or.ddit.salary.service;

import java.util.List;

import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.salary.vo.SalaryVO;

public interface SalaryService {
	
	/**
	 * 급여 전체 조회
	 * @return
	 */
	public List<SalaryVO> salaryList();
	
	/**
	 * 급여테이블 insert
	 * @return
	 */
	public boolean createSalary();
	
	/**
	 * 급여테이블에 현재달 생성 데이터 있는지 확인
	 * @return
	 */
	public List<SalaryVO> checkBeforeCreate();
	
	
	/**
	 * 급여테이블 삭제
	 * @param salary
	 * @return
	 */
	public boolean deleteSalary(SalaryVO salary);
	
	
	/**
	 * 급여테이블 계산완료
	 * @param salary
	 * @return
	 */
	public boolean modifySalary(SalaryVO salary);
	
	
	/**
	 * 직원별 급여 리스트 가져오기
	 * @param employee
	 * @return
	 */
	public List<SalaryVO> retrieveSalaryPersonalList(EmployeeVO employee);
	
	
}
