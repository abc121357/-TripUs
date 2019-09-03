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
	
	public List<TurbboardVO>listresBoardList(TurbboardVO param){
	
		System.out.println("Service의 listresBoardList 진입");
		List<TurbboardVO> list =new ArrayList<TurbboardVO>();
		list=restaurantBoardMapper.listresBoard(param);
		return list;
		
		
	}
	public int insertresBoard(TurbboardVO param){
		return restaurantBoardMapper.insertresBoard(param);
	};
	
}
