package kr.or.ddit.papers.vo;

import java.util.List;

import kr.or.ddit.career.vo.CareerVO;
import kr.or.ddit.department.vo.DepartmentVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import kr.or.ddit.family.vo.FamilyVO;
import kr.or.ddit.license.vo.LicenseVO;
import kr.or.ddit.position.vo.PositionVO;
import lombok.Data;

@Data
public class PapersVO {

	private EmployeeVO employee; //1:n
	private DepartmentVO department; //1:1
	private PositionVO position; //1:1
	private LicenseVO license;
	private CareerVO career; // 1:n 
	
	
	
	private EmployeeVOWrapper user;
	private List<CareerVO> careerList; // 경력
	private List<LicenseVO> licenseList; //자격증
	private List<FamilyVO> familyList;//가족
	
}
