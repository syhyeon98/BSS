package kr.or.ddit.mail.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.employee.vo.EmployeeVO;
import kr.or.ddit.mail.vo.MailBoxVO;

@Mapper
public interface MailBoxMainDAO {
	
	/**
	 * 보낸메일 리스트
	 * @param employee
	 * @return
	 */
	public List<MailBoxVO> selectSendMailList(EmployeeVO employee);
	
	/**
	 * 보낸메일 갯수
	 * @param employee
	 * @return
	 */
	public int selectSendMailCount(EmployeeVO employee);
	
	/**
	 * 받은 메일함
	 * @param employee
	 * @return
	 */
	public List<MailBoxVO> selectReceiveMailList(EmployeeVO employee);

	/**
	 * 받은 메일 갯수
	 * @param employee
	 * @return
	 */
	public int selectReceiveMailCount(EmployeeVO employee);
	
	/**
	 * 내게쓴 메일함
	 * @param employee
	 * @return
	 */
	public List<MailBoxVO> selectToMeMailList(EmployeeVO employee);
	
	/**
	 * 내게쓴 메일 갯수
	 * @param employee
	 * @return
	 */
	public int selectToMeMailCount(EmployeeVO employee);
	/**
	 * 휴지통 메일
	 * @param employee
	 * @return
	 */
	public List<MailBoxVO> selectDeleteMailList(EmployeeVO employee);
	
	/**
	 * 휴지통 메일 갯수
	 * @param employee
	 * @return
	 */
	public int selectDeleteMailCount(EmployeeVO employee);
	
	
}
