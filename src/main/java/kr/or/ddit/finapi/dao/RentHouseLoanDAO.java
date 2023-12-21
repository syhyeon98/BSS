package kr.or.ddit.finapi.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.finapi.vo.RentHouseLoanOptionVO;
import kr.or.ddit.finapi.vo.RentHouseLoanVO;
import kr.or.ddit.pagingVO.PaginationInfo;

@Mapper
public interface RentHouseLoanDAO {

	public long selectTotalRecord(PaginationInfo paging);
	
	public List<RentHouseLoanVO> selectRentHouseLoanList(PaginationInfo paging);
	
	public RentHouseLoanVO selectRentHouseLoan(RentHouseLoanVO RentHouseLoan);
	
	// 주택종류
	public List<RentHouseLoanOptionVO> selectOptionMrtgTypeList();
	// 금리방식
	public List<RentHouseLoanOptionVO> selectOptionLendRateTypeList();
	
}
