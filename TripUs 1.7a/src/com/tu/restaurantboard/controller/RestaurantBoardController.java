package com.tu.restaurantboard.controller;

import java.util.List;

import com.tu.mem.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tu.restaurantboard.service.RestaurantBoardService;
import com.tu.restaurantboard.vo.TurbboardVO;


@Controller
@RequestMapping(value="/restaurant")
public class RestaurantBoardController {

	
	private final String CONTEXT_PATH="restaurant";
	
	//set
	@Autowired
	private RestaurantBoardService restaurantBoardService;

	//매핑
	//후기게시판의 목록을 나열
	@RequestMapping("/listresBoard")
	public ModelAndView listrestaurantBoard(@ModelAttribute TurbboardVO param){
		
		
		System.out.println("listrestaurantBoard 진입");
		List<TurbboardVO> list=restaurantBoardService.listResBoardList(param);
		System.out.println("list내용 콘솔출력 /");
		
		for(int i=0; i<list.size(); i++){
			TurbboardVO tVo=(TurbboardVO)list.get(i);
			System.out.println(i+"번째 내역");
			System.out.println("rbid : "+tVo.getRbno());
			System.out.println("rbtitle : "+tVo.getRbtitle());
			System.out.println("rbhit : "+tVo.getRbhit());
			System.out.println("rbinsertdate : " + tVo.getRbinsertdate());
			
		}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("listResBoard",list);
		mav.setViewName(CONTEXT_PATH+"/listresBoard");
		
		System.out.println("resBoardList 처리 끝");
		
		return mav;




	}


	@RequestMapping("/resBoard")
	public ModelAndView writeBoard(@ModelAttribute MemberVO param){
		System.out.println("wirteBoard 진입");
		MemberVO mVo=new MemberVO();
		mVo.setMno("M201909030001");
		ModelAndView mav=new ModelAndView();
		mav.addObject("MemberNo",param);
		mav.setViewName(CONTEXT_PATH+"/resBoard");
		System.out.print("mav : "+mav.getViewName());
		return mav;
	}


	//후기 게시판의 게시글 테이블 입력
	@RequestMapping("/insertResBoard")
	public ModelAndView insertBoard(TurbboardVO param){
	param.setRbno("rb0015");
	param.setRbtitle("제목");
	param.setRbcontent("내용");
	param.setRbid("test01");
	param.setRbimage("https://aaa.com");
	param.setRbtag("봄,여름,가을,겨울");
	System.out.println("글 번호 : " + param.getRbno());
	System.out.println("글 제목 : " + param.getRbtitle());
	System.out.println("글 내용 : " + param.getRbcontent());
	System.out.println("글 작성자id : " + param.getRbid());
	System.out.println("글 이미지링크 : " + param.getRbimage());
	System.out.println("글 태그 : " + param.getRbtag());
	int result =restaurantBoardService.insertResBoard(param);
	String resultStr = "등록 완료!!";
		if(result==0)
			resultStr="등록 실패..";
			
		ModelAndView mav=new ModelAndView();
		mav.addObject("result",resultStr);
		mav.setViewName(CONTEXT_PATH+"/result");
		return mav;
		
	}

	
	//후기 게시판의 게시글 테이블 수정
	
	@RequestMapping("/updateResBoard")
	public ModelAndView updateBoard(TurbboardVO param){
		
		int result=0;
		
		result=restaurantBoardService.updateResBoard(param);
		ModelAndView mav=new ModelAndView();
		String resultstr="성공";
		if(result==0){
			resultstr="실패..";
		}
		mav.addObject("result",resultstr);
		mav.setViewName(CONTEXT_PATH+"/result");

		return mav;
	}

	@RequestMapping("/deleteResBoard")
	public ModelAndView deleteBoard(TurbboardVO param){

		int result=0;

		result=restaurantBoardService.deleteResBoard(param);

		ModelAndView mav=new ModelAndView();


		String resultstr="성공";
		if(result==0){
			resultstr="실패..";
		}
		mav.addObject("result",resultstr);
		mav.setViewName(CONTEXT_PATH+"/result");
		
		return mav;

	}

}

