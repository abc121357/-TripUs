package com.tu.mypage.dao;

import com.tu.mem.vo.MemberVO;

import java.util.ArrayList;
import java.util.List;

public interface MyPageDAO {

    public List<MemberVO> memberInfo(MemberVO param);
    public int memberInfoUpdate(MemberVO param);
    public int infoNickCheck(MemberVO param);
}
