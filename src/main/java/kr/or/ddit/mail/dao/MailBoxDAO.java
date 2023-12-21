package kr.or.ddit.mail.dao;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.mail.vo.MailBoxVO;
import kr.or.ddit.pagingVO.PaginationInfo;

@Mapper
public interface MailBoxDAO {
	public long selectTotalRecord(PaginationInfo paging); 
	
	/**
	 * 이메일 전송시에 메일 보관함에 저장
	 * @param email
	 * @return
	 */
	public int sendMail(MailBoxVO email);
	
	public int insertMail(MailBoxVO mailBox);
	
	/**
	 * 메일함 전체 조회
	 * @param mailNo
	 * @return
	 */
	public List<MailBoxVO> selectAllMail(PaginationInfo paging);
	
	/**
	 * 보낸 사람의 메일을 가져옴
	 * @return
	 */
	public List<MailBoxVO> selectSendMailList(PaginationInfo paging);
	
	/**
	 * 받은 메일을 가져옴
	 * @return
	 */
	public List<MailBoxVO> selectReciveMailList(PaginationInfo paging);
	
	/**
	 * 내게 쓴 메일함
	 * @param empMail
	 * @return
	 */
	public List<MailBoxVO> selectToMeList(PaginationInfo paging);
	
	/**
	 * 메일아이디
	 * @param empId
	 * @return
	 */
	public String selectMail(String empId);
	
	/**
	 * 토큰 가져오기
	 * @param mail
	 * @return
	 */
	public String getMailToken(String empId);
	
	/**
	 * 보낸 메일 상세조회
	 * @param mailNo
	 * @return
	 */
	public MailBoxVO selectSendMailDetail(String mailNo);
	
	/**
	 * 메일 상세 조회
	 * @param mailNo
	 * @return
	 */
	public MailBoxVO selectMailDetail(String mailNo);
	           
	/**
	 * 메일 임시저장 보관함
	 * @param mail
	 * @return
	 */
	public int mailStorageInfo(MailBoxVO mail);
	
	/**
	 * 임시저장 메일 보관함
	 * @param empCd
	 * @return
	 */
	public List<MailBoxVO> selectTempMailList(PaginationInfo paging);
	
	/**
	 * 임시저장메일에서 전송 후에 메일 임시저장 속성, 전송 값으로 DB 변경 
	 * @param mail
	 * @return
	 */
	public int sendTempMail(String mailNo);
	
	/**
	 * 메일을 휴지통에 버리기 위해 MAIL_DELETE 변경 (1 -> 휴지통)
	 * @return
	 */
	public int mailWaste(MailBoxVO mailBox);
	
	/**
	 * 휴지통에 버린 메일함 리스트 출력
	 * @param paging
	 * @return
	 */
	public List<MailBoxVO> selectWasteMailList(PaginationInfo paging);
	
	/**
	 * 메일 완전 삭제
	 * @param mailNo
	 * @return
	 */
	public int deleteWasteMail(MailBoxVO mailBox);
	
	/**
	 * 메일 복구
	 * @param mailNo
	 * @return
	 */
	public int restoreWasteMail(String mailNo);
	
	/**
	 * 중요 메일 설정을 위해 MAIL_IMPO 변경 (1 -> 중요메일)
	 * @param mailNo 메일 번호를 기준으로 
	 * @return 중요메일 설정 여부
	 */
	public int impoSetMail(MailBoxVO mailBox);
	
	/**
	 * 중요메일 리스트 출력
	 * @param empCd 사원 번호를 기준으로
	 * @return
	 */
	public List<MailBoxVO> selectImpoList(PaginationInfo paging);
	
	/**
	 * 발신자의 사번 획득
	 * @param mailNO 메일번호를 기준으로
	 * @return
	 */
	public String mailSenderEmpCd(String mailNO);

	public void restoreWasteMail(MailBoxVO mailBox);
}
