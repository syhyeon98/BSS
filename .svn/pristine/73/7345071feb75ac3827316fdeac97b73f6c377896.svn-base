package kr.or.ddit.employee.vo;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;
import java.util.Set;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.validation.groups.Default;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import kr.or.ddit.appointments.vo.AppointmentsVO;
import kr.or.ddit.atch.vo.AtchFileDetailVO;
import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.business.vo.BusinessVO;
import kr.or.ddit.career.vo.CareerVO;
import kr.or.ddit.department.vo.DepartmentVO;
import kr.or.ddit.edApproval.vo.ApprovalVO;
import kr.or.ddit.family.vo.FamilyVO;
import kr.or.ddit.license.vo.LicenseVO;
import kr.or.ddit.position.vo.PositionVO;
import kr.or.ddit.resignation.vo.ResignationVO;
import kr.or.ddit.state.vo.StateVO;
import kr.or.ddit.university.vo.UniversityVO;
import kr.or.ddit.validate.groups.DeleteGroup;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "empCd")
public class EmployeeVO implements Serializable {
	private long rnum;
	
	@NotBlank(groups = DeleteGroup.class)
	private String empCd;
	@NotBlank(groups = {DeleteGroup.class, UpdateGroup.class})
	@Size(min = 4, groups = Default.class)
	@JsonIgnore
	private String empPw;
	@NotBlank(groups = InsertGroup.class)
	private String depCd;
	@NotBlank(groups = InsertGroup.class)
	private String poCd;
	@NotBlank(groups = InsertGroup.class)
	private String busCd;
	@NotNull(groups = InsertGroup.class)
	private Integer empId1;
	@NotNull(groups = InsertGroup.class)
	private Integer empId2;
	@NotBlank
	private String empHp;
	@NotBlank
	private String empMail;
	@NotBlank
	private String empAdd;
	@NotBlank
	private String empAdd1;
	@NotBlank
	private String empAdd2;
	@NotBlank
	private String empMarry;
	@NotBlank(groups = InsertGroup.class)
	private String empMilitary;
	
	private String empRole;
	
	
	private String today;
	
	private String empResignation;
	
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate enpStart;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate reDate; // 퇴사일자 추가
	@NotBlank(groups = {InsertGroup.class, UpdateGroup.class})
	private String empBank; 
	@NotBlank(groups = InsertGroup.class)
	private String empName;
	private Integer atchNo;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate appStart;
	@DateTimeFormat(iso = ISO.DATE)
	private LocalDate appEnd;
	private String stateNm;
	
	private MultipartFile[] empFiles;
	private AtchFileVO fileGroup; // has a
	private AtchFileDetailVO fileDetail; // has a
	
	private String outAtchNm;
	
	// 직원 사진을 저장시키기 위한 컬럼
	private byte[] empProfile;
	
	private CareerVO career;
	private DepartmentVO department;//부서
	private PositionVO position; //직급
	private BusinessVO business; // 업무
	private LicenseVO license;
	private FamilyVO family;
	private ResignationVO resignation;
	private ApprovalVO approval;
	private UniversityVO uniersity;//학력
	private StateVO state;
	private AppointmentsVO appointment;

	private List<CareerVO> careerList; // 경력
	private List<LicenseVO> licenseList; //자격증
	private List<FamilyVO> familyList;//가족
	
	private String depUp; 	// 부서상위
	private String depName; // 부서명
	private String poName;  // 직급명
	private String busName;
	private String depNum;
	
	private String empPosition; // 이름+직급(approval.xml)
	private int trainNo; 
	
	
}
