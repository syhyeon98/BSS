package kr.or.ddit.atch.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.atch.vo.AtchFileDetailVO;
import kr.or.ddit.atch.vo.AtchFileVO;

@Mapper
public interface AtchFileDAO {
	/**
	 * 파일 하나 조회
	 * @param condition
	 * @return
	 */
	public AtchFileDetailVO selectAtchFileDetail(AtchFileDetailVO condition);
	
	/**
	 * 파일 그룹 조회
	 * @param atchFileGroup
	 */
	public AtchFileVO selectAtchFileGroup(int atchNo);
	
	public int insertAtchFileGroup(AtchFileVO atchFileGroup);
	
	public int deleteAtchFileGroup(int atchFileId);
	public int deleteAtchFileDetails(int atchFileId);	
}
