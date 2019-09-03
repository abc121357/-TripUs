package com.tu.lp.service;

import java.util.List;

import com.tu.lp.vo.LoginVO;

public interface LoginService {
	public List<LoginVO> login(LoginVO lVO);
	/*
	public HashMap getMemberInfo(LoginVO lVO);
	public LoginVO searchID(LoginVO lVO);
	public LoginVO searchPW(LoginVO lVO);
	*/
}
