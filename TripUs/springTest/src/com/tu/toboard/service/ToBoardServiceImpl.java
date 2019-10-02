package com.tu.toboard.service;

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

import com.tu.toboard.vo.ToBoardVO;
import com.tu.toboard.dao.ToBoardMapper;


@Service 
@Transactional
public class ToBoardServiceImpl implements ToBoardService {
	@Autowired
	private ToBoardMapper toBoardMapper;
	
	@Override
	public List<ToBoardVO> selectContentID(ToBoardVO tvo){
		System.out.println("ServiceImpl의 selectContentID함수 진입");
		List<ToBoardVO> list = new ArrayList<ToBoardVO>();
		list = toBoardMapper.selectContentID(tvo);
		
		return list; 
	}
	@Override
	public List<ToBoardVO> toBoardList(ToBoardVO tvo){
		System.out.println("ServiceImpl의 toBoardList함수 진입");
		List<ToBoardVO> list = new ArrayList<ToBoardVO>();
		list = toBoardMapper.toBoardList(tvo);
		
		return list;
	}
}
