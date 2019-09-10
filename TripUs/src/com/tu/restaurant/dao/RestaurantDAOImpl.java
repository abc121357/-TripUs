package com.tu.restaurant.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.tu.restaurant.vo.TurtcommVO;
import com.tu.restaurantboard.vo.TurbboardVO;


public class RestaurantDAOImpl extends SqlSessionDaoSupport implements RestaurantDAO {

	private final String PACKAGE_PATH = "mybatis.query.RestaurantMapper";
	
	@Override
	public List<TurtcommVO> listResComm(TurtcommVO param){
		
		return getSqlSession().selectList(PACKAGE_PATH+"listResComm");
	}
	
	public List<TurbboardVO> selectSeasonBestHit(){
		
		return getSqlSession().selectList(PACKAGE_PATH+"selectSeasonBestHit");
	}

	public int insertResComm(TurtcommVO param){

		return (int)getSqlSession().insert(PACKAGE_PATH+"insertResComm");
	}

	@Override
	public int updateResComm(TurtcommVO param) {
		return (int)getSqlSession().update(PACKAGE_PATH+"updateResComm");
	}

	@Override
	public int deleteResComm(TurtcommVO param) {
		return getSqlSession().delete(PACKAGE_PATH+"deleteResComm");
	}
}
