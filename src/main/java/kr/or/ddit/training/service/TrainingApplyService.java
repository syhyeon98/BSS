package kr.or.ddit.training.service;

import java.util.List;

import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.training.vo.TrainingApplyVO;
import kr.or.ddit.training.vo.TrainingVO;

public interface TrainingApplyService {
	
	/**
	 * 직원교육 신청자 전체조회
	 * @param paging
	 * @return
	 */
	public List<TrainingApplyVO> retrieveTrainApplyListAll(PaginationInfo<TrainingApplyVO> paging);
	
	/**
	 * 교육별 신청자 조회(모달)
	 * @param paging
	 * @return
	 */
	public List<TrainingApplyVO> retrieveTrainApplyList(PaginationInfo<TrainingApplyVO> paging);
	
	/**
	 * [마이페이지] 교육 내역 조회
	 * @param paging
	 * @return
	 */
	public List<TrainingVO> retrieveMyTrain(PaginationInfo<TrainingVO> paging);
	
	/**
	 * 직원교육 신청자 1명 조회
	 * @param paging
	 * @return
	 */
	public List<TrainingApplyVO> retrieveTrainApplyOne(PaginationInfo<TrainingApplyVO> paging);
	
	/**
	 * 로그인한 사람의 특정교육에 대한 신청값이 있는지 조회
	 * @param attendVO
	 * @return
	 */
	public TrainingApplyVO retrieveHaveApply(TrainingApplyVO trainingApplyVO);
	
	/**
	 * 교육 신청하기
	 * @param trainApplyVO
	 * @return
	 */
	public boolean createTrainApply(TrainingApplyVO trainApplyVO);
	
	/**
	 * 교육 취소하기
	 * @param trainApplyVO
	 * @return
	 */
	public boolean removeTrainApply(TrainingApplyVO trainApplyVO);
	
	/**
	 * [메인 > 기타업무 > 교육신청] 마감기한이 지나지 않은 직원교육 전체조회
	 * @param trainVO
	 * @return
	 */
	public List<TrainingVO> retrieveTrainList(PaginationInfo<TrainingVO> paging);
	
}
