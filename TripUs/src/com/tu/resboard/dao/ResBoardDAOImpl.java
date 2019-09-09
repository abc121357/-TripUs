package com.tu.resboard.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.tu.resboard.dao.ResBoardDAO;
import com.tu.resboard.vo.ResBoardVO;

public class ResBoardDAOImpl extends SqlSessionDaoSupport implements ResBoardDAO{
 
	private final String PACKAGE_PATH = "mybatis.query.ResBoardMapper";
	
	@Override
	public List<ResBoardVO> selectContentID(ResBoardVO cvo){
		return getSqlSession().selectOne(PACKAGE_PATH+"selectContentID");
	}
	@Override
	public List<ResBoardVO> resBoardList(ResBoardVO cvo){
		return getSqlSession().selectList(PACKAGE_PATH+"resBoardList");
	}
}
