package com.tu.myfavorite.dao;




import java.util.List;

import com.tu.myfavorite.vo.MyFavoriteVO;
/**
 Ŭ������ : MyFavoriteMapper
 �� ¥ : 2019-09-05
 �ۼ��ڸ� : LHJ
 */
public interface MyFavoriteMapper {
	public List<MyFavoriteVO> listMyFavorite(MyFavoriteVO param);
	public List<MyFavoriteVO> selectMyFavorite(MyFavoriteVO param);
	public int insertMyFavorite(MyFavoriteVO param);
	public int deleteMyFavorite(MyFavoriteVO param);
}
