package com.tu.restaurantboard.dao;

import java.util.List;

import com.tu.restaurantboard.vo.TurbboardVO;
import com.tu.restaurantboard.vo.TurccommVO;

public interface RestaurantBoardMapper {

	public List<TurbboardVO> listResBoard(TurbboardVO param);
	public int insertresBoard(TurbboardVO param);
	public int addHitCount(TurbboardVO param);
	public int updateResBoard(TurbboardVO param);
	public int deleteResBoard(TurbboardVO param);
}
