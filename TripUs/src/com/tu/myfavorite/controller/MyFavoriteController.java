package com.tu.myfavorite.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tu.myfavorite.service.MyFavoriteService;
import com.tu.myfavorite.vo.MyFavoriteVO;

/**
 클래스명 : MyFavoriteController
 날 짜 : 2019-09-05
 작성자명 : LHJ
 */
@Controller
@RequestMapping(value="/mypage")
public class MyFavoriteController {

	private final String CONTEXT_PATH="mypage";
	
	//의존관계지정
	@Autowired
	private MyFavoriteService myfavoriteService;
	
	
	@RequestMapping("/myfavorite")
	public ModelAndView selectmyfavorite(@ModelAttribute MyFavoriteVO param,HttpServletRequest request){
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("mid");
		
		System.out.println("selectmyFavorite 진입");
		ModelAndView mav= new ModelAndView();
		String mygrade="0";
		if(Integer.parseInt(mygrade)==0){
		param.setMno("M201908270001");
		mav.addObject("myFavorite",myfavoriteService.listMyFavorite(param));
		mav.setViewName(CONTEXT_PATH+"/myfavorite");		
			
		}
		else{
		param.setMno("M201908270001");
		param.setMygrade(mygrade);
		mav.addObject("myFavorite",myfavoriteService.selectMyFavorite(param));
		mav.setViewName(CONTEXT_PATH+"/myfavorite");
		}
		System.out.println("selectmyFavorite 끝");
		
		return mav;

	}
	
	@RequestMapping("/insertMyFavorite")
	public ModelAndView insertmyfavorite(@ModelAttribute MyFavoriteVO param){
		System.out.println("insertmyFavorite 진입");
		
		int result=0;
		param.setMyno("MY20190905"); //이건 채번으로 만든다.
		param.setMno("M20190826"); // 이건 memberVO no값을 가져온다.
		param.setMyid("test01"); //이것도 memberVO id값을 가져온다.
		param.setMylocation("경기도 안산시"); //이건 즐겨찾기에 추가할때 테이블에서 가져온다.
		param.setMylink("c://www.com"); //이것도 즐겨찾기에 추가할때 테이블에서 가져온다.
		result=myfavoriteService.insertMyFavorite(param);
	
		ModelAndView mav = new ModelAndView();
		String resultStr="즐겨찾기 등록 성공";
		if(result==0)
		resultStr="즐겨찾기 등록 실패..";
		mav.addObject("result",resultStr);
		mav.setViewName(CONTEXT_PATH+"/result");
		
		return mav;
	}
	
	@RequestMapping("/deleteMyFavorite")
	public ModelAndView deletemyfavorite(@ModelAttribute MyFavoriteVO param){
		
		System.out.println("deleteMyFavorite시작");
		int result=0;
		param.setMyno("MY201908270001");
		result=myfavoriteService.deleteMyFavorite(param);
		
		
		ModelAndView mav=new ModelAndView();
		String resultStr="즐겨찾기 삭제 성공";
		
		if(result==0){
			resultStr="즐겨찾기 삭제 실패..";
		}
		
		mav.addObject("result",resultStr);
		mav.setViewName(CONTEXT_PATH+"/result");
		

		System.out.println("deleteMyFavorite끝");
		
		return mav;
	}
	
	
}
