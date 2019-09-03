package com.tu.restaurantboard.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.tu.restaurantboard.vo.TurccommVO;

public class RestaurantBoardCommMapperImpl extends SqlSessionDaoSupport implements RestaurantBoardCommMapper{

	private final String PACKAGE_PATH="mybatis.query.RestaurantBoardCommDAO.";
	
	@Override
	public List<TurccommVO> listresBoardComm(TurccommVO param){
		
		return getSqlSession().selectList(PACKAGE_PATH+"listresBoardcomm");
	}
	
}
