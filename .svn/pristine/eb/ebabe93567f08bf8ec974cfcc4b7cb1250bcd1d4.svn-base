package kr.or.ddit.business.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.business.dao.BusinessDAO;
import kr.or.ddit.business.vo.BusinessVO;

@Service
public class BusinessServiceImpl implements BusinessService {

	@Inject
	private BusinessDAO busDAO;
	
	@Override
	public boolean createBusiness(BusinessVO business) {
		int cnt = 0;
		
			if(business.getBusCd() == "") {
				return false;
			}
			cnt = busDAO.insertBusiness(business);
		
		return cnt > 0;
	}

}
