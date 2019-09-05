package com.tu.myfavorite.dao;




import java.util.List;

import com.tu.myfavorite.vo.MyFavoriteVO;
/**
 클래스명 : MyFavoriteMapper
 날 짜 : 2019-09-05
 작성자명 : LHJ
 */
public interface MyFavoriteMapper {
	public List<MyFavoriteVO> listMyFavorite(MyFavoriteVO param);
	public List<MyFavoriteVO> selectMyFavorite(MyFavoriteVO param);
	public int insertMyFavorite(MyFavoriteVO param);
	public int deleteMyFavorite(MyFavoriteVO param);
}
