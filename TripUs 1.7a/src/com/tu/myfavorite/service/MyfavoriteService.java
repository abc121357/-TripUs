package com.tu.myfavorite.service;


import java.util.List;

import com.tu.myfavorite.vo.MyFavoriteVO;
/**
 Ŭ������ : MyFavoriteService
 �� ¥ : 2019-09-05
 �ۼ��ڸ� : LHJ
 */
public interface MyFavoriteService {

	public List<MyFavoriteVO> listMyFavorite(MyFavoriteVO param);
	public List<MyFavoriteVO> selectMyFavorite(MyFavoriteVO param);
	public int insertMyFavorite(MyFavoriteVO param);
	public int deleteMyFavorite(MyFavoriteVO param);
}