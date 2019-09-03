package com.tu.restaurantboard.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.tu.restaurantboard.vo.TurbboardVO;
import com.tu.restaurantboard.vo.TurccommVO;

public class RestaurantBoardMapperImpl extends SqlSessionDaoSupport implements RestaurantBoardMapper {

	private final String PACKAGE_PATH = "mybatis.query.RestaurantBoardDAO.";
	
	@Override
	public List<TurbboardVO> listresBoard(TurbboardVO param){
		
		System.out.println("Mapper의 listresBoardList 진입");
		return getSqlSession().selectList(PACKAGE_PATH+"listresBoard");
	}
	
	@Override
	public int insertresBoard(TurbboardVO param)
	{
		return (int)getSqlSession().insert(PACKAGE_PATH+"insertresBoard");
	}
}
