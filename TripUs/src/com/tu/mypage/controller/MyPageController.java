package com.tu.mypage.controller;

import com.tu.mypage.service.MyPageService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tu.mem.vo.MemberVO;

import org.springframework.web.servlet.ModelAndView;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public ModelAndView memberInfoUpdate(@ModelAttribute MemberVO param){
		
		ModelAndView mav=new ModelAndView();
		
		param.setMno("M201908270001");
		
		
		System.out.println(param.getMno());
		if(param.getMno()!=null){
		List<MemberVO> list =myPageService.memberInfo(param);
		
		mav.addObject("mInfo",list);
		mav.addObject("mprofile", list.get(0).getMprofile());
		}
		
		mav.setViewName(CONTEXT_PATH+"/infoupdate");
		
		return mav;
	}
	//닉네임 중복확인
	@RequestMapping("/infoNickCheck")
	@ResponseBody
	public String InfoNickCheck(@ModelAttribute MemberVO param){
		
		ModelAndView mav=new ModelAndView();
		
		int result=myPageService.infoNickCheck(param);
		System.out.println("result : "+result);
		String resultStr="nickfail";
		if(result==0){
			resultStr="nicktrue";
		}
		
		mav.addObject("resultStr",resultStr);
		mav.setViewName(CONTEXT_PATH+"/infoupdate");
		
		System.out.println("resultStr : "+resultStr);
		
		return resultStr;
		
	}
	
	
	
	@RequestMapping("/memberInfoUpdate")
	@ResponseBody
	public ModelAndView memberInfoUpdate(@ModelAttribute MemberVO param,HttpServletRequest request){
		
		int result=0;
		
		//Mno는 세션 값 등으로 가져온 Mno를 넣는 것으로 함
		param.setMno("M201908270001");
		System.out.println("nick : "+ param.getMnick());
		System.out.println("mpw : "+ param.getMpw());
		System.out.println("profile : "+ param.getMprofile());
		System.out.println("hp : "+ param.getMhp());
		
		HttpSession session = request.getSession();
		
		
		result=myPageService.memberInfoUpdate(param);
		
		ModelAndView mav = new ModelAndView();
		
		String resultStr="infocomple";
		if(result==0)
			resultStr="infofail";
		System.out.println("resultStr : " + resultStr);
		mav.addObject("result",resultStr);
		mav.setViewName(CONTEXT_PATH+"/infoupdate");
		
		session.setAttribute("mnick", param.getMnick());
		session.setAttribute("mprofile", param.getMprofile());
		session.setAttribute("mhp",param.getMhp());
		session.setAttribute("mpw",param.getMpw());
		
						
		return mav;
		
	}
}
