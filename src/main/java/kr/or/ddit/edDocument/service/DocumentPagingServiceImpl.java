package kr.or.ddit.edDocument.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.department.vo.DepDocumentVO;
import kr.or.ddit.edDocument.dao.DocumentPagingDAO;
import kr.or.ddit.edDocument.vo.DocumentVO;
import kr.or.ddit.pagingVO.PaginationInfo;

@Service
public class DocumentPagingServiceImpl implements DocumentPagingService {

	@Inject
	private DocumentPagingDAO documentPagingDao;
	
	@Override
	public List<DocumentVO> retrieveReqDocumentList(PaginationInfo<DocumentVO> paging) {
		long totalRecord = documentPagingDao.selectTotalReqDocument(paging);
		paging.setTotalRecord(totalRecord);
		return documentPagingDao.selectReqDocumentList(paging);
	}

	@Override
	public List<DocumentVO> retrieveIngDocumentList(PaginationInfo<DocumentVO> paging) {
		long totalRecord = documentPagingDao.selectTotalIngDocument(paging);
		paging.setTotalRecord(totalRecord);
		return documentPagingDao.selectIngDocumentList(paging);
	}

	@Override
	public List<DocumentVO> retrieveWaitDocumentList(PaginationInfo<DocumentVO> paging) {
		long totalRecord = documentPagingDao.selectTotalWaitDocument(paging);
		paging.setTotalRecord(totalRecord);
		return documentPagingDao.selectWaitDocumentList(paging);
	}

	@Override
	public List<DocumentVO> retrieveRefDocumentList(PaginationInfo<DocumentVO> paging) {
		long totalRecord = documentPagingDao.selectTotalRefDocument(paging);
		paging.setTotalRecord(totalRecord);
		return documentPagingDao.selectRefDocumentList(paging);
	}

	@Override
	public List<DocumentVO> retrieveReturnDocumentList(PaginationInfo<DocumentVO> paging) {
		long totalRecord = documentPagingDao.selectTotalReturnDocument(paging);
		paging.setTotalRecord(totalRecord);
		return documentPagingDao.selectReturnDocumentList(paging);
	}

	@Override
	public List<DepDocumentVO> retrieveRegDocumentList(PaginationInfo<DepDocumentVO> paging) {
		long totalRecord = documentPagingDao.selectTotalRegDocument(paging);
		paging.setTotalRecord(totalRecord);
		return documentPagingDao.selectRegDocumentList(paging);
	}

}
