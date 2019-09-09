package com.tu.resboard.service;

/**
클래스명 : CoBoardService
날 짜 : 2019-09-03
작성자명 : 김 해 원
*/

import java.util.List;

import com.tu.resboard.vo.ResBoardVO;

public interface ResBoardService {
	public List<ResBoardVO> selectContentID(ResBoardVO cvo);
	public List<ResBoardVO> resBoardList(ResBoardVO cvo);
}
