package com.tu.myfavorite.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tu.myfavorite.service.MyfavoriteService;
import com.tu.myfavorite.vo.MyFavoriteVO;

@Controller
@RequestMapping(value="/myfavorite")
public class MyFavoriteController {

	private final String CONTEXT_PATH="mypage";
	
	//의존관계지정
	@Autowired
	private MyfavoriteService myfavoriteService;
	
	
	@RequestMapping("/myfavorite")
	public ModelAndView selectmyfavorite(@ModelAttribute String mygrade){
		System.out.println("selectmyFavorite 진입");
		mygrade="1";
		ModelAndView mav= new ModelAndView();
		mav.addObject("myFavorite",myfavoriteService.selectMyFavorite(mygrade));
		mav.setViewName(CONTEXT_PATH+"/myfavorite");
		System.out.println(equals(myfavoriteService.selectMyFavorite(mygrade)));
		System.out.println("selectmyFavorite 끝");
		return mav;
	}
	
	@RequestMapping("/insertMyFavorite")
	public ModelAndView insertmyfavorite(@ModelAttribute MyFavoriteVO param){
		System.out.println("insertmyFavorite 진입");
		
		int result=0;
		result=myfavoriteService.insertMyFavorite(param);
	
		ModelAndView mav = new ModelAndView();
		String resultStr="등록 성공";
		if(result==0)
		resultStr="등록 실패..";
		mav.addObject("result",resultStr);
		mav.setViewName(CONTEXT_PATH+"/result");
		
		return mav;
	}
	
	@RequestMapping("/deleteMyFavorite")
	public ModelAndView deletemyfavorite(@ModelAttribute MyFavoriteVO param){
		
		System.out.println("deleteMyFavorite시작");
		int result=0;
		result=myfavoriteService.deleteMyFavorite(param);
		
		
		ModelAndView mav=new ModelAndView();
		String resultStr="등록성공";
		
		if(result==0){
			resultStr="등록 실패..";
		}
		
		mav.addObject("result",resultStr);
		mav.setViewName(CONTEXT_PATH+"/result");
		

		System.out.println("deleteMyFavorite끝");
		
		return mav;
	}
	
	
}
