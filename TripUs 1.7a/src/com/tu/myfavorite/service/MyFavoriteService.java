package com.tu.myfavorite.service;


import java.util.List;

import com.tu.myfavorite.vo.MyFavoriteVO;
/**
 클래스명 : MyFavoriteService
 날 짜 : 2019-09-05
 작성자명 : LHJ
 */
public interface MyFavoriteService {

	public List<MyFavoriteVO> listMyFavorite(MyFavoriteVO param);
	public List<MyFavoriteVO> selectMyFavorite(MyFavoriteVO param);
	public int insertMyFavorite(MyFavoriteVO param);
	public int deleteMyFavorite(MyFavoriteVO param);
}