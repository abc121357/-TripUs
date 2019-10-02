package com.tu.ntboard.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tu.ntboard.service.NtBoardService;
import com.tu.ntboard.vo.NtBoardVo;

@Controller
@RequestMapping(value="/notice")
public class NtBoardController {
	
	//constructor field
	private static final String CONTEXT_PATH = "notice";
	
	@Autowired 
	private NtBoardService ntBoardService;
	
	//full post page
	@RequestMapping("/ntBoardList") 
	public ModelAndView ntBoardList(@ModelAttribute NtBoardVo ntvo) {
		System.out.println("NtBoardController.ntBoardList SUCCESS >>> : ");
		System.out.println(ntvo.getNtsearchcondition());
		System.out.println(ntvo.getNtsearchkeyword());
		System.out.println(ntvo.getNtid());
			
		List<NtBoardVo> ntList =  ntBoardService.ntBoardList(ntvo);
		System.out.println(ntList);
		System.out.println("ntList.size()" + ntList.size());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("ntBoardListCont",ntList);
		mav.addObject("ntsearchcondition", ntvo.getNtsearchcondition());
		mav.addObject("ntsearchkeyword", ntvo.getNtsearchkeyword());
		mav.setViewName(CONTEXT_PATH + "/ntBoardList");
			
		return mav;
		}
		
		
	//insert Write Form page
	@RequestMapping("/ntBoardSelect") 
	public ModelAndView ntBoardSelect(@ModelAttribute NtBoardVo ntvo) {
		System.out.println("NtBoardController.ntBoardSelect SUCCESS >>> : ");
			
		ModelAndView mav = new ModelAndView();
			
		if (ntvo.getNtno().equals("")) {
			mav.addObject("ntMode","ntInsert");
		}else{
			mav.addObject("NtBoardUpdate", ntBoardService.ntBoardDetail(ntvo));
			mav.addObject("ntMode", "ntUpdate");
		}
			mav.setViewName(CONTEXT_PATH + "/ntBoardInsert");
			
			return mav;
		}
		
		
	//detail page
	@RequestMapping("/ntBoardDetail")
	public ModelAndView ntBoardDetail(@ModelAttribute NtBoardVo ntvo, HttpServletRequest request, 
									  HttpServletResponse response, HttpSession session) {
		System.out.println("NtBoardController.ntBoardDetail SUCCESS >>> : ");
		System.out.println(ntvo.getNtno());
	  	
		//setting for hit Start
			//get saved cookie
			Cookie[] ntCookie = request.getCookies();
			String ntCookieValue = null;
			
			for(int i=0; i<ntCookie.length; i++) {
				ntCookieValue = ntCookie[0].getValue();
				System.out.println("NtBoardController.ntBoardDetail ntCookieValue confirm >>> : " + ntCookieValue);
			}
			
			//cookie insert session
			if(session.getAttribute(ntvo.getNtno() + ":cookie") == null) {
				session.setAttribute(ntvo.getNtno() + ":cookie", ntvo.getNtno() + ":" + ntCookieValue );
			} else { 
				 session.setAttribute(ntvo.getNtno() + ":cookie ex", session.getAttribute(ntvo.getNtno() + ":cookie"));
				 
				 if(!session.getAttribute(ntvo.getNtno() + ":cookie").equals(ntvo.getNtno() + ":" + ntCookieValue)) {
			            session.setAttribute(ntvo.getNtno() + ":cookie", ntvo.getNtno() + ":" + ntCookieValue);
			         }
			}
			
			if(!session.getAttribute(ntvo.getNtno() + ":cookie").equals(session.getAttribute(ntvo.getNtno() + ":cookie ex"))) {
		         int resultSession = ntBoardService.ntUpdateViewCnt(ntvo);
		      }
		//setting for hit End
		
		ModelAndView mav = new ModelAndView();
	  	
		mav.addObject("ntBoardDetail",ntBoardService.ntBoardDetail(ntvo)); 
	  	mav.setViewName(CONTEXT_PATH + "/ntBoardDetail");
	  	System.out.println(session.getAttribute(ntvo.getNtno() + ":cookie") + "세션1");
	    System.out.println(session.getAttribute(ntvo.getNtno() + ":cookie ex") + "세션2"); 
	  	
	    return mav;
	}

	//insert function
	@RequestMapping("/ntBoardInsert") 
	public ModelAndView ntBoardInser(@ModelAttribute NtBoardVo ntvo) {
		System.out.println("NtBoardController.ntBoardInsert SUCCESS >>> : ");
					
		ntvo.setNthit("0");
					
		String ntResultStr = "";
		int result = ntBoardService.ntBoardInsert(ntvo);

		if(result > 0) {
			ntResultStr = "Post registration was successful.";
		} else {
			ntResultStr = "Post registration failed.";
		  }
					
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", ntResultStr);
		mav.setViewName(CONTEXT_PATH + "/ntResult");
				
		return mav;
	}	
		
	//update function
	@RequestMapping("/ntBoardUpdate")
	public ModelAndView ntBoardUpdate(@ModelAttribute NtBoardVo ntvo) {
		System.out.println("NtBoardController.ntBoardUpdate SUCCESS >>> : ");
		System.out.println("NtBoardController.ntBoardUpdate ntno confirm >>> :  "+ ntvo.getNtno());
	      
		String ntResultStr ="";
		int result =  ntBoardService.ntBoardUpdate(ntvo);
		
		if (result > 0) {
			ntResultStr = "Post edit was successful.";
		} else {
			ntResultStr = "Editing post failed.";
		 }
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", ntResultStr);
		mav.setViewName(CONTEXT_PATH + "/ntResult");
	    
		return mav;
	}
	   
	 //delete function
	 @RequestMapping("/ntBoardDelete")
	 public ModelAndView ntBoardDelete(@ModelAttribute NtBoardVo ntvo) {
		 System.out.println("NtBoardController.ntBoardDelete SUCCESS >>> : ");
		 
		  String ntResultStr ="";
	      int result = ntBoardService.ntBoardDelete(ntvo);
	      
	      if (result > 0) {
	    	  ntResultStr = "Successfully deleted post.";
		  } else {
			  ntResultStr = "Deleting a post failed.";
			}
	      
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("result", ntResultStr);
	      mav.setViewName(CONTEXT_PATH + "/ntResult");
	     
	      return mav;
	   }
	   
}
