package kr.or.ddit.edApproval.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.atch.vo.AtchFileDetailVO;
import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.edApproval.vo.SignImgVO;
import kr.or.ddit.edApproval.vo.SignpathDetailVO;
import kr.or.ddit.edApproval.vo.SignpathEmpVO;
import kr.or.ddit.edApproval.vo.SignpathVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.pagingVO.PaginationInfo;

@Mapper
public interface SignpathDAO {
	
	/**
	 * 내가가진 사인패스의 총 갯수
	 * @param paging
	 * @return
	 */
	public int selectTotalSignpath(PaginationInfo<SignpathVO> paging);
	
	/**
	 * 내가가진 사인패스 가져오기
	 * @param paging
	 * @return
	 */
	public List<SignpathVO> selectSignpathList(PaginationInfo<SignpathVO> paging);
	
	/**
	 * 결재선 상세가져요기
	 * @param signpathDetail
	 * @return
	 */
	public List<SignpathDetailVO> selectSignpathDetailList(SignpathDetailVO signpathDetail);
	
	/**
	 * 결재선 삭제 사실은 수정
	 * @param signpath
	 * @return
	 */
	public int deleteSignPath(SignpathVO signpath);
	
	/**
	 * 결재도장
	 * @param signImg
	 * @return
	 */
	public int insertSignImg(SignImgVO signImg);
	
	
	/**
	 *  내가 지금갖고있는 도장
	 * @param signImg
	 * @return
	 */
	public SignImgVO selectSignImg(SignImgVO signImg);
	
	/**
	 * 결재도장 이미지 가져오기
	 * @param atchFile
	 * @return
	 */
	public List<AtchFileDetailVO> selectAtchFile(AtchFileVO atchFile);
	
	/**
	 * 결재도장 USE -> N
	 * @param signImg
	 * @return
	 */
	public int updateSignpathImg(SignImgVO signImg);
	
	
	/**
	 * 읽음처리
	 * @param signpathEmp
	 * @return
	 */
	public int updateSignpathEmpRead(SignpathEmpVO signpathEmp);
}
