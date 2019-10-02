package com.tu.ntboard.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tu.ntboard.dao.NtBoardDao;
import com.tu.ntboard.vo.NtBoardVo;

@Service
@Transactional 
public class NtBoardServiceImpl implements NtBoardService{

	@Autowired 
	private NtBoardDao ntBoardDao;
	
	//Full post page
	@Override
	public List<NtBoardVo> ntBoardList(NtBoardVo ntvo) {
		System.out.println("NtboardServiceImpl.ntBoardList SUCCESS >>> : ");
		
		List<NtBoardVo> ntList = new ArrayList<NtBoardVo>();
		ntList = ntBoardDao.ntBoardList(ntvo);

		System.out.println("NtboardServiceImpl.ntBoardList ntList confirm >>> : " + ntList);
		
		return ntList;
	}

	//insert function
	@Override
	public int ntBoardInsert(NtBoardVo ntvo) {
		System.out.println("NtboardServiceImpl.ntBoardInsert SUCCESS >>> : ");
		return ntBoardDao.ntBoardInsert(ntvo);
	}
	
	//detail page
	@Override
	public NtBoardVo ntBoardDetail(NtBoardVo ntvo) {
		System.out.println("NtboardServiceImpl.ntBoardDetail SUCCESS >>> : ");
		return ntBoardDao.ntBoardDetail(ntvo);
	}

	//update function
	@Override
	public int ntBoardUpdate(NtBoardVo ntvo) {
		System.out.println("NtboardServiceImpl.ntBoardUpdate SUCCESS >>> : ");
		return ntBoardDao.ntBoardUpdate(ntvo);
	}

	//delete function
	@Override
	public int ntBoardDelete(NtBoardVo ntvo) {
		System.out.println("NtboardServiceImpl.ntBoardDelete SUCCESS >>> : ");
		return ntBoardDao.ntBoardDelete(ntvo);
	}

	//Full post page
	@Override
	public int ntBoardListCnt(NtBoardVo ntvo) {
		System.out.println("NtboardServiceImpl.ntBoardListCnt SUCCESS >>> : ");
		return ntBoardDao.ntBoardListCnt(ntvo);
	}

	//hit count
	@Override
	public int ntUpdateViewCnt(NtBoardVo ntvo) {
		System.out.println("NtboardServiceImpl.ntUpdateViewCnt SUCCESS >>> : ");
		return ntBoardDao.ntUpdateViewCnt(ntvo);
	}

}
