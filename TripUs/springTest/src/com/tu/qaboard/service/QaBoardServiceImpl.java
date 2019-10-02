package com.tu.qaboard.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tu.qaboard.dao.QaBoardDao;
import com.tu.qaboard.vo.QaBoardVo;

@Service
@Transactional
public class QaBoardServiceImpl implements QaBoardService  {

	@Autowired
	private QaBoardDao qaBoardDao;
	
	//full post page
	@Override
	public List<QaBoardVo> qaBoardList(QaBoardVo qavo) {
		System.out.println("QaBoardServiceImpl.qaBoardList SUCCESS >>> : ");
		
		List<QaBoardVo> qaList = new ArrayList<QaBoardVo>();
		qaList = qaBoardDao.qaBoardList(qavo);
		System.out.println("QaBoardServiceImpl.qaBoardList qaList confirm >>> : " + qaList);
		
		return qaList;
	}
	
	//insert function 
	@Override
	public int qaBoardInsert(QaBoardVo qavo) {
		System.out.println("QaBoardServiceImpl.qaBoardInsert SUCCESS >>> : ");
		return qaBoardDao.qaBoardInsert(qavo);
	}

	//detail page
	@Override
	public QaBoardVo qaBoardDetail(QaBoardVo qavo) {
		System.out.println("QaBoardServiceImpl.qaBoardDetail SUCCESS >>> : ");
		return qaBoardDao.qaBoardDetail(qavo);
	}
	
	//update function
	@Override
	public int qaBoardUpdate(QaBoardVo qavo) {
		System.out.println("QaBoardServiceImpl.qaBoardUpdate SUCCESS >>> : ");
		return qaBoardDao.qaBoardUpdate(qavo);
	}

	//delete function
	@Override
	public int qaBoardDelete(QaBoardVo qavo) {
		System.out.println("QaBoardServiceImpl.qaBoardDelete SUCCESS >>> : ");
		return qaBoardDao.qaBoardDelete(qavo);
	}

	//number of QANO max value 
	@Override
	public String qaBoardQaNoSelect() {
		System.out.println("QaBoardServiceImpl.qaBoardQaNoSelect SUCCESS >>> : ");
		return qaBoardDao.qaBoardQaNoSelect();
	}

}
