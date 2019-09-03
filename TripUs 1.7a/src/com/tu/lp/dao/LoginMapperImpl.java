package com.tu.lp.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tu.lp.vo.LoginVO;


public class LoginMapperImpl extends SqlSessionDaoSupport implements LoginMapper {
	
	private final String PACKAGE_PATH = "mybatis.query.LoginDAO";
	
	@Override 
	public List<LoginVO> login(LoginVO param){
		return getSqlSession().selectOne(PACKAGE_PATH+"login");
	}
	/*
	@Override
	public LoginVO searchID(LoginVO lVO){}
	
	@Override
	public LoginVO searchPW(LoginVO lVO){}
	*/
}
