package com.tu.myfavorite.dao;




import java.util.List;

import com.tu.myfavorite.vo.MyFavoriteVO;

public interface MyfavoriteMapper {

	public MyFavoriteVO selectMyFavorite(String mygrade);
	public int insertMyFavorite(MyFavoriteVO param);
	public int deleteMyFavorite(MyFavoriteVO param);
}
