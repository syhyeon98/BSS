package kr.or.ddit.BoardCompl.service;

import java.text.MessageFormat;
import java.util.List;

import javax.inject.Inject;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.or.ddit.BoardCompl.dao.ComplboardDAO;
import kr.or.ddit.BoardCompl.vo.ComplboardVO;
import kr.or.ddit.exception.PKNotFoundException;
import kr.or.ddit.pagingVO.PaginationInfo;

@Service
public class ComplboardServiceImpl implements ComplboardSerivce {

	@Inject
	private ComplboardDAO complDAO;
	
	@Inject
	private PasswordEncoder encoder;
	
	@Override
	public boolean createCompl(ComplboardVO compl) {
		return complDAO.insertCompl(compl) > 0;
	}

	@Override
	public List<ComplboardVO> retrieveComplList(PaginationInfo<ComplboardVO> paging) {
		long totalRecord = complDAO.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return complDAO.selectComplList(paging);
	}

	@Override
	public ComplboardVO retrieveCompl(int complNo) throws PKNotFoundException {
		ComplboardVO compl = complDAO.selectCompl(complNo);
		if(compl==null)
			throw new PKNotFoundException(MessageFormat.format("{0} 해당 글 없음", complNo));
		return compl;
	}

	@Override
	public ComplboardVO showComplEmp(ComplboardVO com) {
		return complDAO.selectComplEmp(com);
	}

	@Override
	public List<ComplboardVO> myComplList(String empCd) {
		return complDAO.myComplBoardList(empCd);
	}

	public ComplboardVO complAuthenicate(ComplboardVO compl) {
		ComplboardVO saved = complDAO.selectCompl(compl.getComplNo());
		if(encoder.matches(compl.getEmpPw(), saved.getEmpPw())) {
			return saved;
		}else {
			return null;
		}
	}
	
	@Override
	public boolean removeCompl(ComplboardVO compl) {
		ComplboardVO saved = complAuthenicate(compl);
		boolean success = false;
		if(saved != null) {
			success = complDAO.deleteCompl(compl) > 0;
		}
		return success;
	}

	@Override
	public boolean modifyCompl(ComplboardVO compl) {
		return complDAO.updateCompl(compl) > 0;
	}
	
	

}
