package com.tu.coboard.service;

/**
클래스명 : CoBoardServiceImpl
날 짜 : 2019-09-03
작성자명 : 김 해 원
*/


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tu.coboard.vo.CoBoardVO;
import com.tu.coboard.dao.CoBoardMapper;


@Service 
@Transactional
public class CoBoardServiceImpl implements CoBoardService {
	@Autowired
	private CoBoardMapper coBoardMapper;
	
	@Override
	public List<CoBoardVO> selectContentID(CoBoardVO cvo){
		System.out.println("ServiceImpl의 selectContentID함수 진입");
		List<CoBoardVO> list = new ArrayList<CoBoardVO>();
		list = coBoardMapper.selectContentID(cvo);
		
		return list; 
	}
	@Override
	public List<CoBoardVO> coBoardList(CoBoardVO cvo){
		System.out.println("ServiceImpl의 coBoardList함수 진입");
		List<CoBoardVO> list = new ArrayList<CoBoardVO>();
		list = coBoardMapper.coBoardList(cvo);
		
		return list;
	}
}
