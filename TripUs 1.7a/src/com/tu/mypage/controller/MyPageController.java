package com.tu.mypage.controller;

import com.tu.mypage.service.MyPageService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tu.mem.vo.MemberVO;

import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 클래스명 : MyPageController
 날 짜 : 2019-09-05
 작성자명 : LHJ
 */
@Controller
@RequestMapping(value="/mypage")
public class MyPageController {

	private final String CONTEXT_PATH="mypage";


	@Autowired
	public MyPageService myPageService;

	@RequestMapping("/myPage")
	public ModelAndView memberInfo(@ModelAttribute MemberVO param){

		System.out.println("memberInfo시작");

		param.setMno("M201908270001");

		ModelAndView mav = new ModelAndView();
		
		System.out.println(param.getMno());
		if(param.getMno()!=null){
		List<MemberVO> list =myPageService.memberInfo(param);
		
		mav.addObject("mInfo",list);
		mav.addObject("mprofile", list.get(0).getMprofile());
		}
		
		mav.setViewName(CONTEXT_PATH+"/myPage");
		
		return mav;
	}
	//경로로 이동
	@RequestMapping("/infoupdate")
	public ModelAndView memberInfoUpdate(){
		
		ModelAndView mav=new ModelAndView();
		
		//mav.addObject();
		
		mav.setViewName(CONTEXT_PATH+"/infoupdate");
		
		return mav;
	}
	
	@RequestMapping("/memberInfoUpdate")
	public ModelAndView memberInfoUpdate(@ModelAttribute MemberVO param){
		
		int result=0;

		//Mno는 세션 값 등으로 가져온 Mno를 넣는 것으로 함
		param.setMno("M201908270001");
		System.out.println("nick : "+ param.getMnick());
		System.out.println("mpw : "+ param.getMpw());
		System.out.println("profile : "+ param.getMprofile());
		System.out.println("hp : "+ param.getMhp());
		
		
		result=myPageService.memberInfoUpdate(param);
		
		ModelAndView mav = new ModelAndView();
		
		String resultStr="내 정보 수정 완료";
		if(result==0)
			resultStr="내 정보 수정 실패";
		
		mav.addObject("result",resultStr);
		mav.setViewName(CONTEXT_PATH+"/result");
						
		return mav;
		
	}
}
