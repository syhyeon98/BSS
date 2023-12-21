package kr.or.ddit.training.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.attendance.vo.AttendanceVO;
import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.training.vo.TrainingApplyVO;
import kr.or.ddit.training.vo.TrainingVO;

@Mapper
public interface TrainingApplyDAO {
	
	public long selectTotalRecord(PaginationInfo<TrainingApplyVO> paging);
	
	/**
	 * 교육 신청자 전체조회
	 * @return
	 */
	public List<TrainingApplyVO> selectTrainApplyAll(PaginationInfo<TrainingApplyVO> paging);
	
	public long totalRecordForTrainApply(PaginationInfo<TrainingApplyVO> paging);
	/**
	 * 교육별 신청자 조회(모달)
	 * @return
	 */
	public List<TrainingApplyVO> selectTrainApply(PaginationInfo<TrainingApplyVO> paging);
	
	public long totalRecordForMyTrain(PaginationInfo<TrainingVO> paging);
	/**
	 * [마이페이지] 교육 내역 조회
	 * @return
	 */
	public List<TrainingVO> selectMyTrain(PaginationInfo<TrainingVO> paging);
	
	/**
	 * 교육 신청자 1명 조회
	 * @return
	 */
	public List<TrainingApplyVO> selectOneTrainApply(PaginationInfo<TrainingApplyVO> paging);
	
	/**
	 * 로그인한 사람의 특정교육에 대한 신청값이 있는지 조회
	 * @param attendVO
	 * @return
	 */
	public TrainingApplyVO selectHaveApply(TrainingApplyVO trainingApplyVO);
	
	/**
	 * 교육 신청하기
	 * @param trainApplyVO
	 * @return
	 */
	public int insertTrainApply(TrainingApplyVO trainApplyVO);
	
	/**
	 * 교육 취소하기
	 * @param trainApplyVO
	 * @return
	 */
	public int deleteTrainApply(TrainingApplyVO trainApplyVO);
	
	/**
	 * [메인 > 기타업무 > 교육신청] 마감기한이 지나지 않은 직원교육 전체조회 - 페이징을 위한 전체 수
	 */
	public long selectTotalRecordforTrainList(PaginationInfo<TrainingVO> paging);
	/**
	 * [메인 > 기타업무 > 교육신청] 마감기한이 지나지 않은 직원교육 전체조회
	 * @param trainVO
	 * @return
	 */
	public List<TrainingVO> selectTrainList(PaginationInfo<TrainingVO> paging);
	
}
