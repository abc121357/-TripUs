package com.tu.myfavorite.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tu.myfavorite.dao.MyFavoriteMapper;
import com.tu.myfavorite.vo.MyFavoriteVO;
/**
 클래스명 : MyFavoriteServiceImpl
 날 짜 : 2019-09-05
 작성자명 : LHJ
 */
@Service
@Transactional
public class MyFavoriteServiceImpl implements MyFavoriteService {

	@Autowired
	private MyFavoriteMapper myfavoriteMapper;

	public List<MyFavoriteVO>listMyFavorite(MyFavoriteVO param){
		return myfavoriteMapper.listMyFavorite(param);
	}

	public List<MyFavoriteVO> selectMyFavorite(MyFavoriteVO param){
		
		
		return myfavoriteMapper.selectMyFavorite(param);
		
	}
	
	public int insertMyFavorite(MyFavoriteVO param){
		
		
		return myfavoriteMapper.insertMyFavorite(param);
		
	}
	
	public int deleteMyFavorite(MyFavoriteVO param){
		
		return myfavoriteMapper.deleteMyFavorite(param);
		
	}
}
