package kr.or.ddit.vocation.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.vocation.dao.VocationDAO;
import kr.or.ddit.vocation.vo.VocationVO;

@Service
public class VocationServiceImpl implements VocationService {

	@Inject
	public VocationDAO dao;
	
	/**
	 * 연가 전체 조회 페이징
	 */
	@Override
	public List<VocationVO> retrieveVocationPageList(PaginationInfo<VocationVO> paging) {
		long totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectVocationPageList(paging);
	}

	
	/**
	 * 연가 직원 선택 조회(모달)
	 */
	@Override
	public List<VocationVO> retrieveOneVocation(String empCd) {
		return dao.selectOneVocation(empCd);
	}

	/**
	 * 연가 등록
	 */
	@Override
	public boolean createVocation(VocationVO vocationVO) {
		return dao.insertVocation(vocationVO) > 0;
	}

	/**
	 * 연가 수정
	 */
	@Override
	public boolean modifyVocation(VocationVO vocationVO) {
		return dao.updateVocation(vocationVO) > 0;
	}
	
	/**
	 * 연가 삭제
	 */
	@Override
	public boolean removeVocation(List<String> vocationCodes) {
		return dao.deleteVocation(vocationCodes) > 0;
	}

	/**
	 * [마이페이지] 연가 전체조회 1명
	 */
	@Override
	public List<VocationVO> mySelectVocationPageList(PaginationInfo<VocationVO> paging) {
		long totalRecord = dao.mySelectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.mySelectVocationPageList(paging);
	}
	
	/**
	 * [마이페이지] 연가 1명 연가코드 1개로 조회
	 * @param vocationVO
	 * @return
	 */
	public List<VocationVO> mySelectOneVocation(VocationVO vocationVO){
		return dao.mySelectOneVocation(vocationVO);
	}

	/**
	 * [마이페이지] 총 연가
	 */
	@Override
	public Integer totalMonthVocation(String empCd) {
		Integer result = dao.totalMonthVocation(empCd);
		return result != null ? result : 0; // 기본값을 0으로 설정
	}

	/**
	 * [마이페이지] 남은연가 조회  
	 */
	@Override
	public Integer restVocation(String empCd) {
		return dao.restVocation(empCd);
	}
	
}
