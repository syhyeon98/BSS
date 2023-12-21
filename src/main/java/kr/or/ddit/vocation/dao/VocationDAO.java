package kr.or.ddit.vocation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.vocation.vo.VocationVO;

@Mapper
public interface VocationDAO {
	/**
	 * 총 페이지 수 조회 
	 * @param paging
	 * @return
	 */
	public long selectTotalRecord(PaginationInfo<VocationVO> paging);
	

	/**
	 * [마이페이지] 연가 전체조회 속성값 총 갯수
	 * @param paging
	 * @return
	 */
	public long mySelectTotalRecord(PaginationInfo<VocationVO> paging);
	
	
	/**
	 * 검색조회
	 * @param paging
	 * @return
	 */
	/* public List<VocationVO> searchVocation(PaginationInfo<VocationVO> paging); */
	
	/**
	 * 연가 전체 조회 페이징
	 * @return
	 */
	public List<VocationVO> selectVocationPageList(PaginationInfo<VocationVO> paging);
	
	/**
	 * 연가 직원 선택 조회(모달)
	 * @return
	 */
	public List<VocationVO> selectOneVocation(String empCd);
	
	/**
	 * 연가 등록
	 * @param vocationVO
	 * @return
	 */
	public int insertVocation(VocationVO vocationVO);
	
	/**
	 * 연가 수정
	 * @param vocationVO
	 * @return
	 */
	public int updateVocation(VocationVO vocationVO);
	
	/**
	 * 연가 삭제
	 * @param vocationVO
	 * @return
	 */
	public int deleteVocation(List<String> vocationCodes);
	
	/**
	 * [마이페이지] 연가 전체조회 1명
	 * @param paging
	 * @return
	 */
	public List<VocationVO> mySelectVocationPageList(PaginationInfo<VocationVO> paging);
	
	/**
	 * [마이페이지] 연가 1명 연가코드 1개로 조회
	 * @param vocationVO
	 * @return
	 */
	public List<VocationVO> mySelectOneVocation(VocationVO vocationVO);
	
	/**
	 * [마이페이지] 총 연가
	 * @param empCd
	 * @return
	 */
	public Integer totalMonthVocation(String empCd);
	
	/**
	 * [마이페이지] 남은연가 조회  
	 * @param empCd
	 * @return
	 */
	public Integer restVocation(String empCd);
	
}