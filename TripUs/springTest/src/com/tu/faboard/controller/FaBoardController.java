package com.tu.faboard.controller;

import java.util.List;








import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tu.faboard.service.FaBoardService;
import com.tu.faboard.vo.FaPaging;
import com.tu.faboard.vo.FaVo;

@Controller
@RequestMapping(value="/faq")
public class FaBoardController{
	
	//constructor paging field
	private static final int ENTRY_SIZE = 10;
	private static final int START_NUM = 1;
	
	//constructor field
	private static final String CONTEXT_PATH = "faq";
	
	@Autowired 
	private FaBoardService faBoardService;
	
	//full post page
	@RequestMapping("/faBoardList") 
	public ModelAndView faBoardList(@ModelAttribute FaVo fvo,
			//@RequestParam(defaultValue = "1", required = false, value = "pageno") int pageNo, // /faBoardList? -> pageno = 1
			HttpServletRequest request){
		System.out.println("FaBoardController.faBoardList SUCCESS >>> : ");
		
		System.out.println("FaBoardController.faBoardList fvo.getFasearchcondition() value confirm >>> : " + fvo.getFasearchcondition());
		System.out.println("FaBoardController.faBoardList fvo.getFasearchkeyword() value confirm >>> : " + request.getParameter("fasitename"));
	
		List<FaVo> faList =  faBoardService.faBoardList(fvo);
		
		/*// Test for page
		//pageCountMaxSize
		int pageCountMaxSize = (int) Math.ceil((float) faList.size() / ENTRY_SIZE);
		String strArray[] = new String[pageCountMaxSize];	
		System.out.println("pageCountMaxSize: " + pageCountMaxSize);
		
		int faEndNum = ENTRY_SIZE * START_NUM;
		int faStartNum = faEndNum - ENTRY_SIZE + 1;
		
		//����¡ ���۹�ȣ
		int index = (faList.size())-(ENTRY_SIZE*(START_NUM-1));
		//����¡��������
		int nENTRY_SIZE = (START_NUM-1) / 5 + 1;
		//����¡�� �Ѱ���
		int fpageCountMaxSize = (int) Math.ceil(pageCountMaxSize / 10);
		//����¡�� ���۹�ȣ
		int sENTRY_SIZE = ((START_NUM-1)/5) * 5 +1;
		//����¡�� ��������ȣ
		int eENTRY_SIZE  = nENTRY_SIZE*5;
		
		if(nENTRY_SIZE == fpageCountMaxSize) {
			eENTRY_SIZE = pageCountMaxSize;
		}

		
		
		if (nENTRY_SIZE == 1) {
			mav.addObject("sss", "s");
		} else if (nENTRY_SIZE == (int)fpageCountMaxSize) {
			mav.addObject("sss", "e");
		}*/
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("faBoardLists", faList);
		mav.addObject("faBoardListCount", faList.size());
		/*mav.addObject("faBoardListCountCalculation", strArray);
		mav.addObject("index", index);
		mav.addObject("inpageCountMaxSizedex", pageCountMaxSize);
		mav.addObject("sENTRY_SIZE", sENTRY_SIZE);
		mav.addObject("eENTRY_SIZE", eENTRY_SIZE);
		mav.addObject("faEndNum", faEndNum);
		mav.addObject("faStartNum", faStartNum);
		*/
		
		
		
		mav.addObject("faBoardListAll", fvo);
		mav.addObject("fasearchcondition", fvo.getFasearchcondition());
		mav.addObject("fasearchkeyword", fvo.getFasearchkeyword());
		
		System.out.println("faList.size()" + faList.size());
		
		mav.setViewName(CONTEXT_PATH + "/faBoardList");
		
		return mav;
	}
	
	//insert Write Form page
	@RequestMapping("/faBoardSelect") 
	public ModelAndView faBoardSelect(@ModelAttribute FaVo fvo, HttpServletRequest request) {
		System.out.println("FaBoardController.faBoardSelect SUCCESS >>> : ");
			
		ModelAndView mav = new ModelAndView();
			
		if(fvo.getFano().equals("")) {
			mav.addObject("faMode","faInsert");
		} else {
			mav.addObject("FaVo",faBoardService.faBoardSelect(fvo));
			if(request.getParameter("faMode").equals("faUpdate")){
				mav.addObject("faMode", "faUpdate");
			}else{
				mav.addObject("faMode", "faDelete");
			}
		}
		mav.setViewName(CONTEXT_PATH + "/faBoardWrite");
			
		return mav;
	}
		
	//insert function
	@RequestMapping("/faBoardInsert")
	public ModelAndView faBoardInsert(@ModelAttribute FaVo fvo) {
		System.out.println("FaBoardController.faBoardInsert SUCCESS >>> : ");
		
		String faResultStr = "";
		int result = faBoardService.faBoardInsert(fvo);
		
		if(result > 0) {
			faResultStr = "Post registration was successful.";
		} else {
			faResultStr = "Post registration failed.";
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",faResultStr);
		mav.setViewName(CONTEXT_PATH + "/faResult");
		
		return mav;
	}
	
	//update function
	@RequestMapping("/faBoardUpdate")
	public ModelAndView faBoardUpdate(@ModelAttribute FaVo fvo) {
		System.out.println("FaBoardController.faBoardUpdate SUCCESS >>> : ");
		
			
		String faResultStr = "";
		int result = faBoardService.faBoardUpdate(fvo);
			
		if(result > 0) {
			faResultStr = "Post edit was successful.";
		} else {
			faResultStr = "Editing post failed.";
		}
			
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",faResultStr);
		mav.setViewName(CONTEXT_PATH + "/faResult");
	
		return mav;
	}
		
		
	//delete function
	@RequestMapping("/faBoardDelete")
	public ModelAndView faBoardDelete(@ModelAttribute FaVo fvo) {
		System.out.println("FaBoardController.faBoardDelete SUCCESS >>> : ");
			
		String faResultStr = "";
		int result = faBoardService.faBoardDelete(fvo);
			
		if(result > 0) {
			faResultStr = "Successfully deleted post.";
		} else {
			faResultStr = "Successfully deleted post.";
		}
			
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",faResultStr);
		mav.setViewName(CONTEXT_PATH + "/faResult");
	
		return mav;
	}
	
}
	
