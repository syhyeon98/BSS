package kr.or.ddit.BoardReqcmnt.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.BoardReq.vo.ReqboardVO;
import kr.or.ddit.BoardReqcmnt.vo.CmntVO;

@Mapper
public interface CommentDAO {
	
    public int insertComment(CmntVO comment);
    
    public List<CmntVO> selectCommentsByReqNo(int reqNo);
    public CmntVO selectComment(int rcnmtNo);
    
    public int updateComment(CmntVO comment);
    public int deleteComment(CmntVO comment);
    public int delectCommentAll(ReqboardVO reqNo);

}