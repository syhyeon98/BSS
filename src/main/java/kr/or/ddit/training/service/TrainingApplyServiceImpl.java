package kr.or.ddit.training.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.training.dao.TrainingApplyDAO;
import kr.or.ddit.training.vo.TrainingApplyVO;
import kr.or.ddit.training.vo.TrainingVO;

@Service
public class TrainingApplyServiceImpl implements TrainingApplyService {
	
	@Inject
	public TrainingApplyDAO dao;
	
	/**
	 * 교육 신청자 전체조회
	 */
	@Override
	public List<TrainingApplyVO> retrieveTrainApplyListAll(PaginationInfo<TrainingApplyVO> paging) {
		long totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectTrainApplyAll(paging);
	}
	
	/**
	 * 교육별 신청자 조회(모달)
	 */
	@Override
	public List<TrainingApplyVO> retrieveTrainApplyList(PaginationInfo<TrainingApplyVO> paging) {
		long totalRecord = dao.totalRecordForTrainApply(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectTrainApply(paging);
	}
	
	/**
	 * [마이페이지] 교육 내역 조회
	 */
	@Override
	public List<TrainingVO> retrieveMyTrain(PaginationInfo<TrainingVO> paging) {
		long totalRecord = dao.totalRecordForMyTrain(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectMyTrain(paging);
	}

	/**
	 * 로그인한 사람의 특정교육에 대한 신청값이 있는지 조회
	 */
	@Override
	public TrainingApplyVO retrieveHaveApply(TrainingApplyVO trainingApplyVO) {
		return dao.selectHaveApply(trainingApplyVO);
	}
	
	/**
	 * 교육 신청하기
	 */
	@Override
	public boolean createTrainApply(TrainingApplyVO trainApplyVO) {
		return dao.insertTrainApply(trainApplyVO) > 0;
	}
	
	/**
	 * 교육 취소하기
	 */
	@Override
	public boolean removeTrainApply(TrainingApplyVO trainApplyVO) {
		return dao.deleteTrainApply(trainApplyVO) > 0;
	}
	
	/**
	 * 직원교육 신청자 1명 조회
	 */
	@Override
	public List<TrainingApplyVO> retrieveTrainApplyOne(PaginationInfo<TrainingApplyVO> paging) {
		long totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectOneTrainApply(paging);
	}
	
	/**
	 * [메인 > 기타업무 > 교육신청] 마감기한이 지나지 않은 직원교육 전체조회
	 */
	@Override
	public List<TrainingVO> retrieveTrainList(PaginationInfo<TrainingVO> paging) {
		long totalRecord = dao.selectTotalRecordforTrainList(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectTrainList(paging);
	}

}
