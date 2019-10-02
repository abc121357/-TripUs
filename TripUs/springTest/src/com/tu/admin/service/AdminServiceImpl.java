package com.tu.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tu.admin.dao.AdminDao;
import com.tu.admin.vo.AdminVo;

@Service
@Transactional 
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDao adminDao;
	
	@Override
	public List<AdminVo> adlistMember(AdminVo adminvo) {
		return adminDao.adlistMember(adminvo);
	}

}
