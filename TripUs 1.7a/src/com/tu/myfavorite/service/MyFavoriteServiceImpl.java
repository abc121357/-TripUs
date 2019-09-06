package com.tu.myfavorite.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tu.myfavorite.dao.MyFavoriteDAO;
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
	private MyFavoriteDAO myfavoriteDAO;

	public List<MyFavoriteVO>listMyFavorite(MyFavoriteVO param){
		return myfavoriteDAO.listMyFavorite(param);
	}

	public List<MyFavoriteVO> selectMyFavorite(MyFavoriteVO param){
		
		
		return myfavoriteDAO.selectMyFavorite(param);
		
	}
	
	public int insertMyFavorite(MyFavoriteVO param){
		
		
		return myfavoriteDAO.insertMyFavorite(param);
		
	}
	
	public int deleteMyFavorite(MyFavoriteVO param){
		
		return myfavoriteDAO.deleteMyFavorite(param);
	}
	
}