package com.tu.restaurantboard.dao;

import java.util.List;

import com.tu.restaurantboard.vo.TurbboardVO;
import com.tu.restaurantboard.vo.TurccommVO;

public interface RestaurantBoardCommMapper {

	public List<TurccommVO> listresBoardComm(TurccommVO param);
	
}
