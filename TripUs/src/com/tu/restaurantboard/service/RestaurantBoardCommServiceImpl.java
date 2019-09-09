package com.tu.restaurantboard.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tu.restaurantboard.dao.RestaurantBoardCommDAO;
import com.tu.restaurantboard.vo.TurccommVO;

@Service
@Transactional
public class RestaurantBoardCommServiceImpl implements RestaurantBoardCommService {

	@Autowired
	private RestaurantBoardCommDAO restaurantBoardCommDAO;
	
	public List<TurccommVO>listResBoardComm(TurccommVO param){
		
		List<TurccommVO> list=new ArrayList<TurccommVO>();
		list=restaurantBoardCommDAO.listResBoardComm(param);
		
		return list;
	}

	@Override
	public int insertResBoardComm(TurccommVO param) {
		return restaurantBoardCommDAO.insertResBoardComm(param);
	}

	@Override
	public int updateResBoardComm(TurccommVO param) {
		return restaurantBoardCommDAO.updateResBoardComm(param);
	}

	@Override
	public int deleteResBoardComm(TurccommVO param) {
		return restaurantBoardCommDAO.deleteResBoardComm(param);
	}
}
