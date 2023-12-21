package kr.or.ddit.position.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.position.vo.PositionVO;

@Mapper
public interface PositionDAO {
	
	public List<PositionVO> poList();
	
	public int insertPosition(PositionVO position);
}
