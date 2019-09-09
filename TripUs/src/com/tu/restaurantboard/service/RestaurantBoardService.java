package com.tu.restaurantboard.service;

import java.util.List;

import com.tu.restaurant.vo.TurtcommVO;
import com.tu.restaurantboard.vo.TurbboardVO;
import com.tu.restaurantboard.vo.TurccommVO;

public interface RestaurantBoardService {
	public List<TurbboardVO>listResBoardList(TurbboardVO param);
	public int insertResBoard(TurbboardVO param);
	public int addHitCount(TurbboardVO param);
	public int updateResBoard(TurbboardVO param);
	public int deleteResBoard(TurbboardVO param);
}
