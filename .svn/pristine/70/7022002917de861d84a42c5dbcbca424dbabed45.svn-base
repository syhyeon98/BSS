package kr.or.ddit.calendar.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.calendar.dao.CompanyDAO;
import kr.or.ddit.calendar.vo.CompanyVO;

@Service
public class CompanyServiceImpl implements CompanyService{
   @Inject
   private CompanyDAO CompanyDAO;
   @Override
   public List<CompanyVO> retrievecomList(CompanyVO company) {
	   
      return CompanyDAO.selectcomList(company);
   }
   @Override
   public boolean updateCompany(CompanyVO company) {
	     int cnt = CompanyDAO.updateCompany(company);
	   
	     return cnt > 0;
   }
   @Override
   public boolean createCompany(CompanyVO company) {
	   	 int cnt = CompanyDAO.insertCompany(company);
	   
	   	 return cnt > 0;
   }
   @Override
   public boolean removeCompany(CompanyVO company) {
		 int cnt = CompanyDAO.deleteCompany(company);
      
	   	 return cnt > 0;
   }
   @Override
   public CompanyVO retrieveCompany(Object comScNo) {
      // TODO Auto-generated method stub
      return null;
   }
}