package com.tu.restaurant.dao;

import java.util.List;

import com.tu.restaurant.vo.TurtcommVO;
import com.tu.restaurantboard.vo.TurbboardVO;

public interface RestaurantMapper {

	public List<TurtcommVO> listResComment(TurtcommVO param);
	public List<TurbboardVO> selectSeasonBestHit();
	public int insertResComm(TurtcommVO param);
	public int updateResComm(TurtcommVO param);
	public int deleteResComm(TurtcommVO param);
}
