package com.tu.mypage.dao;

import com.tu.mem.vo.MemberVO;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import java.util.List;

public class MyPageDAOImpl extends SqlSessionDaoSupport implements MyPageDAO {


    private final String CONTEXT_PATH="mybatis.query.MyPageMapper";

    @Override
    public List<MemberVO> memberInfo(MemberVO param) {
        return getSqlSession().selectList(CONTEXT_PATH+"memberInfo");
    }

    @Override
    public int memberInfoUpdate(MemberVO param) {
        return getSqlSession().update(CONTEXT_PATH+"memberInfoUpdate");
    }

    @Override
    public int infoNickCheck(MemberVO param) {
        return Integer.parseInt(getSqlSession().selectOne(CONTEXT_PATH+"infoNickCheck").toString());
    }
}
