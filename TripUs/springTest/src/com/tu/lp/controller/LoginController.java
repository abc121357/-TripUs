package com.tu.lp.controller;

/**
클래스명 : LoginController
날 짜 : 2019-08-27
작성자명 : 김 해 원
*/

import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mail.GenerateCertNumber;
import com.tu.coboard.vo.CoBoardVO;
import com.tu.lp.service.LoginService;
import com.tu.mem.vo.MemberVO;

@Controller
@RequestMapping(value="/login")
public class LoginController{
	private static final String CONTEXT_PATH="login";
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("/memberLogin")
	@ResponseBody
	public String memberLogin(@ModelAttribute MemberVO mvo,HttpServletRequest request){
		System.out.println("controller의 memberLogin진입");
		System.out.println("컨트롤러로 넘어온 입력한 mid : "+mvo.getMid());
		System.out.println("컨트롤러로 넘어온 입력한 mpw : "+mvo.getMpw());
		
		HttpSession session = request.getSession();
		
		List<MemberVO> list = new ArrayList<MemberVO>();
		list = loginService.login(mvo);
		int size=list.size();
		System.out.println("list : "+list);
		System.out.println("list.size() : "+size);
		
		
		if(size ==1){
			MemberVO mVO1 = new MemberVO();
			mVO1 = list.get(0);
			System.out.println("mVO1 : "+mVO1.toString());
			String mname = mVO1.getMname();
			String mgrade = mVO1.getMgrade();
			String memail = mVO1.getMemail();
			String mid = mVO1.getMid();
			
			session.setAttribute("mid", mid);
			session.setAttribute("mname", mname);
			session.setAttribute("mgrade",mgrade);
			session.setAttribute("memail",memail);
			return "true";
		}
		else{
			return "false";
		}
	}
	@RequestMapping("/emailCheck")
	@ResponseBody
	public String emailCheck(@ModelAttribute MemberVO mvo,Model model){
		
		System.out.println("controller의 emailCheck진입");
		System.out.println("컨트롤러로 넘어온 입력한 memail : "+mvo.getMemail());
		List<MemberVO> list = loginService.emailCheck(mvo);
		
		if(list.size() ==1){
			GenerateCertNumber gcn = new GenerateCertNumber();
			String num = gcn.excuteGenerate();
			return num;
		}
		else{
			return "false";
		}
	}
	@RequestMapping("/equalCheck")
	@ResponseBody
	public String equalCheck(@ModelAttribute MemberVO mvo,Model model){

		System.out.println("controller의 equalCheck진입");
		List<MemberVO> list = loginService.searchPW(mvo);
		
		if(list.size() ==1){
			GenerateCertNumber gcn = new GenerateCertNumber();
			String num = gcn.excuteGenerate();
			return num;
		}
		else{
			return "false";
		}
	}
	@RequestMapping("/changePW")
	@ResponseBody
	public String changePW(@ModelAttribute MemberVO mvo,Model model){
		String resultStr="";
		System.out.println("controller의 changePW진입");
		int result = loginService.changePW(mvo);
		System.out.println("changePW의 result : "+result);
		if(result >0) resultStr="Complete!";
		else resultStr="FALSE.....";

		
			return resultStr;
		
	}
	@RequestMapping("/logout")
	public ModelAndView logout(@ModelAttribute MemberVO mvo,HttpServletRequest request){
		System.out.println("controller의 logout진입");
		
		HttpSession hs = request.getSession(true);
		String mid =(String)hs.getAttribute("mid");

		ModelAndView mav = new ModelAndView();
		if(mid==null){
			System.out.println("로그인 안되어있음!");
			mav.addObject("result","세션없음");
		}
		else{
			System.out.println("로그아웃 할 mid : "+mid);
			hs.invalidate();
			System.out.println("hs 삭제함");
			System.out.println("로그아웃 성공");
			mav.addObject("result","로그아웃성공");
		}
		mav.setViewName("../../index");

		return mav;
	}

