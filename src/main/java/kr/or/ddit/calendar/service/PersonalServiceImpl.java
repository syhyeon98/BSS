package kr.or.ddit.calendar.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.calendar.dao.PersonalDAO;
import kr.or.ddit.calendar.vo.PersonalVO;


@Service
public class PersonalServiceImpl implements PersonalService{
	@Inject
	private PersonalDAO PersonalDAO;
	@Override
	public List<PersonalVO> retrieveperList(PersonalVO personal) {
		  
		return PersonalDAO.selectperList(personal);
	}
	@Override
	public boolean updatePersonal(PersonalVO personal) {
		  int cnt = PersonalDAO.updatePersonal(personal);
		   
		  return cnt > 0;
	}
	@Override
	public boolean createPersonal(PersonalVO personal) {
	      int cnt = PersonalDAO.insertPersonal(personal);
		   
	      return cnt > 0;
	}
	@Override
	public boolean removePersonal(PersonalVO personal) {
		  int cnt = PersonalDAO.deletePersonal(personal);
		
	      return cnt > 0;
	}
	@Override
	public PersonalVO retrievePersonal(Object perScNo) {
	   // TODO Auto-generated method stub
	   return null;
	   }
	}