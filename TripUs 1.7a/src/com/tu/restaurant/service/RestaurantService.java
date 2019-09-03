package com.tu.restaurant.service;


import java.util.List;

import com.tu.restaurant.vo.TurtcommVO;
import com.tu.restaurantboard.vo.TurbboardVO;

/**
파일명: RestaurantService
설 명: 맛집 메인, 세부페이지를 위한 서비스 인터페이스
작성일: 2019/8/26
작성자: LHJ
*/
public interface RestaurantService {

	public List<TurtcommVO> listrescomment(TurtcommVO param);
	public List<TurbboardVO> selectseasonbesthit();
	public int insertrescomment(TurtcommVO param);
	
}
