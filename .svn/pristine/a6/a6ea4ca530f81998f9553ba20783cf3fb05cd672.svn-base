package kr.or.ddit.training.service;

import java.util.List;

import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.training.vo.LectorVO;
import kr.or.ddit.training.vo.TrainingVO;

public interface TrainingService {
	
	/**
	 * 직원교육 전체조회
	 * @param trainVO
	 * @return
	 */
	public List<TrainingVO> retrieveTrainList(PaginationInfo<TrainingVO> paging);
	
	/**
	 * 직원교육 상세조회
	 * @param trainNo
	 * @return
	 */
	public TrainingVO retrieveTrain(int trainNo);

	/**
	 * 직원교육 1개만 조회(모달)
	 * @param trainNo
	 * @return
	 */
	public TrainingVO retrieveOneTrain(int trainNo);
	
	/**
	 * 직원교육 추가
	 * @param trainVO
	 * @return
	 */
	public boolean createTraining(TrainingVO trainVO);
	
	/**
	 * 직원교육 삭제
	 * @param trainVO
	 * @return
	 */
	public boolean removeTraining(TrainingVO trainVO);
	
	/**
	 * 직원교육 수정
	 * @param trainVO
	 * @return
	 */
	public boolean modifyTraining(TrainingVO trainVO);
	
	/**
	 * 강사조회
	 * @return
	 */
	public List<LectorVO> retrieveLector();
	
	/**
	 * <option>에서 강사명 전체 조회
	 * @return
	 */
	public List<LectorVO> retrieveLectorAll();
	
	/**
	 * 강사 상세조회
	 * @param lectorId
	 * @return
	 */
	public List<LectorVO> retrievelectorDetail(String lectorId);
}
