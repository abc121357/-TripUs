package com.tu.coboard.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.tu.coboard.dao.CoBoardMapper;
import com.tu.coboard.vo.CoBoardVO;

public class CoBoardMapperImpl extends SqlSessionDaoSupport implements CoBoardMapper{
 
	private final String PACKAGE_PATH = "mybatis.query.CoBoardDAO";
	
	@Override
	public List<CoBoardVO> selectContentID(CoBoardVO cvo){
		return getSqlSession().selectOne(PACKAGE_PATH+"selectContentID");
	}
	@Override
	public List<CoBoardVO> coBoardList(CoBoardVO cvo){
		return getSqlSession().selectList(PACKAGE_PATH+"coBoardList");
	}
}
