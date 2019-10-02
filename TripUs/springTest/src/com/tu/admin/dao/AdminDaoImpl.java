package com.tu.admin.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.tu.admin.vo.AdminVo;

public class AdminDaoImpl extends SqlSessionDaoSupport implements AdminDao {

	//constructor field
	private final String PAKAGE_PATH = "mybatis.query.AdminMapper";
	
	@Override
	public List<AdminVo> adlistMember(AdminVo adminvo) {
		return getSqlSession().selectList(PAKAGE_PATH + "adlistMember");
	}


}
