package com.tu.myfavorite.dao;



import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.tu.myfavorite.vo.MyFavoriteVO;



public class MyfavoriteMapperImpl extends SqlSessionDaoSupport implements MyfavoriteMapper{

	
	private final String PACKAGE_PATH = "mybatis.query.myfavoriteDAO";
	
	@Override
	public MyFavoriteVO selectMyFavorite(String mygrade){
		
		return (MyFavoriteVO)getSqlSession().selectOne(PACKAGE_PATH + "selectmyfavorite");
	}
	
	public int insertMyFavorite(MyFavoriteVO param){
	
		return (int)getSqlSession().insert(PACKAGE_PATH + "inserMyFavorite");
	}
	
	public int deleteMyFavorite(MyFavoriteVO param){
		return (int)getSqlSession().delete(PACKAGE_PATH+ "deleteMyFavorite");
	}
}
