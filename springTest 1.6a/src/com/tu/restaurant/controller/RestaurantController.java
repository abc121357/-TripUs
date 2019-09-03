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
		List<TurtcommVO> aList=restaurantService.listrescomment(param);
		System.out.println("list내용 콘솔출력 /");
		for(int i=0; i<aList.size(); i++){
			TurtcommVO tVo=(TurtcommVO)aList.get(i);
			System.out.println(i+"번째 내역");
			System.out.println("rtnick : "+tVo.getRtnick());
			System.out.println("rtprofile : "+tVo.getRtprofile());
			System.out.println("rtcontent : "+tVo.getRtcontent());
			System.out.println("rtinsertdate : " + tVo.getRtinsertdate());
			
		}
		
		List<TurbboardVO> hList=restaurantService.selectseasonbesthit();
		ModelAndView mav=new ModelAndView();
		mav.addObject("restaurantlist",aList);
		mav.addObject("hitlist",hList);
		mav.setViewName(CONTEXT_PATH+"/restaurant");
		
		System.out.println("listrestaurant 끝");
		
		return mav;
	}
	
	@RequestMapping("/insertrescomment")
	public ModelAndView insertResComm(@ModelAttribute TurtcommVO param){
		
		System.out.println("");
		
		int result=0;
		result=restaurantService.insertrescomment(param);
		
		ModelAndView mav = new ModelAndView();
		
		
		String resultStr="완료";
		if(result==0){
			resultStr="실패..";
		}
		mav.addObject("result", resultStr);
		mav.setViewName(CONTEXT_PATH+"/result");
		
		
		return mav;
		
	}
	
	
	
}
