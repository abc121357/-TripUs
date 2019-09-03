package com.tu.restaurantboard.service;

import java.util.List;

import com.tu.restaurant.vo.TurtcommVO;
import com.tu.restaurantboard.vo.TurbboardVO;
import com.tu.restaurantboard.vo.TurccommVO;

public interface RestaurantBoardService {
	public List<TurbboardVO>listresBoardList(TurbboardVO param);
	public int insertresBoard(TurbboardVO param);
}
