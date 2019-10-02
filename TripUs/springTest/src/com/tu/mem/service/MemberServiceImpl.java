package com.tu.mem.service;

/**
클래스명 : SignUpServiceImpl
날 짜 : 2019-08-27
작성자명 : 강 희 진
*/

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tu.mem.dao.MemberDAO;
import com.tu.mem.vo.MemberVO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public List<MemberVO> listMember(MemberVO param) {
		// TODO Auto-generated method stub
		System.out.println("SignUpServiceImpl listMember >>> ");
		List<MemberVO> list = null;
		list = new ArrayList<MemberVO>();
		list = memberDAO.listMember(param);
		System.out.println("SignUpServiceImpl listMember list >>> " + list);
		return list;
	}

	@Override
	public int insertMember(MemberVO param) {
		// TODO Auto-generated method stub
		System.out.println("SignUpServiceImpl insertMember >>> ");
		return memberDAO.insertMember(param);
	}

	@Override
	public int emailCheck(String memail) {
		System.out.println("SignUpServiceImpl emailCheck() >>> ");		
		return memberDAO.emailCheck(memail);
	}

	@Override
	public int idCheck(String mid) {
		System.out.println("SignUpServiceImpl idCheck() >>> ");	
		return memberDAO.idCheck(mid);
	}

	@Override
	public int nickCheck(String mnick) {
		System.out.println("SignUpServiceImpl nickCheck() >>> ");
		return memberDAO.nickCheck(mnick);
	}


}
