package com.tu.faboard.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.tu.faboard.vo.FaVo;

public class FaBoardDaoImpl extends SqlSessionDaoSupport implements FaBoardDao {
	
	//constructor field
	private final String PAKAGE_PATH = "mybatis.query.FaBoardMapper";
	
	//full post page
	@Override
	public List<FaVo> faBoardList(FaVo fvo) {
		System.out.println("FaBoardDaoImpl.faBoardList SUCCESS >>> : ");
		return getSqlSession().selectList(PAKAGE_PATH + "faBoardList");
	}

	//insert Write Form page 
	@Override
	public FaVo faBoardSelect(FaVo fvo) {
		System.out.println("FaBoardDaoImpl.faBoardSelect SUCCESS >>> : ");
		return (FaVo)getSqlSession().selectOne(PAKAGE_PATH + "faBoardSelect");
	}

	//insert function 
	@Override
	public int faBoardInsert(FaVo fvo) {
		System.out.println("FaBoardDaoImpl.faBoardInsert SUCCESS >>> : ");
		return (int)getSqlSession().insert(PAKAGE_PATH + "faBoardInsert");
	}

	//update function
	@Override
	public int faBoardUpdate(FaVo fvo) {
		System.out.println("FaBoardDaoImpl.faBoardUpdate SUCCESS >>> : ");
		return (int)getSqlSession().update(PAKAGE_PATH + "faBoardUpdate");
	}

	//delete function
	@Override
	public int faBoardDelete(FaVo fvo) {
		System.out.println("FaBoardDaoImpl.faBoardDelete SUCCESS >>> : ");
		return (int)getSqlSession().delete(PAKAGE_PATH + "faBoardDelete");
	}

	//full post count
	@Override
	public int faBoardListCount() {
		System.out.println("FaBoardDaoImpl.faBoardListCount SUCCESS >>> : ");
		return (int)getSqlSession().selectOne(PAKAGE_PATH + "faBoardListCount");
	}
}