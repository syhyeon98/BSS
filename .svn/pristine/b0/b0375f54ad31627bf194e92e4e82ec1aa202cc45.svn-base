package kr.or.ddit.resignation.vo;

import java.time.LocalDate;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import kr.or.ddit.appointments.vo.AppointmentsVO;
import kr.or.ddit.business.vo.BusinessVO;
import kr.or.ddit.career.vo.CareerVO;
import kr.or.ddit.department.vo.DepartmentVO;
import kr.or.ddit.edApproval.vo.ApprovalVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.family.vo.FamilyVO;
import kr.or.ddit.license.vo.LicenseVO;
import kr.or.ddit.position.vo.PositionVO;
import kr.or.ddit.state.vo.StateVO;
import kr.or.ddit.university.vo.UniversityVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "empCd")
public class ResignationVO {
	private long rnum;
	
	private EmployeeVO employee;
	private CareerVO career;
	private DepartmentVO department;//부서
	private PositionVO position; //직급
	private BusinessVO business; // 업무
	private LicenseVO license;
	private FamilyVO family;
	private ApprovalVO approval;
	private UniversityVO uniersity;//학력
	private StateVO state;
	private AppointmentsVO appointment;
	
	private List<CareerVO> careerList; // 경력
	private List<LicenseVO> licenseList; //자격증
	private List<FamilyVO> familyList;//가족
	
	@NotBlank
	private String empCd;
	private String empName;
	private String empId1;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate reDate;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate enpStart;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate reTreatment;
	@NotBlank
	private String reGive;
	private String poName;
	private String depName;
	@NotBlank
	private String reMoney;
	@NotBlank
	private String reCont;
	private String code;
	private String empResignation;
	
	private String stateNm;
	private String uniName;
	private String uniMajor;
}
