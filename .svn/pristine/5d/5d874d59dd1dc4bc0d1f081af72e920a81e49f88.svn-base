package kr.or.ddit.salary.vo;

import java.time.LocalDate;
import java.util.List;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.employee.vo.EmployeeVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author PC-08
 * 급여상세 테이블
 * - 급여번호, 직원사번, 지급년월, 급여정산일, 급여총액
 */
@Data
@EqualsAndHashCode(of = {"salNo","empCd"})
public class SalaryDetailVO {
	
	@NotBlank
	private Integer salNo;
	@NotBlank
	private String empCd;
	private LocalDate giveYmd;
	private LocalDate salClclnYmd;
	private long salTotal;
	
	private String yearMonth;

	
	private EmployeeVO employeeVO;

	private SalaryVO salaryVO;
	
	private List<AllowHistoryVO> allowHistoryList;
	private List<DdcHistoryVO> ddcHistoryList;
	
//	public void setSalNo(Integer salNo) {
//		this.salNo = salNo;
//		String stringValue = String.valueOf(salNo-1);
//		String year = stringValue.substring(0, 4);
//		String month = stringValue.substring(4, 6);
//		this.yearMonth = year + "-" + month + "-";
//	}
}
