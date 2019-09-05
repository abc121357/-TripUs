package com.tu.myfavorite.service;


import java.util.List;

import com.tu.myfavorite.vo.MyFavoriteVO;

public interface MyfavoriteService {

	public List<MyFavoriteVO> listMyFavorite(MyFavoriteVO param);
	public List<MyFavoriteVO> selectMyFavorite(MyFavoriteVO param);
	public int insertMyFavorite(MyFavoriteVO param);
	public int deleteMyFavorite(MyFavoriteVO param);
}
