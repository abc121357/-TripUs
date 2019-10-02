package com.tu.coboard.service;

/**
클래스명 : CoBoardService
날 짜 : 2019-09-03
작성자명 : 김 해 원
*/

import java.util.List;

import com.tu.coboard.vo.CoBoardVO;

public interface CoBoardService {
	public List<CoBoardVO> selectContentID(CoBoardVO cvo);
	public List<CoBoardVO> coBoardList(CoBoardVO cvo);
}
