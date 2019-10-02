package com.tu.toboard.service;

/**
클래스명 : CoBoardService
날 짜 : 2019-09-03
작성자명 : 김 해 원
*/

import java.util.List;

import com.tu.toboard.vo.ToBoardVO;

public interface ToBoardService {
	public List<ToBoardVO> selectContentID(ToBoardVO cvo);
	public List<ToBoardVO> toBoardList(ToBoardVO cvo);
}
