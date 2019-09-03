package com.tu.myfavorite.service;


import com.tu.myfavorite.vo.MyFavoriteVO;

public interface MyfavoriteService {

	public MyFavoriteVO selectMyFavorite(String mygrade);
	public int insertMyFavorite(MyFavoriteVO param);
	public int deleteMyFavorite(MyFavoriteVO param);
}
