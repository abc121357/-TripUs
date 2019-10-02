package com.tu.mem.dao;

/**
클래스명 : SignUpDAOImpl
날 짜 : 2019-08-27
작성자명 : 강 희 진
*/

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.tu.mem.vo.MemberVO;

public class MemberDAOImpl extends SqlSessionDaoSupport implements MemberDAO{

	private final String PACKAGE_PATH = "com.tu.mem.dao.MemberMapper.";

	@Override
	public List<MemberVO> listMember(MemberVO param) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList(PACKAGE_PATH+"listLesson");
	}

	@Override
	public int insertMember(MemberVO param) {
		// TODO Auto-generated method stub
		return (int)getSqlSession().insert(PACKAGE_PATH+"insertLesson");
	}

	@Override
	public int emailCheck(String memail) {
		// TODO Auto-generated method stub
		return (int)getSqlSession().selectOne(PACKAGE_PATH+"emailCheck");
	}

	@Override
	public int idCheck(String mid) {
		// TODO Auto-generated method stub
		return (int)getSqlSession().selectOne(PACKAGE_PATH+"idCheck");
	}

	@Override
	public int nickCheck(String mnick) {
		// TODO Auto-generated method stub
		return (int)getSqlSession().selectOne(PACKAGE_PATH+"nickCheck");
	}
	

}
