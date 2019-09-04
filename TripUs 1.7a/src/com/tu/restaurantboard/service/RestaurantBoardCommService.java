package com.tu.restaurantboard.service;

import java.util.List;

import com.tu.restaurantboard.vo.TurbboardVO;
import com.tu.restaurantboard.vo.TurccommVO;

public interface RestaurantBoardCommService {

	public List<TurccommVO>listResBoardComm(TurccommVO param);
	public int insertResBoardComm(TurccommVO param);
	public int updateResBoardComm(TurccommVO param);
	public int deleteResBoardComm(TurccommVO param);

}
