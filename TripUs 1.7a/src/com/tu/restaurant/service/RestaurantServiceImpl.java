package com.tu.restaurant.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tu.restaurant.dao.RestaurantMapper;
import com.tu.restaurant.vo.TurtcommVO;
import com.tu.restaurantboard.vo.TurbboardVO;



/**
파일명: RestaurantServiceImpl
설 명: 맛집 메인, 세부페이지를 위한 서비스 Impl
작성일: 2019/8/26
작성자: LHJ
*/
@Service
@Transactional
public class RestaurantServiceImpl implements RestaurantService {

	@Autowired
	private RestaurantMapper restaurantMapper;
	
	@Override
	public List<TurtcommVO> listResComment(TurtcommVO param){
		
		List<TurtcommVO> list= new ArrayList<TurtcommVO>();
		list=restaurantMapper.listResComment(param);
		return list;
	}


	public List<TurbboardVO> selectSeasonBestHit(){
		List<TurbboardVO> list=new ArrayList<TurbboardVO>();
		list=restaurantMapper.selectSeasonBestHit();
		
		return list;
	}
	
	public int insertResComm(TurtcommVO param){
		
		return restaurantMapper.insertResComm(param);
	}

	@Override
	public int updateResComm(TurtcommVO param) {
		return restaurantMapper.updateResComm(param);
	}

	@Override
	public int deleteResComm(TurtcommVO param) {
		return restaurantMapper.deleteResComm(param);
	}
}
