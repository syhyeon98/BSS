package kr.or.ddit.employee.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.attendance.vo.OverTimeVO;
import kr.or.ddit.businesstrip.vo.BusinessTripVO;
import kr.or.ddit.edDocument.vo.DocumentVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.salary.vo.AllowHistoryVO;
import kr.or.ddit.salary.vo.DdcHistoryVO;
import kr.or.ddit.salary.vo.SalaryDetailVO;
import kr.or.ddit.training.vo.TrainingApplyVO;
import kr.or.ddit.vocation.vo.VocationVO;

@Mapper
public interface MypageMainDAO {
	
	
	/**
	 * 이번달의 평일을 구함
	 * @return
	 */
	public int totalWeekday();
	
	/**
	 * 이번달의 출근한 날을 구함
	 * @return
	 */
	public int totalAttendance(EmployeeVO employee);
	
	/**
	 * 이번달의 초과근무 구하기
	 * @return
	 */
	public List<OverTimeVO> selectOverTimeList(EmployeeVO employee);
	
	/**
	 * 이번달 예정된 출장 
	 * @return
	 */
	public List<BusinessTripVO> selectBusinessTriplist(EmployeeVO employee);
	
	/**
	 *  이번달 예정된 휴가
	 * @return
	 */
	public List<VocationVO> selectVacationList(EmployeeVO employee);
	
	/**
	 * 최근 급여 5개
	 * @param employee
	 * @return
	 */
	public List<SalaryDetailVO> selectSalaryList(EmployeeVO employee);
	
	/**
	 * 최근 수당 총액 5개
	 * @param employee
	 * @return
	 */
	public List<AllowHistoryVO> selectAllowList(EmployeeVO employee);
	
	/**
	 * 최근공제 총액 5개
	 * @param employee
	 * @return
	 */
	public List<DdcHistoryVO> selectDdcList(EmployeeVO employee);
	
	/**
	 * 이번달 예정교육
	 * @param employee
	 * @return
	 */
	public List<TrainingApplyVO> selectTrainingList(EmployeeVO employee);
	
	/**
	 * 내가 쓴 문서함 5개
	 * @param employee
	 * @return
	 */
	public List<DocumentVO> selectDocumentList(EmployeeVO employee);
}
