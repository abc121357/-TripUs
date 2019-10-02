package com.tu.lp.service;

/**
클래스명 : LoginServiceImpl
날 짜 : 2019-08-27
작성자명 : 김 해 원
*/
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.stereotype.Repository;

import com.tu.lp.dao.LoginDAO;
import com.tu.mem.vo.MemberVO;

@Service 
@Transactional
public class LoginServiceImpl implements LoginService{
	@Autowired
	private LoginDAO loginDAO;
	
	@Override
	public List<MemberVO> login(MemberVO mVO){
		System.out.println("ServiceImpl의 login함수 진입");
		List<MemberVO> list = new ArrayList<MemberVO>();
		list = loginDAO.login(mVO);
		
		return list; 
	}
	
	@Override
	public List<MemberVO> emailCheck(MemberVO mVO){
		System.out.println("ServiceImpl의 emailCheck함수 진입");
		List<MemberVO> list = new ArrayList<MemberVO>();
		list = loginDAO.emailCheck(mVO);
		
		return list;
	}
	@Override
	public List<MemberVO> searchID(MemberVO mVO){
		System.out.println("ServiceImpl의 searchID함수 진입");
		List<MemberVO> list = new ArrayList<MemberVO>();
		list = loginDAO.searchID(mVO);
		return list;
	}
	
	@Override
	public List<MemberVO> searchPW(MemberVO mVO){
		System.out.println("ServiceImpl의 searchPW함수 진입");
		List<MemberVO> list = new ArrayList<MemberVO>();
		list = loginDAO.searchPW(mVO);
		return list;
	}
	@Override
	public int changePW(MemberVO mVO){
		System.out.println("ServiceImpl의 changePW함수 진입");
		return loginDAO.changePW(mVO);
	}
	@Override
	public int memberDelete(MemberVO mVO){
		System.out.println("ServiceImp의 memberDelete함수 진입");
		return loginDAO.memberDelete(mVO);
	}
	
	/*
	@Override
	public HashMap getMemberInfo(LoginVO lVO){}
	*/
}
