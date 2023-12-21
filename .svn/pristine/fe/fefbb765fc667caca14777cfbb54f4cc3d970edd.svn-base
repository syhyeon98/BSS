package kr.or.ddit.BoardNtc.service;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.BoardNtc.dao.NtcboardDAO;
import kr.or.ddit.BoardNtc.vo.NtcboardVO;
import kr.or.ddit.atch.service.AtchFileService;
import kr.or.ddit.atch.vo.AtchFileDetailVO;
import kr.or.ddit.atch.vo.AtchFileVO;
import kr.or.ddit.exception.PKNotFoundException;
import kr.or.ddit.pagingVO.PaginationInfo;

@Service
public class NtcboardServiceImpl implements NtcboardSerivce {

	@Inject
	private NtcboardDAO ntcDAO;
	@Inject
	private PasswordEncoder encoder;
	@Inject
	private AtchFileService atchService;
	@Value("#{appInfo.ntcBoard}")
	private Resource atchPath;

	
	private void processAtchFileGroup(NtcboardVO ntc) {
		MultipartFile[] boFiles = ntc.getBoFiles();
		if(boFiles == null) return;
		List<AtchFileDetailVO> detailList = new ArrayList<>();
		for(MultipartFile boFile : boFiles) {
			if(boFile.isEmpty()) continue;
			detailList.add(new AtchFileDetailVO(boFile) );
		}
		if(detailList.size() > 0) {
			AtchFileVO fileGroup = new AtchFileVO();
			fileGroup.setDetailList(detailList);
			try {
				//		1. 첨부파일의 메타 데이터 저장
				//		2. 첨부파일의 2진 데이터 저장
				int atchNo = atchService.createAtchFileGroup(fileGroup, atchPath);
				ntc.setAtchNo(atchNo);
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
	}
	
	
	@Override
	public NtcboardVO retrieveNtc(int ntcNo) throws PKNotFoundException {
		NtcboardVO ntc = ntcDAO.selectNtc(ntcNo);
		if (ntc == null)
			throw new PKNotFoundException(MessageFormat.format("{0} 해당 글 없음", ntcNo));
		return ntc;
	}

	@Override
	public List<NtcboardVO> retrieveNtcList(PaginationInfo<NtcboardVO> paging) {
		long totalRecord = ntcDAO.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return ntcDAO.selectNtcList(paging);
	}

	@Override
	public boolean modifyNtc(NtcboardVO ntc) {
		return ntcDAO.updateNtc(ntc) > 0;
	}

	@Override
	public boolean createNtc(NtcboardVO ntc) {
		processAtchFileGroup(ntc);
		return ntcDAO.insertNtc(ntc) > 0;
	}

	@Override
	public List<NtcboardVO> retrievemainNtcList() {
		return ntcDAO.mainNtcList();
	}

	private NtcboardVO ntcAuthenticate(NtcboardVO check) {
		NtcboardVO saved = ntcDAO.selectNtc(check.getNtcNo());
		if (encoder.matches(check.getEmpPw(), saved.getEmpPw())) {
			return saved;
		} else {
			return null;
		}
	}

	@Override
	public boolean removeNtc(NtcboardVO ntc) {
		NtcboardVO saved = ntcAuthenticate(ntc);
		boolean success = false;
		if (saved != null) {
			success = ntcDAO.deleteNtc(ntc) > 0;
		}
		return success;
	}


	@Override
	public List<AtchFileDetailVO> retrievemainNtcList(AtchFileVO atchFileVo) {
		return ntcDAO.selectNtcForm(atchFileVo);
	}
}
