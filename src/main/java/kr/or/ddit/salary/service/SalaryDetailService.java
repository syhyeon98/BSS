package kr.or.ddit.salary.service;

import java.util.List;

import kr.or.ddit.salary.vo.SalaryDetailVO;
import kr.or.ddit.salary.vo.SalaryVO;

public interface SalaryDetailService {

	public List<SalaryDetailVO> retrieveSalaryDetailList(int salNo);

	public List<SalaryDetailVO> retrieveSalaryDetailList(SalaryDetailVO salaryDetail);
	
	public boolean modifySalaryGiveYmd(SalaryVO salary);
	
}
