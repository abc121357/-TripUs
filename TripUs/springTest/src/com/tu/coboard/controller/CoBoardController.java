package com.tu.coboard.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tu.coboard.service.CoBoardService;
import com.tu.coboard.vo.CoBoardVO;
import com.tu.mem.vo.MemberVO;

//import com.tu.coboard.service.CoBoardService;


/**
클래스명 : CoBoardController
날 짜 : 2019-09-03
작성자명 : 김 해 원
*/

@Controller
@RequestMapping(value="/coBoard")
public class CoBoardController {
	private static final String CONTEXT_PATH="coBoard";
		
	@Autowired
	private CoBoardService coBoardService;
		
	@RequestMapping("/selectContentID")
	@ResponseBody
	public String selectContentID(@ModelAttribute CoBoardVO cvo,Model model){
		System.out.println("controller의 selectContentID진입");
		System.out.println("컨트롤러로 넘어온 viewno : "+cvo.getViewno());
		
		List<CoBoardVO> list = new ArrayList<CoBoardVO>();
		list = coBoardService.selectContentID(cvo);
		System.out.println("list : "+list);
		CoBoardVO cVO1 = new CoBoardVO();
		cVO1 = list.get(0);
		System.out.println("cVO1 : "+cVO1.toString());
		String url1 = cVO1.getContentid();
		return url1;
	}
		
	@RequestMapping(value="/goBoard", produces = "application/json; charset=utf8")
	public ModelAndView goBoardPage(@ModelAttribute CoBoardVO cvo){
		System.out.println("controller의 goBoardPage진입");
		ModelAndView mav = new ModelAndView();
		
		System.out.println("cvo.setViewno에 저장된 값 : "+cvo.getViewno());
		mav.setViewName(CONTEXT_PATH+"/board");
		mav.addObject("viewno",cvo.getViewno());
		return mav;
	}
	@RequestMapping(value="/goCourseMain")
	public ModelAndView goCourseMainPage(@ModelAttribute CoBoardVO cvo){
		System.out.println("controller의 goCourseMainPage진입");
		List<CoBoardVO> list = coBoardService.coBoardList(cvo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH+"/courseMain");
		mav.addObject("coBoardList",list);
		
		return mav;
	}
}
