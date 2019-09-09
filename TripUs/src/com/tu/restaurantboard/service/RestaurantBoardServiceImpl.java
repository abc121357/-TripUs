package com.tu.restaurantboard.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tu.restaurantboard.dao.RestaurantBoardDAO;
import com.tu.restaurantboard.vo.TurbboardVO;


@Service
@Transactional
public class RestaurantBoardServiceImpl implements RestaurantBoardService{

	@Autowired
	private RestaurantBoardDAO restaurantBoardDAO;
	
	public List<TurbboardVO>listResBoardList(TurbboardVO param){
	
		System.out.println("Service의 listresBoardList 진입");
		List<TurbboardVO> list =new ArrayList<TurbboardVO>();
		list= restaurantBoardDAO.listResBoard(param);
		return list;
		
		
	}
	@Override
	public int addHitCount(TurbboardVO param) {
		return restaurantBoardDAO.addHitCount(param);
	}

	@Override
	public int insertResBoard(TurbboardVO param){
		return restaurantBoardDAO.insertresBoard(param);
	};

	@Override
	public int updateResBoard(TurbboardVO param){

		return restaurantBoardDAO.updateResBoard(param);

	}

	@Override
	public int deleteResBoard(TurbboardVO param) {
		return restaurantBoardDAO.deleteResBoard(param);
	}
}
