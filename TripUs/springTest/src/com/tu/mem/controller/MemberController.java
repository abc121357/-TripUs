package com.tu.mem.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mail.GenerateCertNumber;
import com.tu.mem.service.MemberService;
import com.tu.mem.vo.MemberVO;


/* 컨트롤러 */
@Controller
@RequestMapping(value = "/signup")
public class MemberController {
	private static final String CONTEXT_PATH="signup";
	
	@Autowired
	private MemberService memberService;
	
	/* 회원 전체 조회 */
	@RequestMapping(value = "/listMember")
	public ModelAndView listMember(@ModelAttribute MemberVO param){
		System.out.println("SignUpController listMember >>> ");
		System.out.println("SignUpController listMember param >>> "+param);
		
		List<MemberVO> list = memberService.listMember(param);
		System.out.println("SignUpController listMember list >>> "+list);
		System.out.println("SignUpController listMember list.size() >>>" +list.size());
		
		int listCnt = list.size();
		System.out.println("SignUpController listMember list.size() listCnt >>>" + listCnt);
		for (int i=0; i < listCnt; i++){
			MemberVO mvo = (MemberVO)list.get(i);
			System.out.println("SignUpController listMember mvo.getMno() >>> "+mvo.getMno());
			System.out.println("SignUpController listMember mvo.getMid() >>> "+mvo.getMid());
			System.out.println("SignUpController listMember mvo.getMpw() >>> "+mvo.getMpw());
			System.out.println("SignUpController listMember mvo.getMname() >>> "+mvo.getMname());
			System.out.println("SignUpController listMember mvo.getMnick() >>> "+mvo.getMnick());
			System.out.println("SignUpController listMember mvo.getMgender() >>> "+mvo.getMgender());
			System.out.println("SignUpController listMember mvo.getMhp() >>> "+mvo.getMhp());
			System.out.println("SignUpController listMember mvo.getMemail() >>> "+mvo.getMemail());
			System.out.println("SignUpController listMember mvo.getMbirth() >>> "+mvo.getMbirth());
			System.out.println("SignUpController listMember mvo.getMdeleteyn() >>> "+mvo.getMdeleteyn());
			System.out.println("SignUpController listMember mvo.getMinsertdate()>>> "+mvo.getMinsertdate());
			System.out.println("SignUpController listMember mvo.getMprofile() >>> "+mvo.getMprofile());
			System.out.println("SignUpController listMember mvo.getMgrade() >>> "+mvo.getMgrade());
			System.out.println("SignUpController listMember mvo.getMrecordinsertdate() >>> "+mvo.getMrecordinsertdate());
			System.out.println("SignUpController listMember mvo.getMrecordupdatedate() >>> "+mvo.getMrecordupdatedate());	
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberList",list);
		mav.addObject("paramName",param.getMno());
		mav.setViewName(CONTEXT_PATH + "/insert_list");
		System.out.println("SignUpController listMember mav >>> "+mav);
		
		return mav;
	}
	
	
	/* 회원가입 인서트 */
	@RequestMapping(value = "/insertMember")
	public ModelAndView insertMember(@ModelAttribute MemberVO param){
		System.out.println("SignUpController insertMember() >>> ");
		String resultStr = "";
		int result = memberService.insertMember(param);
		
		if(result>0) resultStr = "INSERT가 완료되었습니다..";
		else resultStr = "INSERT에 오류가 있습니다.";
		
		System.out.println("SignUpController insertMember() >>> " + resultStr);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", resultStr);
		mav.setViewName(CONTEXT_PATH +"/insert_ok");
		
		return mav;
	}
	
	/* 회원가입 이메일 인증 */
	@RequestMapping(value = "/emailCheck")
	@ResponseBody
	public String emailCheck(@RequestParam("memail") String memail){
		System.out.println("SignUpController emailCheck() >>> ");
		System.out.println("RequestParam-memail >>>> "+ memail);
		int count = 0;
		count = memberService.emailCheck(memail);
		System.out.println("SignUpController emailCheck() count >>> " + count);
		String result="";
		if(count>0)
		{ 
			result="false";
		}else{
			GenerateCertNumber gcn = new GenerateCertNumber();
			String num = gcn.excuteGenerate();
			result=num;
		}
		//ModelAndView mav = new ModelAndView();
		//mav.addObject("cnt",count);
		return result;
	}
	
	/* 회원가입 아이디 중복체크 */
	@RequestMapping(value = "/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam("mid") String mid){
		System.out.println("SignUpController idCheck() >>> ");
		System.out.println("RequestParam-mid >>>> "+ mid);
		String result = "";
		int idcheck = memberService.idCheck(mid);
		if(idcheck>0){
			result = "false";
		}else{
			result = "true";
		}
		return result;
	}
	
	/* 회원가입 별명 중복 체크 */
	@RequestMapping(value = "/nickCheck")
	@ResponseBody
	public String nickCheck(@RequestParam("mnick") String mnick) {
		System.out.println("SignUpController nickCheck() >>>> ");
		System.out.println("@RequestParam mnick >>> "+ mnick);
		String result = "";
		int nickcheck = memberService.nickCheck(mnick);
		if(nickcheck>0){
			result = "false";
		}else{
			result = "true";
		}
		return result;
	}
	
	
	
	/* 페이지 이동 -------------------------------------------------------------------------------------- */
	
	/* 회원가입 폼  */
	@RequestMapping(value = "/insertForm")
	public ModelAndView goSignUpPage(){
		System.out.println("SignUpController goSignUpPage() >>> ");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH + "/insert_form");
		return mav;
	}
	
	/* 인증메일 전송 */
	@RequestMapping(value = "/goTestMail")
	public ModelAndView goTestMailPage(@ModelAttribute MemberVO mvo) {
		System.out.println("SignUpController goTestMailPage() >>> ");
		String number = mvo.getNumber();
		System.out.println("컨트롤러로 받아온 number >>> " + number);
		ModelAndView mav = new ModelAndView();
		mav.addObject("number", number);
		mav.setViewName(CONTEXT_PATH + "/testmail");
		
		return mav;
	}
	
	/* 회원가입 폼  */
	@RequestMapping(value = "/newFile")
	public ModelAndView SignUpPage(){
		System.out.println(" >>> ");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(CONTEXT_PATH + "/newFile");
		return mav;
	}
	
}
