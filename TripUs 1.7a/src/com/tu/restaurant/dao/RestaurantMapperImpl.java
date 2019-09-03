package com.tu.restaurant.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.tu.restaurant.vo.TurtcommVO;
import com.tu.restaurantboard.vo.TurbboardVO;


public class RestaurantMapperImpl extends SqlSessionDaoSupport implements RestaurantMapper{

	private final String PACKAGE_PATH = "mybatis.query.RestaurantDAO";
	
	@Override
	public List<TurtcommVO> listrescomment(TurtcommVO param){
		
		return getSqlSession().selectList(PACKAGE_PATH+"listrescomment");
	}
	
	public List<TurbboardVO> selectseasonbesthit(){
		
		return getSqlSession().selectList(PACKAGE_PATH+"selectseasonbesthit");
	}

	public int insertrescomment(TurtcommVO param){

		return (int)getSqlSession().insert(PACKAGE_PATH+"insertrescomment");
	}
	
}
