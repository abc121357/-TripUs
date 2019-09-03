package com.tu.restaurantboard.dao;

import java.util.List;

import com.tu.restaurantboard.vo.TurbboardVO;
import com.tu.restaurantboard.vo.TurccommVO;

public interface RestaurantBoardMapper {

	public List<TurbboardVO> listresBoard(TurbboardVO param);
	public int insertresBoard(TurbboardVO param);
}
