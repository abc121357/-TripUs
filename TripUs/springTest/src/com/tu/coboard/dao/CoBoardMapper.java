package com.tu.coboard.dao;

import java.util.List;

import com.tu.coboard.vo.CoBoardVO;

public interface CoBoardMapper {
	public List<CoBoardVO> selectContentID(CoBoardVO cvo);
	public List<CoBoardVO> coBoardList(CoBoardVO cvo);
}
