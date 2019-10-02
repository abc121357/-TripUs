package com.tu.fsboard.service;

/**
클래스명 : FsBoardServiceImpl
날 짜 : 2019-09-06
작성자명 : 강 희 진
*/

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tu.fsboard.dao.FsBoardDAO;
import com.tu.fsboard.vo.FsBoardVO;


@Service 
@Transactional
public class FsBoardServiceImpl implements FsBoardService {
	@Autowired
	private FsBoardDAO fsBoardDAO;
	
	@Override
	public List<FsBoardVO> selectContentID(FsBoardVO fvo){
		System.out.println("ServiceImpl의 selectContentID함수 진입");
		List<FsBoardVO> list = new ArrayList<FsBoardVO>();
		list = fsBoardDAO.selectContentID(fvo);
		
		return list; 
	}
	@Override
	public List<FsBoardVO> fsBoardList(FsBoardVO fvo){
		System.out.println("ServiceImpl의 coBoardList함수 진입");
		List<FsBoardVO> list = new ArrayList<FsBoardVO>();
		list = fsBoardDAO.fsBoardList(fvo);
		
		return list;
	}
}
