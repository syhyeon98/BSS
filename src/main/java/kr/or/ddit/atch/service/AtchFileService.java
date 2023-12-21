package kr.or.ddit.atch.service;

import java.io.IOException;

import org.springframework.core.io.Resource;

import kr.or.ddit.atch.vo.AtchFileDetailVO;
import kr.or.ddit.atch.vo.AtchFileVO;


public interface AtchFileService {
	public AtchFileDetailVO retrieveAtchFileDetail(AtchFileDetailVO condition);
	
	/**
	 * 새로운 파일 그룹 생성 및 저장
	 * @param fileGroup
	 * @param saveRes 2진 데이터 저장 위치
	 * @return 새로 생성된 파일 그룹 번호(atchFileId)
	 * @throws IOException TODO
	 */
	public int createAtchFileGroup(AtchFileVO fileGroup, Resource saveRes) throws IOException;
	/**
	 * 파일 그룹 삭제
	 * @param atchFileId
	 * @param saveRes 삭제할 파일의 2진 데이터 저장 위치
	 * @return
	 * @throws IOException 
	 */
	public boolean removeAtchFileGroup(int atchFileId, Resource saveRes) throws IOException;
}
