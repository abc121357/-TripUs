package com.tu.faboard.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tu.faboard.dao.FaBoardDao;
import com.tu.faboard.vo.FaVo;

@Service
@Transactional 
public class FaBoardServiceImpl implements FaBoardService {

	@Autowired 
	private FaBoardDao faBoardDao;

	//full post page
	@Override
	public List<FaVo> faBoardList(FaVo fvo) {
		System.out.println("FaBoardServiceImpl.faBoardList SUCCESS >>> : ");
		
		List<FaVo> faList = new ArrayList<FaVo>();
		faList= faBoardDao.faBoardList(fvo);
		System.out.println("FaBoardServiceImpl.faBoardList  faList confirm >>> : " + faList);
		
		return faList;
	}
	
	//insert Write Form page 
	@Override
	public FaVo faBoardSelect(FaVo fvo) {
		System.out.println("FaBoardServiceImpl.faBoardSelect SUCCESS >>> : ");
		return faBoardDao.faBoardSelect(fvo);
	}

	//insert function 
	@Override
	public int faBoardInsert(FaVo fvo) {
		System.out.println("FaBoardServiceImpl.faBoardInsert SUCCESS >>> : ");
		return faBoardDao.faBoardInsert(fvo);
	}

	//update function
	@Override
	public int faBoardUpdate(FaVo fvo) {
		System.out.println("FaBoardServiceImpl.faBoardUpdate SUCCESS >>> : ");
		return faBoardDao.faBoardUpdate(fvo);
	}

	//delete function
	@Override
	public int faBoardDelete(FaVo fvo) {
		System.out.println("FaBoardServiceImpl.faBoardDelete SUCCESS >>> : ");
		return faBoardDao.faBoardDelete(fvo);
	}
	
	//full post count
	@Override
	public int faBoardListCount() {
		System.out.println("FaBoardServiceImpl.faBoardListCount SUCCESS >>> : ");
		return faBoardDao.faBoardListCount();
	}
	
}

