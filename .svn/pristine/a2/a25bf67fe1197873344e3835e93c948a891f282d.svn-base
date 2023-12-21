package kr.or.ddit.papers.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.license.vo.LicenseVO;
import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.papers.vo.CareerPVO;
import kr.or.ddit.papers.vo.PapersVO;
import kr.or.ddit.training.vo.TrainingVO;

@Mapper
public interface PapersDAO {
	
	public List<PapersVO> documentsList(); 
	
	public CareerPVO careerPaper(String empCd);
	
	/**
	 * 이수증 출력을 위한 교육조회
	 */
	public List<TrainingVO> selectMyTrainForPaper(EmployeeVO employee);
	
}
