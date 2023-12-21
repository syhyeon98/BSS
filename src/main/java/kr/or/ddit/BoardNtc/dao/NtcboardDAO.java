package kr.or.ddit.BoardNtc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.BoardNtc.vo.NtcboardVO;
import kr.or.ddit.atch.vo.AtchFileDetailVO;
import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.pagingVO.PaginationInfo;

/**
 * 공지사항 PL
 * 
 */
@Mapper
public interface NtcboardDAO {
	/**
	 * 공지사항등록
	 * @param ntc
	 * @return
	 */
	public int insertNtc(NtcboardVO ntc);
	/**
	 * 공지사항상세조회
	 * @param ntcNo
	 * @return 존재하지 않는 경우, null 반환
	 */
	public NtcboardVO selectNtc(int ntcNo);
	/**
	 * 공지수 조회
	 * @return 검색 조건에 맞는 공지수 조회
	 */
	public long selectTotalRecord(PaginationInfo<NtcboardVO> paging);
	/**
	 * 공지사항목록조회
	 *
	 */
	public List<NtcboardVO> selectNtcList(PaginationInfo<NtcboardVO> paging);
	public List<NtcboardVO> mainNtcList();
	/**
	 * 공지사항 수정
	 * @param ntc
	 * @return 수정된 레코드 수, >0 성공
	 */
	public int updateNtc(NtcboardVO ntc);

	public int deleteNtc(NtcboardVO ntc);
	
	public List<AtchFileDetailVO> selectNtcForm(AtchFileVO atchFileVo);
	
}