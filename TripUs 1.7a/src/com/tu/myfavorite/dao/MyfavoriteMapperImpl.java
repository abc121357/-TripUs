package com.tu.myfavorite.dao;



import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.tu.myfavorite.vo.MyFavoriteVO;



public class MyfavoriteMapperImpl extends SqlSessionDaoSupport implements MyfavoriteMapper{

	
	private final String PACKAGE_PATH = "mybatis.query.myfavoriteDAO";
	
	@Override
	public List<MyFavoriteVO> selectMyFavorite(MyFavoriteVO param){
		
		return getSqlSession().selectList(PACKAGE_PATH + "selectMyFavorite");
	}
	
	public int insertMyFavorite(MyFavoriteVO param){
	
		return (int)getSqlSession().insert(PACKAGE_PATH + "inserMyFavorite");
	}
	
	public int deleteMyFavorite(MyFavoriteVO param){
		return (int)getSqlSession().delete(PACKAGE_PATH+ "deleteMyFavorite");
	}
}
