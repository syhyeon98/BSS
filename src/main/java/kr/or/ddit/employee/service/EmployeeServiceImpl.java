package kr.or.ddit.employee.service;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.atch.dao.AtchFileDAO;
import kr.or.ddit.atch.service.AtchFileService;
import kr.or.ddit.atch.vo.AtchFileDetailVO;
import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.career.dao.CareerDAO;
import kr.or.ddit.career.vo.CareerVO;
import kr.or.ddit.employee.dao.EmployeeDAO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.employee.vo.EmployeeVOWrapper;
import kr.or.ddit.employee.vo.MyBoardVO;
import kr.or.ddit.family.dao.FamilyDAO;
import kr.or.ddit.family.vo.FamilyVO;
import kr.or.ddit.license.dao.LicenseDAO;
import kr.or.ddit.license.vo.LicenseVO;
import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.university.dao.UniversityDAO;
import kr.or.ddit.university.vo.UniversityVO;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	@Inject
	private EmployeeDAO empDAO;
	@Inject
	private FamilyDAO famDAO;
	@Inject
	private LicenseDAO liDAO;
	@Inject
	private CareerDAO carDAO;
	@Inject
	private UniversityDAO uniDAO;
	@Inject
	private AtchFileService atchService;
	@Value("#{appInfo.profileimagePath}")
	private Resource atchPath;

	private void processAtchFileGroup(EmployeeVO employee) {
		MultipartFile[] empFiles = employee.getEmpFiles();
		if (empFiles == null)
			return;
		List<AtchFileDetailVO> detailList = new ArrayList<>();
		for (MultipartFile empFile : empFiles) {
			if (empFile.isEmpty())
				continue;
			detailList.add(new AtchFileDetailVO(empFile));
		}
		if (detailList.size() > 0) {
			AtchFileVO fileGroup = new AtchFileVO();
			fileGroup.setDetailList(detailList);
			try {
				// 1. 첨부파일의 메타 데이터 저장
				// 2. 첨부파일의 2진 데이터 저장
				int atchNo = atchService.createAtchFileGroup(fileGroup, atchPath);
				employee.setAtchNo(atchNo);
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
	}

	@Override
	public boolean createEmployee(EmployeeVO employee) {
		processAtchFileGroup(employee);
		boolean success = empDAO.insertEmployee(employee) > 0;
		if (success) {
			// 자격증이 작성되면 등록시키고 없으면 지나짐
			if (employee.getLicenseList() != null && !employee.getLicenseList().isEmpty()) {
				for (LicenseVO license : employee.getLicenseList()) {
					if (license.getLicenseNm() != null && !license.getLicenseNm().isEmpty()) {
						success &= liDAO.upInsertLicense(license) > 0;
					}
				}
			}
			// 경력이 있는경우
			if (employee.getCareerList() != null && !employee.getCareerList().isEmpty()) {
				for (CareerVO career : employee.getCareerList()) {
					if (career.getCarNm() != null && !career.getCarNm().isEmpty()) {
						success &= carDAO.upInsertCareer(career) > 0;
					}
				}
			}
			// 가족이 있을 시
			if (employee.getFamilyList() != null && !employee.getFamilyList().isEmpty()) {
				for (FamilyVO family : employee.getFamilyList()) {
					if (family.getFamName() != null && !family.getFamName().isEmpty()) {
						success &= famDAO.upInsertFamily(family) > 0;
					}
				}
			}
			// 학력사항
			if (employee.getUniersity() != null) {
				UniversityVO university = employee.getUniersity();
				if (university.getUniName() != null && !university.getUniName().isEmpty()) {
					success &= uniDAO.insertUniversity(university) > 0;
				}
			}
		}

		return success;
	}

	@Override
	public List<EmployeeVO> retrieveEmpList(PaginationInfo paging) {
		long totalRecord = empDAO.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return empDAO.selectEmpList(paging);
	}

	@Override
	public EmployeeVO retrieveEmpDetail(String empCd) {
		return empDAO.empDetail(empCd);
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		EmployeeVO member = empDAO.selectEmployeeForAuth(username);
		if (member == null) {
			throw new UsernameNotFoundException(MessageFormat.format("{0} 사용자 없음.", username));
		}

		return new EmployeeVOWrapper(member);
	}

	@Override
	public boolean modifyEmployee(EmployeeVO employee) {
		boolean success = true;
		success = empDAO.updateEmployee(employee) > 0 ? true : false;
		if (success == true || success == false) {
			if (employee.getLicenseList() != null && !employee.getLicenseList().isEmpty()) {
				for (LicenseVO license : employee.getLicenseList()) {
					if (license.getLicenseNm() != null && !license.getLicenseNm().isEmpty()) {
						success &= liDAO.upInsertLicense(license) > 0;
					}
				}
			}
			if (employee.getCareerList() != null && !employee.getCareerList().isEmpty()) {
				for (CareerVO career : employee.getCareerList()) {
					if (career.getCarNm() != null && !career.getCarNm().isEmpty()) {
						success &= carDAO.upInsertCareer(career) > 0;
					}
				}
			}
			if (employee.getFamilyList() != null && !employee.getFamilyList().isEmpty()) {
				for (FamilyVO family : employee.getFamilyList()) {
					if (family.getFamName() != null && !family.getFamName().isEmpty()) {
						success &= famDAO.upInsertFamily(family) > 0;
					}
				}
			}
		}
		return success;
	}

	@Override
	public List<EmployeeVO> employeeList() {
		return empDAO.employeeList();
	}

	@Override
	public List<EmployeeVO> empListNotPaging(PaginationInfo<EmployeeVO> paging) {

		return empDAO.empListNotPaging(paging);
	}

	@Override
	public List<MyBoardVO> myBoard(PaginationInfo paging) {
		long totalRecord = empDAO.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return empDAO.myBoard(paging);
	}

	@Override
	public boolean modifyEmpReq(EmployeeVO empCd) {
		return empDAO.updateEmployeeReg(empCd) > 0;
	}

	@Override
	public List<EmployeeVO> empRoleList() {
		return empDAO.empRoleList();
	}

	@Override
	public boolean roleModify(EmployeeVO empCd) {
		return empDAO.roleUpdate(empCd) > 0;
	}

}
