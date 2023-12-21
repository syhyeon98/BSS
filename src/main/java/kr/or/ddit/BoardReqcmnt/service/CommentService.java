package kr.or.ddit.BoardReqcmnt.service;

import java.util.List;

import kr.or.ddit.BoardReq.vo.ReqboardVO;
import kr.or.ddit.BoardReqcmnt.vo.CmntVO;

public interface CommentService {
	
    public boolean createComment(CmntVO comment);
    
    public List<CmntVO> getCommentsByReqNo(int reqNo);
    
    public CmntVO retrieveComment(int rcnmtNp);
    
    public boolean modifyComment(CmntVO comment);
    
    public boolean deleteComment(CmntVO comment);

	public boolean deleteCommentAll(ReqboardVO reqNo);
	
}