package com.tu.toboard.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.tu.toboard.dao.ToBoardMapper;
import com.tu.toboard.vo.ToBoardVO;

public class ToBoardMapperImpl extends SqlSessionDaoSupport implements ToBoardMapper{
 
	private final String PACKAGE_PATH = "mybatis.query.ToBoardDAO";
	
	@Override
	public List<ToBoardVO> selectContentID(ToBoardVO cvo){
		return getSqlSession().selectOne(PACKAGE_PATH+"selectContentID");
	}
	@Override
	public List<ToBoardVO> toBoardList(ToBoardVO cvo){
		return getSqlSession().selectList(PACKAGE_PATH+"toBoardList");
	}
}
