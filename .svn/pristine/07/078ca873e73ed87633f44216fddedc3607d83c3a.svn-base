package kr.or.ddit.edApproval.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.atch.service.AtchFileService;
import kr.or.ddit.atch.vo.AtchFileDetailVO;
import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.edApproval.dao.SignpathDAO;
import kr.or.ddit.edApproval.vo.SignImgVO;
import kr.or.ddit.edApproval.vo.SignpathEmpVO;
import kr.or.ddit.edApproval.vo.SignpathVO;
import kr.or.ddit.edDocument.vo.DocumentVO;
import kr.or.ddit.pagingVO.PaginationInfo;

@Service
public class SignpathServiceImpl implements SignpathService{
	
	
	@Inject
	private AtchFileService atchService;

	@Value("#{appInfo.documentFilePath}")
	private Resource atchPath;
	
	/**
	 * 도장 사진 등록  
	 * 
	 * @param board
	 */
	private void processAtchFileGroup(SignImgVO signImg) {
		MultipartFile[] documentFiles = signImg.getSignImgFiles();
		if (documentFiles == null)
			return;
		List<AtchFileDetailVO> detailList = new ArrayList<>();
		for (MultipartFile documentFile : documentFiles) {
			if (documentFile.isEmpty())
				continue;
			detailList.add(new AtchFileDetailVO(documentFile));
		}

		if (detailList.size() > 0) {
			AtchFileVO fileGroup = new AtchFileVO();
			fileGroup.setDetailList(detailList);
			try {
				// 1. 첨부파일의 메타 데이터 저장
				// 2. 첨부파일의 2진 데이터 저장
				int atchNo = atchService.createAtchFileGroup(fileGroup, atchPath);
				signImg.setAtchNo(atchNo);
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}

	}
	
	@Inject
	private SignpathDAO signpathDao;
	
	@Override
	public List<SignpathVO> retrieveSignpathList(PaginationInfo<SignpathVO> paging) {
		long totalRecord = signpathDao.selectTotalSignpath(paging);
		paging.setTotalRecord(totalRecord);
		return signpathDao.selectSignpathList(paging);
	}

	@Override
	public boolean createSignImg(SignImgVO signImg) {
		// 결재도장이 있다면
		if(signpathDao.selectSignImg(signImg)!=null) {
			signpathDao.updateSignpathImg(signImg);
		}
		
		processAtchFileGroup(signImg);
		int result = signpathDao.insertSignImg(signImg);
		return result>0;
	}

	@Override
	public List<AtchFileDetailVO> retrieveAtchFile(AtchFileVO atchFileVO) {
		return signpathDao.selectAtchFile(atchFileVO);
	}

	@Override
	public boolean modifySignpathEmpRead(SignpathEmpVO signpathEmp) {
		return signpathDao.updateSignpathEmpRead(signpathEmp)>0;
	}

}