	@RequestMapping("/memberDelete")
	@ResponseBody
	public String memberDelete(@ModelAttribute MemberVO mvo,Model model,HttpServletRequest request){
		System.out.println("controller의 delete진입");
		HttpSession hs = request.getSession(true);
		String resultStr="";
		int result = loginService.memberDelete(mvo);
		
		if(result>0){ resultStr="TRUE"; hs.invalidate();}
		else resultStr= "FALSE";
		
		return resultStr;
	}
	
	/*
	 * --------------------이동 목적 함수들-------------------------
	 */
	//로그인폼 부르는 함수
	@RequestMapping("/goLogin")
	public ModelAndView goLogin(){
		System.out.println("controller의 goLogin진입");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH+"/login");
		//세션 있으면 로그인페이지로 접근 못하도록 세션적용된것 사용해야함!!(나중에)

		return mav;
	}
	@RequestMapping("/goIdFindPrint")
	public ModelAndView goIdFindPrintPage(@ModelAttribute MemberVO mvo){
		System.out.println("controller의 goIdFindPrintPage진입");
		List<MemberVO> list = loginService.searchID(mvo);
		ModelAndView mav = new ModelAndView();
		System.out.println("print가는 컨트롤러로 들어온 email : "+mvo.getMemail());
		mav.addObject("searchIDList",list);
		mav.setViewName(CONTEXT_PATH+"/idFindPrint");

		return mav;
	}
	@RequestMapping("/goSendMail")
	public ModelAndView goSendMailPage(@ModelAttribute MemberVO mvo){
		System.out.println("controller의 goSendMailPage진입");
		List<MemberVO> list = loginService.searchID(mvo);
		ModelAndView mav = new ModelAndView();
		String memail = mvo.getMemail();
		System.out.println("semdMail로 가는 memail : "+memail);
		System.out.println("sendMail가는 컨트롤러로 들어온 number : "+mvo.getNumber());
		mav.addObject("searchIDList",list);
		mav.addObject("memail",memail);
		mav.setViewName(CONTEXT_PATH+"/sendMail");

		return mav;
	}
	//로그인페이지로 가는 함수
	@RequestMapping("/loginPage")
	public ModelAndView goLoginPage(){
		System.out.println("controller의 goLoginPage진입");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH+"/memberLogin");
		//세션 있으면 로그인페이지로 접근 못하도록 세션적용된것 사용해야함!!(나중에)

		return mav;
	}
	//id찾기 페이지로 가는 함수
	@RequestMapping("/goIdFind")
	public ModelAndView goIdFindPage(){
		System.out.println("controller의 goIdFindPage진입");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH+"/idFind");

		return mav;
	}
	//id찾기 시 메일확인창(페이지)로 가는 함수
	@RequestMapping("/goTestMail")
	public ModelAndView goTestMailPage(@ModelAttribute MemberVO mvo){
		System.out.println("controller의 goTestMailPage진입");
		String number = mvo.getNumber();
		String memail = mvo.getMemail();
		System.out.println("컨트롤러로 들어온 memail : "+memail);
		System.out.println("컨트롤러로 받아온 number : "+number);
		ModelAndView mav = new ModelAndView();
		mav.addObject("number",number);
		mav.addObject("memail",memail);
		mav.setViewName(CONTEXT_PATH+"/test_mail");

		return mav;
	}
	//PW찾기 페이지로 가는 함수
	@RequestMapping("/goSearchPW")
	public ModelAndView goSearchPWPage(){
		System.out.println("controller의 goSearchPWPage진입");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH+"/pwFind");

		return mav;
	}
	//index.jsp 로 가는 함수
	@RequestMapping("/goIndex")
	public ModelAndView goIndexPage(){
		System.out.println("Controller의 goIndexPage진입");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("../../index");
		return mav;
	}
	//DeleteNotice.jsp 로 가는 함수
	@RequestMapping("/goDeleteNotice")
	public ModelAndView goDeleteNoticePage(){
		System.out.println("Controller의 goDeleteNoticePage진입");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH+"/deleteNotice");
		return mav;
	}
	//DeleteNotice.jsp 로 가는 함수
	@RequestMapping("/goMemberDelete")
	public ModelAndView goMemberDeletePage(){
		System.out.println("Controller의 goMemberDeletePage진입");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH+"/memberDelete");
		return mav;
	}
}