package com.tu.lp.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tu.lp.vo.LoginVO;

public interface LoginMapper {
	public List<LoginVO> login(LoginVO lVO);
	/*
	public LoginVO searchID(LoginVO lVO);
	public LoginVO searchPW(LoginVO lVO);
	*/
}
