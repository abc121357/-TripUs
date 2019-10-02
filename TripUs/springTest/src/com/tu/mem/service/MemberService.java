package com.tu.mem.service;

/**
클래스명 : SignUpService
날 짜 : 2019-08-27
작성자명 : 강 희 진
*/

import java.util.List;

import com.tu.mem.vo.MemberVO;

public interface MemberService {
	
	public List<MemberVO> listMember(MemberVO param); 
	public int insertMember(MemberVO param); 
	public int emailCheck(String memail);
	public int idCheck(String mid);
	public int nickCheck(String mnick);
}
