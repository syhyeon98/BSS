package kr.or.ddit.papers.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.license.dao.LicenseDAO;
import kr.or.ddit.license.vo.LicenseVO;
import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.papers.dao.PapersDAO;
import kr.or.ddit.papers.vo.CareerPVO;
import kr.or.ddit.papers.vo.PapersVO;
import kr.or.ddit.training.vo.TrainingVO;

@Service
public class PapersServiceImpl implements PapersService{

	@Inject
	PapersDAO documentDAO;
	
	@Inject
	PapersDAO papersDAO;
	
	@Override
	public List<PapersVO> retrieveDocuments() {
		return documentDAO.documentsList();
	}

	@Override
	public CareerPVO retrieveCareerPaper(String empCd) {
		return null;
	}
	
	@Override
	public List<TrainingVO> selectMyTrainForPaper(EmployeeVO employee) {
		return papersDAO.selectMyTrainForPaper(employee);
	}


}
