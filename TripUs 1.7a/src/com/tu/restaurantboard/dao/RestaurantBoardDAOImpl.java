package com.tu.restaurantboard.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.tu.restaurantboard.vo.TurbboardVO;

public class RestaurantBoardDAOImpl extends SqlSessionDaoSupport implements RestaurantBoardDAO {

	private final String PACKAGE_PATH = "mybatis.query.RestaurantBoardMapper.";
	
	@Override
	public List<TurbboardVO> listResBoard(TurbboardVO param){
		
		System.out.println("Mapper의 listresBoardList 진입");
		return getSqlSession().selectList(PACKAGE_PATH+"listresBoard");
	}
	
	@Override
	public int insertresBoard(TurbboardVO param)
	{
		return (int)getSqlSession().insert(PACKAGE_PATH+"insertresBoard");
	}

	@Override
	public int addHitCount(TurbboardVO param) {
		return (int)getSqlSession().update(PACKAGE_PATH+"addHitCount");
	}

	@Override
	public int updateResBoard(TurbboardVO param) {
		return (int)getSqlSession().update(PACKAGE_PATH+"updateResBoard");
	}

	@Override
	public int deleteResBoard(TurbboardVO param) {
		return (int)getSqlSession().update(PACKAGE_PATH+"deleteResBoard");
	}
}
