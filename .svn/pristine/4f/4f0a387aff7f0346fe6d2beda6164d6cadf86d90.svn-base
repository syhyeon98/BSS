package kr.or.ddit.salary.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.salary.vo.SalaryDetailVO;
import kr.or.ddit.salary.vo.SalaryVO;

@Mapper
public interface SalaryDetailDAO {

	/**
	 * 해당급여에 따른 모든 직원의 급여상세리스트
	 * @param salNo 급여번호, 급여정산년월임
	 * @return
	 */
	public List<SalaryDetailVO> selectSalaryDetailList(SalaryDetailVO salaryDetailVO);
	
	/**
	 * 급여상세 데이터 insert
	 * @return
	 */
	public int insertSalaryDetail();
	
	/**
	 * 급여상세 데이터 삭제
	 * @return
	 */
	public int deleteSalaryDetail(SalaryVO salary);
	
	/**
	 * 급여정산완료
	 * @param salary
	 * @return
	 */
	public int updateSalaryGiveYmd(SalaryVO salary);
	
}
