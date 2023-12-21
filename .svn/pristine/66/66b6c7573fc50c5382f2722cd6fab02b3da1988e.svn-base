package kr.or.ddit.training.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.training.dao.TrainingDAO;
import kr.or.ddit.training.vo.LectorVO;
import kr.or.ddit.training.vo.TrainingVO;

@Service
public class TrainingServiceImpl implements TrainingService{

	@Inject
	private TrainingDAO dao;
	
	/**
	 * 교육등록
	 */
	@Override
	public boolean createTraining(TrainingVO trainVO) {
		return dao.insertTraining(trainVO) > 0;
	}
	
	/**
	 * 교육삭제
	 */
	@Override
	public boolean removeTraining(TrainingVO trainVO) {
		return dao.deleteTraining(trainVO) > 0;
	}
	
	/**
	 * 교육수정
	 */
	@Override
	public boolean modifyTraining(TrainingVO trainVO) {
		return dao.updateTraining(trainVO) > 0;
	}
	
	/**
	 * 교육전체조회
	 */
	@Override
	public List<TrainingVO> retrieveTrainList(PaginationInfo<TrainingVO> paging) {
		long totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectTrainList(paging);
	}

	/**
	 * 교육상세조회
	 */
	@Override
	public TrainingVO retrieveTrain(int trainNo) {
		return dao.selectTrain(trainNo);
	}
	
	/**
	 * 강사조회
	 */
	@Override
	public List<LectorVO> retrieveLector() {
		return dao.selectLector();
	}
	
	/**
	 * 강사상세조회
	 */
	@Override
	public List<LectorVO> retrievelectorDetail(String lectorId) {
		return dao.selectLectorDetail(lectorId);
	}

	/**
	 * <option>에서 강사명 상세조회
	 */
	@Override
	public List<LectorVO> retrieveLectorAll() {
		return dao.selectLectorAll();
	}

	/**
	 * 직원교육 1개만 조회(모달)
	 */
	@Override
	public TrainingVO retrieveOneTrain(int trainNo) {
		return dao.selectOneTrain(trainNo);
	}
	
}
