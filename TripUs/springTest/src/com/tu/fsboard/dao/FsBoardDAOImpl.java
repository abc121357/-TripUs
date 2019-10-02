package com.tu.fsboard.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.tu.fsboard.dao.FsBoardDAO;
import com.tu.fsboard.vo.FsBoardVO;

public class FsBoardDAOImpl extends SqlSessionDaoSupport implements FsBoardDAO{
 
	private final String PACKAGE_PATH = "mybatis.query.FsBoardMapper";
	
	@Override
	public List<FsBoardVO> selectContentID(FsBoardVO fvo){
		return getSqlSession().selectOne(PACKAGE_PATH+"selectContentID");
	}
	@Override
	public List<FsBoardVO> fsBoardList(FsBoardVO fvo){
		return getSqlSession().selectList(PACKAGE_PATH+"fsBoardList");
	}
}
