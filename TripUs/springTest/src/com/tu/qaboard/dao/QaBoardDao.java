package com.tu.qaboard.dao;

import java.util.List;

import com.tu.qaboard.vo.QaBoardVo;

public interface QaBoardDao {
	List<QaBoardVo> qaBoardList(QaBoardVo qavo);
	public int qaBoardInsert(QaBoardVo qavo);
	public QaBoardVo qaBoardDetail(QaBoardVo qavo);
	public int qaBoardUpdate(QaBoardVo qavo);
	public int qaBoardDelete(QaBoardVo qavo);
	public String qaBoardQaNoSelect();
}
