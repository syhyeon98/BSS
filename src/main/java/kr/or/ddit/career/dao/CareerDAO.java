package kr.or.ddit.career.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.career.vo.CareerVO;

@Mapper
public interface CareerDAO {
	
	public int insertCareer(CareerVO career);	
	public int upInsertCareer(CareerVO career);
	public List<CareerVO> selectCareer(String empCd);
}
