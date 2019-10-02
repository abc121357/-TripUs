package com.tu.toboard.dao;

import java.util.List;

import com.tu.toboard.vo.ToBoardVO;

public interface ToBoardMapper {
	public List<ToBoardVO> selectContentID(ToBoardVO cvo);
	public List<ToBoardVO> toBoardList(ToBoardVO cvo);
}
