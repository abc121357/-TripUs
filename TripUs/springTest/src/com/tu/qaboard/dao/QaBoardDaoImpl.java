package com.tu.qaboard.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.tu.qaboard.vo.QaBoardVo;

public class QaBoardDaoImpl extends SqlSessionDaoSupport implements QaBoardDao {

	//constructor field
	private final String PAKAGE_PATH = "mybatis.query.QaBoardMapper";

	//full post page
	@Override
	public List<QaBoardVo> qaBoardList(QaBoardVo qavo) {
		System.out.println("QaBoardDaoImpl.qaBoardList SUCCESS >>> : ");
		return getSqlSession().selectList(PAKAGE_PATH + "qaBoardList");
	}

	//insert function 
	@Override
	public int qaBoardInsert(QaBoardVo qavo) {
		System.out.println("QaBoardDaoImpl.qaBoardInsert SUCCESS >>> : ");
		return getSqlSession().insert(PAKAGE_PATH + "qaBoardInsert");
	}

	//detail page
	@Override
	public QaBoardVo qaBoardDetail(QaBoardVo qavo) {
		System.out.println("QaBoardDaoImpl.qaBoardDetail SUCCESS >>> : ");
		return (QaBoardVo)getSqlSession().selectOne(PAKAGE_PATH + "qaBoardDetail");
	}

	//update function
	@Override
	public int qaBoardUpdate(QaBoardVo qavo) {
		System.out.println("QaBoardDaoImpl.qaBoardUpdate SUCCESS >>> : ");
		return getSqlSession().update(PAKAGE_PATH + "qaBoardUpdate");
	}

	//delete function
	@Override
	public int qaBoardDelete(QaBoardVo qavo) {
		System.out.println("QaBoardDaoImpl.qaBoardDelete SUCCESS >>> : ");
		return getSqlSession().delete(PAKAGE_PATH + "qaBoardDelete");
	}

	//number of QANO max value 
	@Override
	public String qaBoardQaNoSelect() {
		System.out.println("QaBoardDaoImpl.qaBoardQaNoSelect SUCCESS >>> : ");
		return getSqlSession().selectOne(PAKAGE_PATH + "qaBoardQaNoSelect");
	}
	
}
