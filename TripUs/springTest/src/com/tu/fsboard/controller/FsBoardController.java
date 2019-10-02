package com.tu.fsboard.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tu.fsboard.service.FsBoardService;
import com.tu.fsboard.vo.FsBoardVO;
import com.tu.mem.vo.MemberVO;

/**
클래스명 : FsBoardController
날 짜 : 2019-09-06
작성자명 : 강 희 진
*/

@Controller
@RequestMapping(value="/fsBoard")
public class FsBoardController {
	private static final String CONTEXT_PATH="fsBoard";
		
	@Autowired
	private FsBoardService fsBoardService;
		
	@RequestMapping("/selectContentID")
	@ResponseBody
	public String selectContentID(@ModelAttribute FsBoardVO fvo,Model model){
		System.out.println("controller의 selectContentID진입");
		System.out.println("컨트롤러로 넘어온 viewno : "+fvo.getViewno());
		
		List<FsBoardVO> list = new ArrayList<FsBoardVO>();
		list = fsBoardService.selectContentID(fvo);
		System.out.println("list : "+list);
		FsBoardVO fvo1 = new FsBoardVO();
		fvo1 = list.get(0);
		System.out.println("fvo1 : "+fvo1.toString());
		String url1 = fvo1.getContentid();
		return url1;
	}
		
	@RequestMapping(value="/goBoard", produces = "application/json; charset=utf8")
	public ModelAndView goBoardPage(@ModelAttribute FsBoardVO fvo){
		System.out.println("controller의 goBoardPage진입");
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println("fvo.setViewno에 저장된 값 : "+fvo.getViewno());
		mav.setViewName(CONTEXT_PATH+"/board");
		mav.addObject("viewno",fvo.getViewno());
		return mav;
	}
	@RequestMapping(value="/goFestivalMain")
	public ModelAndView goCourseMainPage(@ModelAttribute FsBoardVO fvo){
		System.out.println("controller의 gofestivalMainPage진입");
		List<FsBoardVO> list = fsBoardService.fsBoardList(fvo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH+"/festivalMain");
		mav.addObject("fsBoardList",list);
		
		return mav;
	}
}
