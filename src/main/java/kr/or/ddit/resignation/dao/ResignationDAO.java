package kr.or.ddit.resignation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.pagingVO.PaginationInfo;
import kr.or.ddit.resignation.vo.ResignationVO;

@Mapper
public interface ResignationDAO {

	/**
	 * 
	 * @param resignation
	 * @return
	 */
//	public int insertResination(ResignationVO resignation);
	
	/**
	 * 퇴사 직원 전체
	 * @param paging
	 * @return
	 */
	public List<ResignationVO> reEmployeeList(PaginationInfo paging);
	
	public ResignationVO reEmployeeDetail(String empCd);
	
	public long selectTotalRecord(PaginationInfo paging);
} 
