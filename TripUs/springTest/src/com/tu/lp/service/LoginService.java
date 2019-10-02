package com.tu.lp.service;

/**
클래스명 : LoginService
날 짜 : 2019-08-27
작성자명 : 김 해 원
*/
import java.util.List;

import com.tu.mem.vo.MemberVO;

public interface LoginService {
	public List<MemberVO> login(MemberVO mVO);
	public List<MemberVO> emailCheck(MemberVO mVO);
	public List<MemberVO> searchID(MemberVO mVO);
	public List<MemberVO> searchPW(MemberVO mVO);
	public int changePW(MemberVO mVO);
	public int memberDelete(MemberVO mVO);
	/*
	public HashMap getMemberInfo(LoginVO lVO);
	*/
}
