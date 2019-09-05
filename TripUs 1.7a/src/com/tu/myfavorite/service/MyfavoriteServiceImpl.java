package com.tu.myfavorite.service;


import java.util.List;

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
