package com.tu.resboard.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.tu.mem.vo.MemberVO;
import com.tu.resboard.service.ResBoardService;
import com.tu.resboard.vo.ResBoardVO;

//import com.tu.coboard.service.CoBoardService;


/**
클래스명 : ResBoardController
날 짜 : 2019-09-06
작성자명 : LHJ
*/

@Controller
@RequestMapping(value="/restaurant")
public class ResBoardController {
	private static final String CONTEXT_PATH="restaurant";
		
	@Autowired
	private ResBoardService resBoardService;		
	@RequestMapping("/selectContentID")
	@ResponseBody
	public String selectContentID(@ModelAttribute ResBoardVO tvo,Model model){
		System.out.println("controller의 selectContentID진입");
		System.out.println("컨트롤러로 넘어온 viewno : "+tvo.getViewno());
		
		List<ResBoardVO> list = new ArrayList<ResBoardVO>();
		list = resBoardService.selectContentID(tvo);
		System.out.println("list : "+list);
		ResBoardVO cVO1 = new ResBoardVO();
		cVO1 = list.get(0);
		System.out.println("cVO1 : "+cVO1.toString());
		String url1 = cVO1.getContentid();
		System.out.println("url1 : "+url1);
		return url1;
	}
	
	
	//1.정보 리스트 화면으로 이동
	@RequestMapping(value="/resSub")
	public ModelAndView goTourMainPage(@ModelAttribute ResBoardVO tvo){
		System.out.println("controller의 goCourseMainPage진입");
		List<ResBoardVO> list = resBoardService.resBoardList(tvo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH+"/resSub");
		mav.addObject("resBoardList",list);
		
		return mav;
	}
	
	//2.정보 상세보기로 이동
	@RequestMapping(value="/goBoard", produces = "application/json; charset=utf8")
	public ModelAndView goBoardPage(@ModelAttribute ResBoardVO tvo){
		System.out.println("controller의 goBoardPage진입");
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println("tvo.setViewno에 저장된 값 : "+tvo.getViewno());
		mav.setViewName(CONTEXT_PATH+"/board");
		mav.addObject("viewno",tvo.getViewno());
		return mav;
	}
	
	
}
