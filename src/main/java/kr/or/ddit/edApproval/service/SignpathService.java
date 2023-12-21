package kr.or.ddit.edApproval.service;

import java.util.List;

import kr.or.ddit.atch.vo.AtchFileDetailVO;
import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.edApproval.vo.SignImgVO;
import kr.or.ddit.edApproval.vo.SignpathEmpVO;
import kr.or.ddit.edApproval.vo.SignpathVO;
import kr.or.ddit.pagingVO.PaginationInfo;

public interface SignpathService {

	/**
	 * 결재선 리스트 불러오기
	 * @param paging
	 * @return
	 */
	public List<SignpathVO> retrieveSignpathList(PaginationInfo<SignpathVO> paging);
	
	
	/**
	 * 결재도장 추가
	 * @param signImg
	 * @return
	 */
	public boolean createSignImg(SignImgVO signImg);
	
	/**
	 * 결재도장 파일 상세 가져오기
	 * @param atchFileVO
	 * @return
	 */
	public List<AtchFileDetailVO> retrieveAtchFile(AtchFileVO atchFileVO);


	//public SignpathVO retrieveSignpathList(int signPathNo);
	
	
	/**
	 * 읽음처리
	 * @param signpathEmp
	 * @return
	 */
	public boolean modifySignpathEmpRead(SignpathEmpVO signpathEmp);
	
}
