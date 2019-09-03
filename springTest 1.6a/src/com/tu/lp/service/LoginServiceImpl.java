package com.tu.lp.service;

import java.util.ArrayList;
import java.util.List;



import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.stereotype.Repository;

import com.tu.lp.dao.LoginMapper;
import com.tu.lp.vo.LoginVO;

@Service
@Transactional
public class LoginServiceImpl implements LoginService{
	@Autowired
	private LoginMapper loginMapper;
	
	@Override
	public List<LoginVO> login(LoginVO lVO){
		System.out.println("ServiceImpl의 login함수 진입");
		List<LoginVO> list = new ArrayList<LoginVO>();
		list = loginMapper.login(lVO);
		
		return list;
	}

	/*
	@Override
	public HashMap getMemberInfo(LoginVO lVO){}
	
	@Override
	public LoginVO searchID(LoginVO lVO){}
	
	@Override
	public LoginVO searchPW(LoginVO lVO){}
	*/
}
