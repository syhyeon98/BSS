package kr.or.ddit.department.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.department.dao.DepartmentDAO;
import kr.or.ddit.department.vo.DepartmentVO;

@Service
public class DepartmentServiceImpl implements DepartmentService{
	@Inject
	DepartmentDAO depDAO;

	@Override
	public boolean createDepartment(DepartmentVO department) {
		int cnt = 0;
		if(department.getDepCd() == "") {
			return false;
		}
		cnt = depDAO.insertDepartment(department);
		
		return cnt > 0;
	}
	
	
}
