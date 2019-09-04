package com.tu.restaurantboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tu.restaurantboard.service.RestaurantBoardCommService;
import com.tu.restaurantboard.vo.TurccommVO;

/**
파일명: RestaurantBoardCommController
설 명: 맛집 후기 게시글의 댓글을 위한 Controller
작성일: 2019/9/2
작성자: LHJ
*/

@Controller
@RequestMapping(value="/restaurant")
public class RestaurantBoardCommController {

	private final String CONTEXT_PATH="restaurant";
	
	@Autowired
	private RestaurantBoardCommService restaurantBoardCommService;
	
	@RequestMapping("/resBoardComm")
	public ModelAndView listResBoardComm(@ModelAttribute TurccommVO param){
		
		System.out.println("listresBoardComm 진입");
		List<TurccommVO> list=restaurantBoardCommService.listResBoardComm(param);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("BoardcommList",list);
		mav.setViewName(CONTEXT_PATH+"/resBoardComm");
		
		
		return mav;
		
	}

	@RequestMapping("/insertResBoardComm")
	public ModelAndView insertResBoardComm(@ModelAttribute TurccommVO param){

		int result=0;


		result=restaurantBoardCommService.insertResBoardComm(param);
		ModelAndView mav=new ModelAndView();
		String resultstr="성공";
		if(result==0){
			resultstr="실패";
		}
		mav.addObject("result",resultstr);
		mav.setViewName(CONTEXT_PATH+"/result");


		return mav;
	}

	@RequestMapping("/updateResBoardComm")
	public ModelAndView updateResBoardComm(@ModelAttribute TurccommVO param){

		int result=0;

		result = restaurantBoardCommService.updateResBoardComm(param);

		String resultstr="성공";
		if(result==0){
			resultstr="실패";
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("result",resultstr);
		mav.setViewName(CONTEXT_PATH+"/result");

		return mav;

	}

	@RequestMapping("/deleteResBoardComm")
	public ModelAndView deleteResBoardComm(@ModelAttribute TurccommVO param){

		int result=0;

		result = restaurantBoardCommService.deleteResBoardComm(param);

		String resultstr="성공";
		if(result==0){
			resultstr="실패";
		}

		ModelAndView mav=new ModelAndView();
		mav.addObject("result",resultstr);
		mav.setViewName(CONTEXT_PATH+"/result");

		return mav;

	}
	
	
}
