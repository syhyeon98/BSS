package kr.or.ddit.BoardReqcmnt.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.or.ddit.BoardReq.dao.ReqboardDAO;
import kr.or.ddit.BoardReq.vo.ReqboardVO;
import kr.or.ddit.BoardReqcmnt.dao.CommentDAO;
import kr.or.ddit.BoardReqcmnt.vo.CmntVO;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentDAO commentDAO;
    
    @Inject
    private ReqboardDAO reqDAO;
    
    @Inject
	private PasswordEncoder encoder;

    @Override
    public boolean createComment(CmntVO comment) {
    	boolean success = commentDAO.insertComment(comment) > 0;
    	if(success) {
    		reqDAO.updateReqCmnt(comment);
    	}
        return success;
    }

    @Override
    public List<CmntVO> getCommentsByReqNo(int reqNo) {
        return commentDAO.selectCommentsByReqNo(reqNo);
    }
    
    @Override
	public CmntVO retrieveComment(int rcnmtNp) {
		return commentDAO.selectComment(rcnmtNp);
	}

	@Override
	public boolean modifyComment(CmntVO comment) {
 		return commentDAO.updateComment(comment) > 0;
	}
	
	
	private CmntVO commentAuthenticate(CmntVO comment) {
		CmntVO saved = commentDAO.selectComment(comment.getRcnmtNo());
		if(encoder.matches(comment.getEmpPw(), saved.getEmpPw())) {
			return saved;
		}else {
			return null;
		}
	}

	@Override
	public boolean deleteComment(CmntVO comment) {
		CmntVO saved = commentAuthenticate(comment);
		boolean success = false;
		if(saved != null) {
			success = commentDAO.deleteComment(comment) > 0;
		}
		return success;
	}

	@Override
	public boolean deleteCommentAll(ReqboardVO reqNo) {
		return commentDAO.delectCommentAll(reqNo) > 0;
	}
	
}