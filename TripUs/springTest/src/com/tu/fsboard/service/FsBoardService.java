package com.tu.fsboard.service;

/**
클래스명 : FsBoardService
날 짜 : 2019-09-06
작성자명 : 강 희 진
*/

import java.util.List;

import com.tu.fsboard.vo.FsBoardVO;

public interface FsBoardService {
	public List<FsBoardVO> selectContentID(FsBoardVO fvo);
	public List<FsBoardVO> fsBoardList(FsBoardVO fvo);
}
