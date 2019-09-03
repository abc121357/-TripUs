package com.tu.lp.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tu.lp.service.LoginService;
import com.tu.lp.vo.LoginVO;

@Controller
@RequestMapping(value="/login")
public class LoginController{
	
	private static final String CONTEXT_PATH="login";
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("/memberLogin")
	public ModelAndView memberLogin(@ModelAttribute LoginVO lvo){
		System.out.println("controller의 memberLogin진입");
		
		List<LoginVO> list = new ArrayList<LoginVO>();
		list = loginService.login(lvo);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("loginList",list);
		mav.setViewName(CONTEXT_PATH+ "/memberLoginOK");
		return mav;
	}
		
	
}