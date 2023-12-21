package kr.or.ddit.finapi.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.finapi.vo.MortagageLoanOptionVO;
import kr.or.ddit.finapi.vo.MortagageLoanVO;
import kr.or.ddit.pagingVO.PaginationInfo;

@Mapper
public interface MortagageLoanDAO {

	public long selectTotalRecord(PaginationInfo paging);
	
	public List<MortagageLoanVO> selectMortagageLoanList(PaginationInfo paging);
	
	public MortagageLoanVO selectMortagageLoan(MortagageLoanVO mortagageLoan);
	
	// 주택종류
	public List<MortagageLoanOptionVO> selectOptionMrtgTypeList();
	// 금리방식
	public List<MortagageLoanOptionVO> selectOptionLendRateTypeList();
	
}
