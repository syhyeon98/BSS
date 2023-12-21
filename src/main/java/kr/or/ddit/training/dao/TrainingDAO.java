package kr.or.ddit.training.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.training.vo.LectorVO;
import kr.or.ddit.training.vo.TrainingVO;

@Mapper
public interface TrainingDAO {
	
	
	public long selectTotalRecord(PaginationInfo<TrainingVO> paging);
	
	/**
	 * 직원교육 전체조회
	 * @param trainVO
	 * @return
	 */
	public List<TrainingVO> selectTrainList(PaginationInfo<TrainingVO> paging);
	
	/**
	 * 직원교육 선택조회
	 * @param trainNo
	 * @return
	 */
	public TrainingVO selectTrain(int trainNo);
	
	/**
	 * 직원교육 1개만 조회(모달)
	 * @param trainNo
	 * @return
	 */
	public TrainingVO selectOneTrain(int trainNo);
	
	/**
	 * 직원교육 추가
	 * @param trainVO
	 * @return
	 */
	public int insertTraining(TrainingVO trainVO);
	
	/**
	 * 직원교육 삭제
	 * @param trainVO
	 * @return
	 */
	public int deleteTraining(TrainingVO trainVO);

	/**
	 * 직원교육 수정
	 * @param trainVO
	 * @return
	 */
	public int updateTraining(TrainingVO trainVO);
	
	/**
	 * 강사조회
	 * @return
	 */
	public List<LectorVO> selectLector();
	
	/**
	 * 강사 전체조회
	 * @return
	 */
	public List<LectorVO> selectLectorAll();
	
	/**
	 * 강사상세조회
	 * @param lectorId
	 * @return
	 */
	public List<LectorVO> selectLectorDetail(String lectorId);
}
