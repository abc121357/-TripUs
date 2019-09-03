package com.tu.myfavorite.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tu.myfavorite.dao.MyfavoriteMapper;
import com.tu.myfavorite.vo.MyFavoriteVO;

@Service
@Transactional
public class MyfavoriteServiceImpl implements MyfavoriteService{

	@Autowired
	private MyfavoriteMapper myfavoriteMapper;
	
	public MyFavoriteVO selectMyFavorite(String mygrade){
		
		
		return myfavoriteMapper.selectMyFavorite(mygrade);
		
	}
	
	public int insertMyFavorite(MyFavoriteVO param){
		
		
		return myfavoriteMapper.insertMyFavorite(param);
		
	}
	
	public int deleteMyFavorite(MyFavoriteVO param){
		
		return myfavoriteMapper.deleteMyFavorite(param);
		
	}
}
