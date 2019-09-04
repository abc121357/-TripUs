package com.tu.restaurantboard.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.tu.restaurantboard.vo.TurccommVO;

public class RestaurantBoardCommMapperImpl extends SqlSessionDaoSupport implements RestaurantBoardCommMapper{

	private final String PACKAGE_PATH="mybatis.query.RestaurantBoardCommDAO.";
	
	@Override
	public List<TurccommVO> listResBoardComm(TurccommVO param){
		
		return getSqlSession().selectList(PACKAGE_PATH+"listResBoardcomm");
	}

	@Override
	public int insertResBoardComm(TurccommVO param) {
		return getSqlSession().insert(PACKAGE_PATH+"insertResBoardComm");
	}

	@Override
	public int updateResBoardComm(TurccommVO param) {
		return getSqlSession().update(PACKAGE_PATH+"updateResBoardComm");
	}

	@Override
	public int deleteResBoardComm(TurccommVO param) {
		return getSqlSession().update(PACKAGE_PATH+"deleteResBoardComm");
	}
}
