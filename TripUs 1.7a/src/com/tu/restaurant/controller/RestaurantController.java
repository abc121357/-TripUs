package com.tu.restaurant.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tu.restaurant.service.RestaurantService;
import com.tu.restaurant.vo.TurtcommVO;
import com.tu.restaurantboard.vo.TurbboardVO;

@Controller
@RequestMapping(value="/restaurant")
public class RestaurantController {

	private final String CONTEXT_PATH="restaurant";
	
	//set
	
	@Autowired
	private RestaurantService restaurantService;
	
	//매핑
	@RequestMapping("/restaurant")
	public ModelAndView listrestaurant(@ModelAttribute TurtcommVO param){
		
		System.out.println("listrestaurant 진입");
		List<TurtcommVO> aList=restaurantService.listResComment(param);
		System.out.println("list내용 콘솔출력 /");
		for(int i=0; i<aList.size(); i++){
			TurtcommVO tVo=(TurtcommVO)aList.get(i);
			System.out.println(i+"번째 내역");
			System.out.println("rtnick : "+tVo.getRtnick());
			System.out.println("rtprofile : "+tVo.getRtprofile());
			System.out.println("rtcontent : "+tVo.getRtcontent());
			System.out.println("rtinsertdate : " + tVo.getRtinsertdate());
			
		}
		
		List<TurbboardVO> hList=restaurantService.selectSeasonBestHit();
		ModelAndView mav=new ModelAndView();
		mav.addObject("restaurantlist",aList);
		mav.addObject("hitlist",hList);
		mav.setViewName(CONTEXT_PATH+"/restaurant");
		
		System.out.println("listrestaurant 끝");
		
		return mav;
	}
	
	@RequestMapping("/insertResComm")
	public ModelAndView insertResComm(@ModelAttribute TurtcommVO param){
		
		System.out.println("insertResComm진입");
		
		int result=0;
		result=restaurantService.insertResComm(param);
		
		ModelAndView mav = new ModelAndView();
		
		
		String resultStr="상세정보 입력 완료";
		if(result==0){
			resultStr="상세정보 입력 실패..";
		}
		mav.addObject("result", resultStr);
		mav.setViewName(CONTEXT_PATH+"/result");
		
		
		return mav;
		
	}

	@RequestMapping("/updateResComm")
	public ModelAndView updateResComm(@ModelAttribute TurtcommVO param){

		System.out.println("updateResComm 진입");

		int result=0;
		result=restaurantService.updateResComm(param);

		ModelAndView mav = new ModelAndView();

		String resultStr="상세정보 댓글 수정 완료";

		if(result==0){
			resultStr="상세정보 댓글 수정 실패..";
		}
		mav.addObject("result",resultStr);
		mav.setViewName(CONTEXT_PATH+"/result");

		return mav;


	}

	@RequestMapping("/deleteResComm")
	public ModelAndView deleteResComm(@ModelAttribute TurtcommVO param){

		System.out.println("deleteResComm 진입");

		int result=0;
		result=restaurantService.deleteResComm(param);

		ModelAndView mav = new ModelAndView();

		String resultStr="상세정보 삭제 완료";
		if(result==0){
			resultStr="상세정보 삭제 실패..";
		}
		mav.addObject("result",resultStr);
		mav.setViewName(CONTEXT_PATH+"/deleterescomm");

		return mav;


	}

	
	
}
