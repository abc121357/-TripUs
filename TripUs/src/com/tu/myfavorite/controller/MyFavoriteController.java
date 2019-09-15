package com.tu.myfavorite.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
		String mygrade="1";
		if(Integer.parseInt(mygrade)==0){
		param.setMno("M201909150001");
		System.out.println("listmyFavorite 실행");
		mav.addObject("myFavorite",myfavoriteService.listMyFavorite(param));
		mav.setViewName(CONTEXT_PATH+"/myfavorite");		
			
		}
		else{
		param.setMno("M201909150001");
		param.setMygrade(mygrade);
		System.out.println("mygrade : " + mygrade);
		System.out.println("selectmyFavorite 실행");
		mav.addObject("myFavorite",myfavoriteService.selectMyFavorite(param));
		mav.setViewName(CONTEXT_PATH+"/myfavorite");
		}
		

		System.out.println("mygrade : "+ mygrade);
		
		System.out.println();
		System.out.println("selectmyFavorite 끝");
		
		return mav;

	}
	
	@RequestMapping("/insertMyFavorite")
	@ResponseBody
	public ModelAndView insertmyfavorite(@ModelAttribute MyFavoriteVO param,int contentId,String title,String addr1){
		System.out.println("insertmyFavorite 진입");
		
		int result=0;
		param.setMyno("MY201909150002"); //이건 채번으로 만든다.
		param.setMno("M201909150001"); // 유저 고유번호
		param.setMyid("test01"); // 유저 아이디
		param.setMylocation(addr1); // api 주소
		param.setMycno(contentId); // api 컨텐츠 번호
		param.setMytitle(title); // api 컨텐츠 제목
		param.setMylink("/restaurant/goboard.do?"+contentId);
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
	@ResponseBody
	public ModelAndView deletemyfavorite(@ModelAttribute MyFavoriteVO param,String myno){
		
		System.out.println("deleteMyFavorite시작");
		System.out.println("myno : "+ myno);
		int result=0;
		param.setMyno(myno);
		result=myfavoriteService.deleteMyFavorite(param);
		
		
		ModelAndView mav=new ModelAndView();
		String resultStr="즐겨찾기 삭제 성공";
		
		if(result==0){
			resultStr="즐겨찾기 삭제 실패..";
		}
		
		mav.addObject("result",resultStr);
		mav.addObject("myno",myno);
		mav.setViewName(CONTEXT_PATH+"/result");
		

		System.out.println("deleteMyFavorite끝");
		
		return mav;
	}
	
	
}
