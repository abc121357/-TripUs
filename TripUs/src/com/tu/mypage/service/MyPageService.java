package com.tu.mypage.service;

import com.tu.mem.vo.MemberVO;

import java.util.List;

public interface MyPageService {

    public List<MemberVO> memberInfo(MemberVO param);
    public int memberInfoUpdate(MemberVO param);
}
