package com.tu.toboard.controller;

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
import com.tu.toboard.service.ToBoardService;
import com.tu.toboard.vo.ToBoardVO;

//import com.tu.coboard.service.CoBoardService;

@Controller
@RequestMapping(value = "/toBoard")
public class ToBoardController {
	private static final String CONTEXT_PATH = "toBoard";

	@Autowired
	private ToBoardService toBoardService;

	@RequestMapping("/selectContentID")
	@ResponseBody
	public String selectContentID(@ModelAttribute ToBoardVO tvo, Model model) {
		System.out.println("controller�쓽 selectContentID吏꾩엯");
		System.out.println("而⑦듃濡ㅻ윭濡� �꽆�뼱�삩 viewno : " + tvo.getViewno());

		List<ToBoardVO> list = new ArrayList<ToBoardVO>();
		list = toBoardService.selectContentID(tvo);
		System.out.println("list : " + list);
		ToBoardVO cVO1 = new ToBoardVO();
		cVO1 = list.get(0);
		System.out.println("cVO1 : " + cVO1.toString());
		String url1 = cVO1.getContentid();
		System.out.println("url1 : " + url1);
		return url1;
	}

	@RequestMapping(value = "/goBoard", produces = "application/json; charset=utf8")
	public ModelAndView goBoardPage(int contentid) {
		System.out.println("controller의 goBoardPage진입");

		ModelAndView mav = new ModelAndView();

		System.out.println("contentid : " + contentid);
		mav.setViewName(CONTEXT_PATH + "/board");
		mav.addObject("contentid", contentid);
		return mav;
	}

	@RequestMapping(value = "/goTourMain")
	public ModelAndView goTourMainPage(@ModelAttribute ToBoardVO tvo) {
		System.out.println("controller�쓽 goCourseMainPage吏꾩엯");
		List<ToBoardVO> list = toBoardService.toBoardList(tvo);

		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH + "/tourMain");
		mav.addObject("toBoardList", list);

		return mav;
	}

	// 1.지역별 정보 리스트 화면으로 이동
	@RequestMapping(value = "/resAreaSub", produces = "application/json; charset=utf8")
	@ResponseBody
	public ModelAndView goAreaSelectPage(int areaCode) {
		System.out.println("controller의 resSubPage진입");
		System.out.print("areaCode : " + areaCode);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH + "/resAreaSub");
		mav.addObject("areaCode", areaCode);
		return mav;
	}
}
