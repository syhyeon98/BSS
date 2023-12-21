package kr.or.ddit.edDocument.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.edDocument.dao.MyDocumentDAO;
import kr.or.ddit.edDocument.vo.DocumentVO;
import kr.or.ddit.pagingVO.PaginationInfo;

@Service
public class MyDocumentServiceImpl implements MyDocumentService {
	
	@Inject
	private MyDocumentDAO myDocDao;
	
	@Override
	public List<DocumentVO> retrieveDocumentList(PaginationInfo<DocumentVO> paging) {
		long totalRecord = myDocDao.selectTotalConditionDocument(paging);
		paging.setTotalRecord(totalRecord);
		return myDocDao.selectDocumentList(paging);
	}

}
