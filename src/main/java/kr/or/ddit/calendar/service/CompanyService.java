package kr.or.ddit.calendar.service;

import java.util.List;

import kr.or.ddit.calendar.vo.CompanyVO;
import kr.or.ddit.calendar.vo.PersonalVO;

public interface CompanyService {
   
   /**
    * 회사일정조회
    * @return
    */
   public List<CompanyVO> retrievecomList(CompanyVO company);
   
   /**
    * 회사일정 상세
    * @param comScNo
    * @return
    */
   public CompanyVO retrieveCompany(Object comScNo);
   
   /**
    * 회사일정 수정
    * @param company
    * @return
    */
   public boolean updateCompany(CompanyVO comScNo);
   
   /**
    * 회사일정 추가
    * @param list
    * @return
    */
   public boolean createCompany(CompanyVO list);
   
   /**
    * 회사일정 삭제
    * @param companySCNO
    * @return
    */
   public boolean removeCompany(CompanyVO company);


}