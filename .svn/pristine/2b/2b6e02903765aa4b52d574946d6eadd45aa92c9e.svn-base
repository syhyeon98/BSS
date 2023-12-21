package kr.or.ddit.BoardReq.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import kr.or.ddit.BoardReq.dao.ReqboardDAO;
import kr.or.ddit.BoardReq.vo.ReqboardVO;
import kr.or.ddit.BoardReqcmnt.dao.CommentDAO;
import kr.or.ddit.BoardReqcmnt.vo.CmntVO;
import kr.or.ddit.pagingVO.PaginationInfo;

@Service
public class ReqboardServiceImpl implements ReqboardSerivce {

	@Inject
	private ReqboardDAO reqDAO;
	@Inject
	private CommentDAO comDAO;
	@Inject
	private PasswordEncoder encoder;

	@Override
	public List<ReqboardVO> retrieveReqList(PaginationInfo<ReqboardVO> paging) {
		long totalRecord = reqDAO.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return reqDAO.selectReqList(paging);
	}

	@Override
	public ReqboardVO retrieveReq(int req) {
		return reqDAO.selectReq(req);
	}

	@Override
	public boolean createReq(ReqboardVO reqNo) {
		return reqDAO.insertReq(reqNo) > 0;
	}

	private ReqboardVO reqAuthenticate(ReqboardVO req) {
		ReqboardVO saved = reqDAO.selectReq(req.getReqNo());
		if (encoder.matches(req.getEmpPw(), saved.getEmpPw())) {
			return saved;
		} else {
			return null;
		}
	}

	@Override
	public boolean delete(ReqboardVO reqNo) {
		ReqboardVO saved = reqAuthenticate(reqNo);
		boolean success = false;
		if(saved != null) {
			success = reqDAO.deleteReq(reqNo) > 0;
			success &= comDAO.delectCommentAll(reqNo) > 0;
		}
		return success;
	}

	@Override
	public boolean modifyReq(ReqboardVO reqVO) {
		return reqDAO.updateReq(reqVO) > 0;
	}

	@Override
	public List<ReqboardVO> myReqList(String empCd) {
		return reqDAO.myReqBoardList(empCd);
	}

	@Override
	public List<ReqboardVO> reqMainList() {
		return reqDAO.reqMainList();
	}

}
