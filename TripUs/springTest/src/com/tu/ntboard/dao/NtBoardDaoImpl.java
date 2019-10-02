package com.tu.ntboard.dao;

import java.util.List;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import com.tu.ntboard.vo.NtBoardVo;

public class NtBoardDaoImpl extends SqlSessionDaoSupport implements NtBoardDao {

	//constructor field
	private final String PAKAGE_PATH = "mybatis.query.NtBoardMapper";
	
	//full post page
	@Override
	public List<NtBoardVo> ntBoardList(NtBoardVo ntvo) {
		System.out.println("NtboardDaoImpl.ntBoardList SUCCESS >>> : ");
		return getSqlSession().selectList(PAKAGE_PATH + "ntBoardList");
	}
	
	//insert function 
	@Override
	public int ntBoardInsert(NtBoardVo ntvo) {
		System.out.println("NtboardDaoImpl.ntBoardInsert SUCCESS >>> : ");
		return (int)getSqlSession().insert(PAKAGE_PATH + "ntBoardInsert");
	}

	//detail page
	@Override
	public NtBoardVo ntBoardDetail(NtBoardVo ntvo) {
		System.out.println("NtboardDaoImpl.ntBoardDetail SUCCESS >>> : ");
		return (NtBoardVo)getSqlSession().selectOne(PAKAGE_PATH + "ntBoardDetail");
	}
	
	//update function
	@Override
	public int ntBoardUpdate(NtBoardVo ntvo) {
		System.out.println("NtboardDaoImpl.ntBoardUpdate SUCCESS >>> : ");
		return (int)getSqlSession().update(PAKAGE_PATH + "ntBoardUpdate");
	}
	
	//delete function
	@Override
	public int ntBoardDelete(NtBoardVo ntvo) {
		System.out.println("NtboardDaoImpl.ntBoardDelete SUCCESS >>> : ");
		return (int)getSqlSession().delete(PAKAGE_PATH + "ntBoardDelete");
	}
	
	//full post count 
	@Override
	public int ntBoardListCnt(NtBoardVo ntvo) {
		System.out.println("NtboardDaoImpl.ntBoardListCnt SUCCESS >>> : ");
		return (int)getSqlSession().selectOne(PAKAGE_PATH + "ntBoardListCnt");
	}

	//hit count
	@Override
	public int ntUpdateViewCnt(NtBoardVo ntvo) {
		System.out.println("NtboardDaoImpl.ntUpdateViewCnt SUCCESS >>> : ");
		return (int)getSqlSession().update(PAKAGE_PATH + "ntUpdateViewCnt");
	}
	
}
