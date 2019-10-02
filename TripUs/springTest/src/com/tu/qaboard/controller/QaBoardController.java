package com.tu.qaboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tu.qaboard.file.QaFileUploadUtil;
import com.tu.qaboard.service.QaBoardService;
import com.tu.qaboard.vo.QaBoardVo;

@Controller
@RequestMapping(value = "/qna")
public class QaBoardController {
	
	//constructor field
	private static final String CONTEXT_PATH = "qna";
	
	@Autowired
	private QaBoardService qaBoardService;
	
	//full post page
	@RequestMapping("/qaBoardList")
	public ModelAndView qaBoardList(@ModelAttribute QaBoardVo qavo) {
		System.out.println("QaBoardController.qaBoardList SUCCESS >>> : ");
		
		List<QaBoardVo> qaList = qaBoardService.qaBoardList(qavo);
		System.out.println("QaBoardController.qaBoardList qaList confirm >>> : " + qaList);
		System.out.println("QaBoardController.qaBoardList qaList.size confirm >>> : " + qaList.size());
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("qaBoardList", qaList);
		mav.addObject("qasearchcondition", qavo.getQasearchcondition());
		mav.addObject("qasearchkeyword", qavo.getQasearchkeyword());
		mav.setViewName(CONTEXT_PATH + "/qaBoardList"); 
		
		return mav ;
	}
	
	//insert Write Form page
	@RequestMapping("/qaBoardSelect")
	public ModelAndView qaBoardSelect(@ModelAttribute QaBoardVo qavo) {
		System.out.println("QaBoardController.qaBoardSelect SUCCESS >>> : ");
		
		ModelAndView mav = new ModelAndView();
		
		//To distinguish buttons
		if(qavo.getQano().equals("")) {
			mav.addObject("qaMode", "qaInsert");
		} else {
			mav.addObject("QaBoardUpdate", qaBoardService.qaBoardDetail(qavo));
			mav.addObject("qaMode", "qaUpdate");
		}
		mav.setViewName(CONTEXT_PATH + "/qaBoardInsert");
		
		return mav;
	}
	
	//insert function
	@RequestMapping("/qaBoardInsert") 
	
	//MultipartFile file need for fileupload set
	public ModelAndView qaBoardInsert(@ModelAttribute QaBoardVo qavo, MultipartFile file,HttpServletRequest request) throws IOException {
		System.out.println("QaBoardController.qaBoardInsert SUCCESS >>> : ");
		System.out.println("QaBoardController.qaBoardInsert qavo confirm >>> : " + qavo);	
			
			//file upload set
			if(!file.isEmpty()){
				//db saved real file upload name
				String qaRealnameSave = QaFileUploadUtil.qaFileUpload(file, request);
				
				//qaRealnameSave value set in vo file
				qavo.setQaimage(qaRealnameSave);
				System.out.println("QaBoardControllerqavo.qaBoardInsert qaRealnameSave confirm" + qaRealnameSave);
			}else{
				qavo.setQaimage(qavo.getQaimage());
				System.out.println("QaBoardControllerqavo.qaBoardInsert qavo.getQaimage() confirm" + qavo.getQaimage());
			} 
			
			//this is used to prevent error 
			if(qavo.getQareplycontent() == null || qavo.getQareplycontent() == ""){
				qavo.setQareplycontent("");
			}
			
			//this is the reply setting
			if (request.getParameter("qaReplyMode").equals("qaReInsert")) {
				qavo.setQaref(qavo.getQano());
				System.out.println(">>>>>>>>>>>>>>>>>>>>"  + qavo.getQano());
				qavo.setQastep(1);
			} else {
				String qano = qaBoardService.qaBoardQaNoSelect();
				qavo.setQaref(qano);
				qavo.setQastep(0);
			}
			
			String qaResultStr = "";
			int result = qaBoardService.qaBoardInsert(qavo);
		
			if(result > 0) {
				qaResultStr = "Post registration was successful.";
			} else {
				qaResultStr = "Post registration failed.";
			  }
						
			ModelAndView mav = new ModelAndView();
			mav.addObject("result", qaResultStr);
			mav.setViewName(CONTEXT_PATH + "/qaResult");
					
			return mav;
		}	
	
