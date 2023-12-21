package kr.or.ddit.edDocument.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.edApproval.vo.SignpathEmpVO;
import kr.or.ddit.edDocument.vo.DocumentVO;
import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.pagingVO.PaginationInfo;

/**
 * @author PC-08
 *
 */
@Mapper
public interface MyDocumentDAO {

	
	/**
	 * 로그인한 사용자가 기안한 총 기안문 갯수
	 * @param employee
	 * @return
	 */
	public int selectTotalDocument(EmployeeVO employee);
	
	
	/**
	 * 로그인한 사용자가 기안한 총 진행중인 기안문 갯수
	 * @param employee
	 * @return
	 */
	public int selectTotalDocumentD01(EmployeeVO employee);
	
	/**
	 * 로그인한 사용자가 기안한 기안문 중 승인된 기안문 갯수
	 * @param employee
	 * @return
	 */
	public int selectTotalDocumentD02(EmployeeVO employee);
	
	/**
	 * 로그인한 사용자가 기안한 기안문 중 반려된 기안문 갯수
	 * @param employee
	 * @return
	 */
	public int selectTotalDocumentD04(EmployeeVO employee);
	
	/**
	 * 리스트 출력시 필요한 count
	 * @param paging
	 * @return
	 */
	public int selectTotalConditionDocument(PaginationInfo<DocumentVO> paging);

	/**
	 * 로그인한 사용자의 문서리스트
	 * @param paigng
	 * @return
	 */
	public List<DocumentVO> selectDocumentList(PaginationInfo paging);
	
	/**
	 * 결재상태리스트
	 * @param employee
	 * @return
	 */
	public List<SignpathEmpVO> selectSignpathEmpList();
	
}
