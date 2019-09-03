package com.tu.mypage.controller;

import com.tu.mypage.service.MyPageService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tu.mem.vo.MemberVO;

import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
@RequestMapping(value="/myPage")
public class MyPageController {

	private final String CONTEXT_PATH="restaurant";


	@Autowired
	public MyPageService myPageService;

	@RequestMapping("/myPage")
	public ModelAndView memberInfo(@ModelAttribute MemberVO param){

		List<MemberVO> list =myPageService.memberInfo(param);
		ModelAndView mav = new ModelAndView();

		mav.addObject("mList",list);
		mav.setViewName(CONTEXT_PATH+"/mypage");

		return mav;
	}
	
	@RequestMapping("/memberInfoUpdate")
	public ModelAndView memberInfoUpdate(@ModelAttribute MemberVO param){
		
		int result=0;
		result=myPageService.memberInfoUpdate(param);
		
		
		ModelAndView mav = new ModelAndView();
		
		String resultStr="완료";
		if(result==0)
			resultStr="실패";
		
		mav.addObject("result",resultStr);
		mav.setViewName(CONTEXT_PATH+"/result");
						
		return mav;
		
	}
}
