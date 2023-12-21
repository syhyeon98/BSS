package kr.or.ddit.career.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.career.dao.CareerDAO;
import kr.or.ddit.career.vo.CareerVO;

@Service
public class CareerServiceImpl implements CareerService {

	@Inject
	CareerDAO carDAO;

	@Override
	public boolean createCareer(List<CareerVO> careerList) {
		int cnt = 0;
		for (CareerVO career : careerList) {
			if (career.getCarNm() == "" && career.getCarPo() == "" && career.getCarDate() == null) {
				return false;
			}
			cnt += carDAO.insertCareer(career);
		}
		return cnt > 0;
	}

	@Override
	public List<CareerVO> retrieveCarList(String empCd) {
		return carDAO.selectCareer(empCd);
	}

	@Override
	public boolean upCreateCarreer(List<CareerVO> careerList) {
		int cnt = 0;
		for (CareerVO career : careerList) {
			if (career.getCarNm() == "" && career.getCarPo() == "" && career.getCarDate() == null) {
				return false;
			}
			cnt += carDAO.upInsertCareer(career);
		}
		return cnt > 0;
	}

}