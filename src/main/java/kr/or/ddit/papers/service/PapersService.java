package kr.or.ddit.papers.service;

import java.util.List;

import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.papers.vo.CareerPVO;
import kr.or.ddit.papers.vo.PapersVO;
import kr.or.ddit.training.vo.TrainingVO;

public interface PapersService {

	public List<PapersVO> retrieveDocuments();
	
	public CareerPVO retrieveCareerPaper(String empCd);
	
	/**
	 * 이수증 출력을 위한 교육조회
	 */
	public List<TrainingVO> selectMyTrainForPaper(EmployeeVO employee);
}
