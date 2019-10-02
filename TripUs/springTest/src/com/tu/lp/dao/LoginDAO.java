package com.tu.lp.dao;

/**
클래스명 : LoginMapper
날 짜 : 2019-08-27
작성자명 : 김 해 원
*/
import java.util.List;

import org.springframework.stereotype.Repository;

import com.tu.mem.vo.MemberVO;

public interface LoginDAO {
	public List<MemberVO> login(MemberVO mVO);
	public List<MemberVO> emailCheck(MemberVO mVO);
	public List<MemberVO> searchID(MemberVO mVO);
	public List<MemberVO> searchPW(MemberVO mVO);
	public int changePW(MemberVO mVO);
	public int memberDelete(MemberVO mVO);
}
