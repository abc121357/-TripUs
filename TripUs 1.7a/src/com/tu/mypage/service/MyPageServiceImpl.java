package com.tu.mypage.service;

import com.tu.mem.vo.MemberVO;
import com.tu.mypage.dao.MypageMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class MyPageServiceImpl implements MyPageService{

    @Autowired
    private MypageMapper mypageMapper;

    @Override
    public List<MemberVO> memberInfo(MemberVO param) {

        List<MemberVO> mInfo=new ArrayList<MemberVO>();
        mInfo=mypageMapper.memberInfo(param);

        return mInfo;
    }
    
    public int memberInfoUpdate(MemberVO param){
    	
    	return mypageMapper.memberInfoUpdate(param);
    }

    
}
