package com.tu.admin.dao;

import java.util.List;

import com.tu.admin.vo.AdminVo;

public interface AdminDao {

	public List<AdminVo> adlistMember(AdminVo adminvo);
}
