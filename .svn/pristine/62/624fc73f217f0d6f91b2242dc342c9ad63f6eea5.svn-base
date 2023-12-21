package kr.or.ddit.salary.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.salary.dao.AllowHistoryDAO;
import kr.or.ddit.salary.dao.DdcHistoryDAO;
import kr.or.ddit.salary.dao.SalaryDAO;
import kr.or.ddit.salary.dao.SalaryDetailDAO;
import kr.or.ddit.salary.vo.SalaryVO;

@Service
public class SalaryServiceImpl implements SalaryService {

	@Inject
	private SalaryDAO salDao;

	@Inject
	private AllowHistoryDAO allowHistorydao;

	@Inject
	private DdcHistoryDAO ddcHistoryDao;

	@Inject
	private SalaryDetailDAO salaryDetailDao;

	@Override
	public List<SalaryVO> salaryList() {
		return salDao.salaryList();
	}

	@Override
	public boolean createSalary() {
		boolean result = true;
		// 급여테이블에 급여데이터 생성
		result = salDao.insertSalary() > 0 ? true : false;
		if (result) {// 급여데이터 생성이 정상적으로 되었을 때
			allowHistorydao.insertBaseSalAllowHistory(); // 수당이력에 기본급데이터 생성
			allowHistorydao.insertMealSalAllowHistory(); // 수당이력에 식비
			if (allowHistorydao.countOverTime() > 0) { // 급여기준일 사이에 초과근무가 있을 시
				allowHistorydao.insertOverSalAllowHistory(); // 수당이력테이블에 초과근무수당 데이터 생성
			}
			ddcHistoryDao.insertDdcHistory(); // 공제이력 테이블에 넣기
			salaryDetailDao.insertSalaryDetail(); // 급여상세테이블에 넣기
		} else {

		}
		return result;
	}

	@Override
	public List<SalaryVO> checkBeforeCreate() {
		return salDao.checkBeforeInsert();
	}

	@Override
	public boolean deleteSalary(SalaryVO salary) {
		
		allowHistorydao.deleteAllowHistory(salary);
		ddcHistoryDao.deleteDdcHistory(salary);
		salaryDetailDao.deleteSalaryDetail(salary);
		salDao.deleteSalary(salary);
		return true;
	}

	@Override
	public boolean modifySalary(SalaryVO salary) {
		return 0<salDao.updateSalary(salary);
	}

	@Override
	public List<SalaryVO> retrieveSalaryPersonalList(EmployeeVO employee) {
		return salDao.salaryPersonalList(employee);
	}



}
