package com.tu.lp.dao;

/**
클래스명 : LoginMapperImpl
날 짜 : 2019-08-27
작성자명 : 김 해 원
*/

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tu.mem.vo.MemberVO;


public class LoginDAOImpl extends SqlSessionDaoSupport implements LoginDAO {
	
	private final String PACKAGE_PATH = "mybatis.query.LoginMapper";
	
	@Override 
	public List<MemberVO> login(MemberVO param){
		return getSqlSession().selectOne(PACKAGE_PATH+"login");
	}
	@Override
	public List<MemberVO> emailCheck(MemberVO mVO){
		return getSqlSession().selectOne(PACKAGE_PATH+"emailCheck");
	}
	@Override
	public List<MemberVO> searchID(MemberVO mVO){
		return getSqlSession().selectOne(PACKAGE_PATH+"searchID");
	}
	@Override
	public List<MemberVO> searchPW(MemberVO mVO){
		return getSqlSession().selectOne(PACKAGE_PATH+"searchPW");
	}
	@Override
	public int changePW(MemberVO mVO){
		return (int)getSqlSession().update(PACKAGE_PATH+"changePW");
	}
	@Override
	public int memberDelete(MemberVO mVO){
		return (int)getSqlSession().selectOne(PACKAGE_PATH+"memberDelete");
	}
	
}
