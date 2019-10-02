package com.tu.faboard.service;

import java.util.List;

import com.tu.faboard.vo.FaVo;

public interface FaBoardService{
	public List<FaVo> faBoardList(FaVo fvo);
	public FaVo faBoardSelect(FaVo fvo);
	public int faBoardInsert(FaVo fvo);
	public int faBoardUpdate(FaVo fvo);
	public int faBoardDelete(FaVo fvo);
	public int faBoardListCount();
}