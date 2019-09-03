package com.tu.mypage.dao;

import com.tu.mem.vo.MemberVO;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import java.util.ArrayList;
import java.util.List;

public class MypageMapperImpl extends SqlSessionDaoSupport implements MypageMapper {


    private final String CONTEXT_PATH="mybatis.query.MyPageDAO";

    @Override
    public List<MemberVO> memberInfo(MemberVO param) {
        return getSqlSession().selectList(CONTEXT_PATH+"memberInfo");
    }

    @Override
    public int memberInfoUpdate(MemberVO param) {
        return getSqlSession().update(CONTEXT_PATH+"memberInfoUpdate");
    }
}
