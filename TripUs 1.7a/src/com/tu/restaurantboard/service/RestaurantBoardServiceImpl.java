package com.tu.restaurantboard.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tu.restaurant.vo.TurtcommVO;
import com.tu.restaurantboard.dao.RestaurantBoardMapper;
import com.tu.restaurantboard.vo.TurbboardVO;
import com.tu.restaurantboard.vo.TurccommVO;


@Service
@Transactional
public class RestaurantBoardServiceImpl implements RestaurantBoardService{

	@Autowired
	private RestaurantBoardMapper restaurantBoardMapper;
	
	public List<TurbboardVO>listResBoardList(TurbboardVO param){
	
		System.out.println("Service의 listresBoardList 진입");
		List<TurbboardVO> list =new ArrayList<TurbboardVO>();
		list=restaurantBoardMapper.listResBoard(param);
		return list;
		
		
	}
	@Override
	public int addHitCount(TurbboardVO param) {
		return restaurantBoardMapper.addHitCount(param);
	}

	@Override
	public int insertResBoard(TurbboardVO param){
		return restaurantBoardMapper.insertresBoard(param);
	};

	@Override
	public int updateResBoard(TurbboardVO param){

		return restaurantBoardMapper.updateResBoard(param);

	}

	@Override
	public int deleteResBoard(TurbboardVO param) {
		return restaurantBoardMapper.deleteResBoard(param);
	}
}
