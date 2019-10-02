package com.tu.fsboard.dao;

import java.util.List;

import com.tu.fsboard.vo.FsBoardVO;

public interface FsBoardDAO {
	public List<FsBoardVO> selectContentID(FsBoardVO fvo);
	public List<FsBoardVO> fsBoardList(FsBoardVO fvo);
}
