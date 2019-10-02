package com.tu.faboard.dao;

import java.util.List;

import com.tu.faboard.vo.FaVo;

public interface FaBoardDao{
	public List<FaVo> faBoardList(FaVo fvo);
	public FaVo faBoardSelect(FaVo fvo);
	public int faBoardInsert(FaVo fvo);
	public int faBoardUpdate(FaVo fvo);
	public int faBoardDelete(FaVo fvo);
	public int faBoardListCount();
}
