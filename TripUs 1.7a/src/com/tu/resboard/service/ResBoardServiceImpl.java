package com.tu.resboard.service;

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

import com.tu.resboard.dao.ResBoardDAO;
import com.tu.resboard.vo.ResBoardVO;


@Service 
@Transactional
public class ResBoardServiceImpl implements ResBoardService {
	@Autowired
	private ResBoardDAO resBoardMapper;
	
	@Override
	public List<ResBoardVO> selectContentID(ResBoardVO tvo){
		System.out.println("ServiceImpl의 selectContentID함수 진입");
		List<ResBoardVO> list = new ArrayList<ResBoardVO>();
		list = resBoardMapper.selectContentID(tvo);
		
		return list; 
	}
	@Override
	public List<ResBoardVO> resBoardList(ResBoardVO tvo){
		System.out.println("ServiceImpl의 toBoardList함수 진입");
		List<ResBoardVO> list = new ArrayList<ResBoardVO>();
		list = resBoardMapper.resBoardList(tvo);
		
		return list;
	}
}
