package com.tu.restaurantboard.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tu.restaurantboard.dao.RestaurantBoardCommMapper;
import com.tu.restaurantboard.vo.TurccommVO;

@Service
@Transactional
public class RestaurantBoardCommServiceImpl implements RestaurantBoardCommService {

	@Autowired
	private RestaurantBoardCommMapper restaurantBoardCommMapper;
	
	public List<TurccommVO>listResBoardComm(TurccommVO param){
		
		List<TurccommVO> list=new ArrayList<TurccommVO>();
		list=restaurantBoardCommMapper.listResBoardComm(param);
		
		return list;
	}

	@Override
	public int insertResBoardComm(TurccommVO param) {
		return restaurantBoardCommMapper.insertResBoardComm(param);
	}

	@Override
	public int updateResBoardComm(TurccommVO param) {
		return restaurantBoardCommMapper.updateResBoardComm(param);
	}

	@Override
	public int deleteResBoardComm(TurccommVO param) {
		return restaurantBoardCommMapper.deleteResBoardComm(param);
	}
}
