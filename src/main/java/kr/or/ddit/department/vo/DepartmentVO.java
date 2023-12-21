package kr.or.ddit.department.vo;

import java.util.Set;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.employee.vo.EmployeeVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "depCd")
public class DepartmentVO {
	@NotBlank
	private String depCd;
	private String depUp;
	@NotBlank
	private String depName;
	@NotBlank
	private String depNum;
	
	private int empCount; // empCount 위로 자동바인딩, 아래 empList는 수동바인딩 필요
	public Set<EmployeeVO> empList; // has many
	
}
