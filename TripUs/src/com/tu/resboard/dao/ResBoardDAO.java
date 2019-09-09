package com.tu.resboard.dao;

import java.util.List;

import com.tu.resboard.vo.ResBoardVO;

public interface ResBoardDAO {
	public List<ResBoardVO> selectContentID(ResBoardVO cvo);
	public List<ResBoardVO> resBoardList(ResBoardVO cvo);
}
