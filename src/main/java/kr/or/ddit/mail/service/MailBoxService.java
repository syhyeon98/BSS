package kr.or.ddit.mail.service;

import java.util.List;

import kr.or.ddit.mail.vo.MailBoxVO;
import kr.or.ddit.pagingVO.PaginationInfo;

public interface MailBoxService {
	/**
	 * 메일을 보낼 경우에 보낸 메일을 저장
	 * @param mail 전송한 메일을
	 * @param empCd 사번을 기준으로
	 * @return 저장하고 결과 반환
	 */
	public boolean sendMail(MailBoxVO mail, String empCd);

	/**
	 * 메일을 서버에서 받아와서 LIST에 저장 후에 DB에 저장 후(insertMailList)에 결과에 따라서 주소 반환
	 * @param empId 사번을 기준으로 메일 아이디와, 토큰을 가져와서
	 * @param paging
	 * @return 메일을 전송하고 결과 반환
	 */
	public String recieveMailList(String empId);

	/**
	 * 전체 메일 출력
	 * @param empCd 사번을 기준으로
	 * @return 전체 메일 리스트
	 */
	public List<MailBoxVO> allMail(String empCd, PaginationInfo<MailBoxVO> paging);
	
	/**
	 * 보낸 메일 리스트 출력
	 * @param empId 사번을 기준으로
	 * @return 보낸 메일의 리스트 반환
	 */
	public List<MailBoxVO> retriveSendMailList(String empId, PaginationInfo<MailBoxVO> paging);
	
	/**
	 * 받은 메일 리스트 출력
	 * @param empId 사번을 기준으로
	 * @param paging
	 * @return
	 */
	public List<MailBoxVO> retriveGetMailList(String empCd, PaginationInfo<MailBoxVO> paging);
	
	/**
	 * 메일 상세조회
	 * @param mailNo 메일번호를 기준으로
	 * @return 메일 정보 반환
	 */
	public MailBoxVO retriveMailDetail(String mailNo);

	/**
	 * 임시저장 메일 속성 변경
	 * @param mail 
	 * @param empCd
	 * @return 변경 여부 반환
	 */
	public boolean temporaryMail(MailBoxVO mail, String empCd);


	 /**
	  * 임시저장메일 리스트 출력
	  * @param empCd 사번을 기준으로
	  * @return 임시저장 리스트 반환
	  */
	public List<MailBoxVO> tempMailList(String empMail, PaginationInfo<MailBoxVO> paging);

	/**
	 * 임시저장 메일 전송시 삭제
	 * @param mailNo
	 */
	public void deleteTempMail(String mailNo);

	/**
	 * 내게 전송한 메일 리스트 출력
	 * @param empCd 사번을 기준으로
	 * @return 내게 전송한 리스트 반환
	 */
	public List<MailBoxVO> toMeList(String empCd, PaginationInfo<MailBoxVO> paging);

	/**
	 * 메일을 휴지통에 버리기
	 * @param mailNo 메일 번호를 기준으로
	 * @return MAIL_DELETE 변경 여부를 반환
	 */
	public boolean deleteMail(MailBoxVO mailBox);

	/**
	 * 휴지통 리스트 출력
	 * @param paging 
	 * @param empCd 사번을 기준으로
	 * @return 휴지통 리스트 반환
	 */
	public List<MailBoxVO> wasteMailList(MailBoxVO mailBox, PaginationInfo<MailBoxVO> paging);
	
	/**
	 * 휴지통에서 메일 완전 삭제
	 * @param mailNo 메일 번호를 기준으로
	 */
	public void removeMail(MailBoxVO mailBox);
	
	/**
	 * 휴지통에서 메일 복구
	 * @param mailNo 메일 번호를 기준으로
	 */
	public void restoreMail(MailBoxVO mailBox);
	
	/**
	 * 중요 메일 설정
	 * @param mailNo 메일 번호를 기준으로
	 * @return MAIL_IMP 변경 여부를 반환
	 */
	public void impoMail(MailBoxVO mailBox);
	
	/**
	 * 중요 메일 리스트 출력
	 * @param paging 
	 * @param empCd 사번을 기준으로
	 * @return
	 */
	public List<MailBoxVO> impoMailList(String empMail, PaginationInfo<MailBoxVO> paging);
	
	/**
	 * 메일 선택시에 메일의 보낸사람의 사번을 반환
	 * @param mailNo 메일 번호를 기준으로
	 * @return
	 */
	public String mailSenderEmpCd(String mailNo);
}