	//Reply insert Write Form page
	@RequestMapping("/qaBoardReplySelect")
	public ModelAndView qaBoardReplySelect(@ModelAttribute QaBoardVo qavo) {
		System.out.println("QaBoardController.qaBoardReplySelect SUCCESS >>> : ");
			
		ModelAndView mav = new ModelAndView();
		System.out.println("QaBoardController.qaBoardReplySelect getQareplycontent confirm >>>" + qavo.getQareplycontent());
		if(qavo.getQareplycontent().equals("")) {
			mav.addObject("QaBoardUpdate", qaBoardService.qaBoardDetail(qavo));
			mav.addObject("qaReplyMode", "qaReplyInsert");
		} else {
			mav.addObject("QaBoardUpdate", qaBoardService.qaBoardDetail(qavo));
			mav.addObject("qaReplyMode", "qaReplyUpdate");
		}
		mav.setViewName(CONTEXT_PATH + "/qaBoardInsert");
			
		return mav;
	}
	
	//detail page
	@RequestMapping("/qaBoardDetail")
	public ModelAndView qaBoardDetail(@ModelAttribute QaBoardVo qavo, HttpServletRequest request,
			                          HttpServletResponse response, HttpSession session) {
		System.out.println("QaBoardController.qaBoardDetail SUCCESS >>> : ");
		System.out.println(qavo);
		
		ModelAndView mav = new ModelAndView();
	  	mav.addObject("qaBoardDetail",qaBoardService.qaBoardDetail(qavo)); 
	  	mav.setViewName(CONTEXT_PATH + "/qaBoardDetail");
	    return mav;
	}

	//update function
	@RequestMapping("/qaBoardUpdate")
	//MultipartFile file need for fileupload set
	public ModelAndView qaBoardUpdate(@ModelAttribute QaBoardVo qavo,  MultipartFile file, HttpServletRequest request) throws IOException {
		System.out.println("QaBoardController.qaBoardUpdate SUCCESS >>> : ");
		System.out.println("QaBoardController.qaBoardUpdate qavo confirm >>> : " + qavo);			
		System.out.println("QaBoardController.qaBoardUpdate getOriginalFilename confirm >>> : " + file.getOriginalFilename());			
		if(!file.isEmpty()){
			//db saved real fileupload name
			String qaRealnameSave = QaFileUploadUtil.qaFileUpload(file, request);
			qavo.setQaimage(qaRealnameSave);			
		}else{
			qavo.setQaimage(qavo.getQaimage());
		} 
		if(qavo.getQareplycontent() == null || qavo.getQareplycontent() == "" ){
			qavo.setQareplycontent("");
		}
		String qaResultStr = "";
		int result = qaBoardService.qaBoardUpdate(qavo);
		if(result > 0) {
			qaResultStr = "Post edit was successful.";
		} else {
			qaResultStr = "Editing post failed.";
		  }
					
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", qaResultStr);
		mav.setViewName(CONTEXT_PATH + "/qaResult");
				
		return mav;
	}
	
	//delete function
	@RequestMapping("/qaBoardDelete")
	public ModelAndView qaBoardDelete(@ModelAttribute QaBoardVo qavo) {
		System.out.println("QaBoardController.qaBoardDelete SUCCESS >>> : ");
		System.out.println("QaBoardController.qaBoardDelete qavo confirm >>> : " + qavo);			
		
		QaBoardVo qavo1 = qaBoardService.qaBoardDetail(qavo);
		qavo.setQaref(qavo1.getQaref());
		
		String qaResultStr = "";
		int result = qaBoardService.qaBoardDelete(qavo);
		if(result > 0) {
			qaResultStr = "Successfully deleted post.";
			System.out.println(qaResultStr);
		} else {
			qaResultStr = "Deleting a post failed.";
			System.out.println(qaResultStr);
		  }
					
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", qaResultStr);
		mav.setViewName(CONTEXT_PATH + "/qaResult");
				
		return mav;
	}
	
}
