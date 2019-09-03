package com.tu.restaurant.dao;

import java.util.List;

import com.tu.restaurant.vo.TurtcommVO;
import com.tu.restaurantboard.vo.TurbboardVO;

public interface RestaurantMapper {

	public List<TurtcommVO> listrescomment(TurtcommVO param);
	public List<TurbboardVO> selectseasonbesthit();
	public int insertrescomment(TurtcommVO param);
	
}
