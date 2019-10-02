package com.tu.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tu.admin.service.AdminService;
import com.tu.admin.vo.AdminVo;
import com.tu.faboard.service.FaBoardService;
import com.tu.faboard.vo.FaVo;
import com.tu.ntboard.service.NtBoardService;
import com.tu.ntboard.vo.NtBoardVo;
import com.tu.qaboard.file.QaFileUploadUtil;
import com.tu.qaboard.service.QaBoardService;
import com.tu.qaboard.vo.QaBoardVo;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	//constructor field
	private static final String CONTEXT_PATH = "admin";
	
	@Autowired 
	private NtBoardService ntBoardService;
	
	@Autowired 
	private FaBoardService faBoardService;
	
	@Autowired
	private QaBoardService qaBoardService;
	
	@Autowired
	private AdminService adminService;
	
	//nt start
	//full post page
	@RequestMapping("/adntBoardList")  
	public ModelAndView adntBoardList(@ModelAttribute NtBoardVo ntvo) {
		System.out.println("AdminController.adntBoardList SUCCESS >>> : ");
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
		mav.setViewName(CONTEXT_PATH + "/adntBoardList");
			
		return mav;
		}
	
	//insert Write Form page
	@RequestMapping("/adntBoardSelect") 
	public ModelAndView adntBoardSelect(@ModelAttribute NtBoardVo ntvo) {
		System.out.println("AdminController.adntBoardSelect SUCCESS >>> : ");
			
		ModelAndView mav = new ModelAndView();
			
		if (ntvo.getNtno().equals("")) {
			mav.addObject("ntMode","ntInsert");
		}else{
			mav.addObject("NtBoardUpdate", ntBoardService.ntBoardDetail(ntvo));
			mav.addObject("ntMode", "ntUpdate");
		}
			mav.setViewName(CONTEXT_PATH + "/adntBoardInsert");
			
			return mav;
		}
		
	//detail page
	@RequestMapping("/adntBoardDetail")
	public ModelAndView adntBoardDetail(@ModelAttribute NtBoardVo ntvo, HttpServletRequest request, 
									   HttpServletResponse response, HttpSession session) {
		System.out.println("AdminController.adntBoardDetail SUCCESS >>> : ");
		System.out.println(ntvo.getNtno());
	  	
		//setting for hit Start
			//get saved cookie
			Cookie[] ntCookie = request.getCookies();
			String ntCookieValue = null;
			
			for(int i=0; i<ntCookie.length; i++) {
				ntCookieValue = ntCookie[0].getValue();
				System.out.println("AdminController.adntBoardDetail ntCookieValue confirm >>> : " + ntCookieValue);
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
	  	mav.setViewName(CONTEXT_PATH + "/adntBoardDetail");
	  	System.out.println(session.getAttribute(ntvo.getNtno() + ":cookie") + "세션1");
	    System.out.println(session.getAttribute(ntvo.getNtno() + ":cookie ex") + "세션2"); 
	  	
	    return mav;
	}

	//insert function
	@RequestMapping("/adntBoardInsert") 
	public ModelAndView adntBoardInsert(@ModelAttribute NtBoardVo ntvo) {
		System.out.println("AdminController.adntBoardInsert SUCCESS >>> : ");
					
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
		mav.setViewName(CONTEXT_PATH + "/adntResult");
				
		return mav;
	}	
		
	//update function
	@RequestMapping("/adntBoardUpdate")
	public ModelAndView adntBoardUpdate(@ModelAttribute NtBoardVo ntvo) {
		System.out.println("AdminController.adntBoardUpdate SUCCESS >>> : ");
		System.out.println("AdminController.adntBoardUpdate ntno confirm >>> :  "+ ntvo.getNtno());
	      
		String ntResultStr ="";
		int result =  ntBoardService.ntBoardUpdate(ntvo);
		
		if (result > 0) {
			ntResultStr = "Post edit was successful.";
		} else {
			ntResultStr = "Editing post failed.";
		 }
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", ntResultStr);
		mav.setViewName(CONTEXT_PATH + "/adntResult");
	    
		return mav;
	}
	   
	 //delete function
	 @RequestMapping("/adntBoardDelete")
	 public ModelAndView adntBoardDelete(@ModelAttribute NtBoardVo ntvo) {
		 System.out.println("AdminController.adntBoardDelete SUCCESS >>> : ");
		 
		  String ntResultStr ="";
	      int result = ntBoardService.ntBoardDelete(ntvo);
	      
	      if (result > 0) {
	    	  ntResultStr = "Successfully deleted post.";
		  } else {
			  ntResultStr = "Deleting a post failed.";
			}
	      
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("result", ntResultStr);
	      mav.setViewName(CONTEXT_PATH + "/adntResult");
	     
	      return mav;
	   }
	//nt end
	 
	 
	//qa start
	//full post page
	@RequestMapping("/adqaBoardList")
	public ModelAndView adqaBoardList(@ModelAttribute QaBoardVo qavo) {
		System.out.println("AdminController.adqaBoardList SUCCESS >>> : ");
		
		List<QaBoardVo> qaList = qaBoardService.qaBoardList(qavo);
		System.out.println("AdminController.adqaBoardList qaList confirm >>> : " + qaList);
		System.out.println("AdminController.adqaBoardList qaList.size confirm >>> : " + qaList.size());
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("qaBoardList", qaList);
		mav.addObject("qasearchcondition", qavo.getQasearchcondition());
		mav.addObject("qasearchkeyword", qavo.getQasearchkeyword());
		mav.setViewName(CONTEXT_PATH + "/adqaBoardList"); 
		
		return mav ;
	}
	
	//insert Write Form page
	@RequestMapping("/adqaBoardSelect")
	public ModelAndView adqaBoardSelect(@ModelAttribute QaBoardVo qavo) {
		System.out.println("AdminController.adqaBoardSelect SUCCESS >>> : ");
		
		ModelAndView mav = new ModelAndView();
		
		//To distinguish buttons
		if(qavo.getQano().equals("")) {
			mav.addObject("qaMode", "qaInsert");
		} else {
			mav.addObject("QaBoardUpdate", qaBoardService.qaBoardDetail(qavo));
			mav.addObject("qaMode", "qaUpdate");
		}
		mav.setViewName(CONTEXT_PATH + "/adqaBoardInsert");
		
		return mav;
	}
	
	//insert function
	@RequestMapping("/adqaBoardInsert") 
	//MultipartFile file need for fileupload set
	public ModelAndView adqaBoardInsert(@ModelAttribute QaBoardVo qavo, MultipartFile file,HttpServletRequest request) throws IOException {
		System.out.println("AdminController.adqaBoardInsert SUCCESS >>> : ");
		System.out.println("AdminController.adqaBoardInsert qavo confirm >>> : " + qavo);	
			
			//file upload set
			if(!file.isEmpty()){
				//db saved real file upload name
				String qaRealnameSave = QaFileUploadUtil.qaFileUpload(file, request);
				
				//qaRealnameSave value set in vo file
				qavo.setQaimage(qaRealnameSave);
				System.out.println("AdminControllerqavo.qaBoardInsert qaRealnameSave confirm" + qaRealnameSave);
			}else{
				qavo.setQaimage(qavo.getQaimage());
				System.out.println("AdminControllerqavo.qaBoardInsert qavo.getQaimage() confirm" + qavo.getQaimage());
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
			mav.setViewName(CONTEXT_PATH + "/adqaResult");
					
			return mav;
		}	
	
	//Reply insert Write Form page
	@RequestMapping("/adqaBoardReplySelect")
	public ModelAndView adqaBoardReplySelect(@ModelAttribute QaBoardVo qavo) {
		System.out.println("AdminController.adqaBoardReplySelect SUCCESS >>> : ");
			
		ModelAndView mav = new ModelAndView();
		System.out.println("AdminController.adqaBoardReplySelect getQareplycontent confirm >>>" + qavo.getQareplycontent());
		if(qavo.getQareplycontent().equals("")) {
			mav.addObject("QaBoardUpdate", qaBoardService.qaBoardDetail(qavo));
			mav.addObject("qaReplyMode", "qaReplyInsert");
		} else {
			mav.addObject("QaBoardUpdate", qaBoardService.qaBoardDetail(qavo));
			mav.addObject("qaReplyMode", "qaReplyUpdate");
		}
		mav.setViewName(CONTEXT_PATH + "/adqaBoardInsert");
			
		return mav;
	}
	
	//detail page
	@RequestMapping("/adqaBoardDetail")
	public ModelAndView adqaBoardDetail(@ModelAttribute QaBoardVo qavo, HttpServletRequest request,
			                          HttpServletResponse response, HttpSession session) {
		System.out.println("AdminController.adqaBoardDetail SUCCESS >>> : ");
		System.out.println(qavo);
		
		ModelAndView mav = new ModelAndView();
	  	mav.addObject("qaBoardDetail",qaBoardService.qaBoardDetail(qavo)); 
	  	mav.setViewName(CONTEXT_PATH + "/adqaBoardDetail");
	    return mav;
	}

	//update function
	@RequestMapping("/adqaBoardUpdate")
	//MultipartFile file need for fileupload set
	public ModelAndView adqaBoardUpdate(@ModelAttribute QaBoardVo qavo,  MultipartFile file, HttpServletRequest request) throws IOException {
		System.out.println("AdminController.adqaBoardUpdate SUCCESS >>> : ");
		System.out.println("AdminController.adqaBoardUpdate qavo confirm >>> : " + qavo);			
		System.out.println("AdminController.adqaBoardUpdate getOriginalFilename confirm >>> : " + file.getOriginalFilename());			
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
		mav.setViewName(CONTEXT_PATH + "/adqaResult");
				
		return mav;
	}
	
	//delete function
	@RequestMapping("/adqaBoardDelete")
	public ModelAndView adqaBoardDelete(@ModelAttribute QaBoardVo qavo) {
		System.out.println("AdminController.adqaBoardDelete SUCCESS >>> : ");
		System.out.println("AdminController.adqaBoardDelete qavo confirm >>> : " + qavo);			
		
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
		mav.setViewName(CONTEXT_PATH + "/adqaResult");
				
		return mav;
	}
	//qa end

	
	//faq start
	//full post page
	@RequestMapping("/adfaBoardList") 
	public ModelAndView adfaBoardList(@ModelAttribute FaVo fvo,
			//@RequestParam(defaultValue = "1", required = false, value = "pageno") int pageNo, // /faBoardList? -> pageno = 1
			HttpServletRequest request){
		System.out.println("AdminController.adfaBoardList SUCCESS >>> : ");
		
		System.out.println("AdminController.adfaBoardList fvo.getFasearchcondition() value confirm >>> : " + fvo.getFasearchcondition());
		System.out.println("AdminController.adfaBoardList fvo.getFasearchkeyword() value confirm >>> : " + request.getParameter("fasitename"));
	
		List<FaVo> faList =  faBoardService.faBoardList(fvo);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("faBoardLists", faList);
		mav.addObject("faBoardListCount", faList.size());
		mav.addObject("faBoardListAll", fvo);
		mav.addObject("fasearchcondition", fvo.getFasearchcondition());
		mav.addObject("fasearchkeyword", fvo.getFasearchkeyword());
		
		System.out.println("faList.size()" + faList.size());
		
		mav.setViewName(CONTEXT_PATH + "/adfaBoardList");
		
		return mav;
	}
	
	//insert Write Form page
	@RequestMapping("/adfaBoardSelect") 
	public ModelAndView adfaBoardSelect(@ModelAttribute FaVo fvo, HttpServletRequest request) {
		System.out.println("AdminController.adfaBoardSelect SUCCESS >>> : ");
			
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
		mav.setViewName(CONTEXT_PATH + "/adfaBoardWrite");
			
		return mav;
	}
		
	//insert function
	@RequestMapping("/adfaBoardInsert")
	public ModelAndView adfaBoardInsert(@ModelAttribute FaVo fvo) {
		System.out.println("AdminController.adfaBoardInsert SUCCESS >>> : ");
		
		String faResultStr = "";
		int result = faBoardService.faBoardInsert(fvo);
		
		if(result > 0) {
			faResultStr = "Post registration was successful.";
		} else {
			faResultStr = "Post registration failed.";
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",faResultStr);
		mav.setViewName(CONTEXT_PATH + "/adfaResult");
		
		return mav;
	}
	
	//update function
	@RequestMapping("/adfaBoardUpdate")
	public ModelAndView adfaBoardUpdate(@ModelAttribute FaVo fvo) {
		System.out.println("AdminController.adfaBoardUpdate SUCCESS >>> : ");
		
			
		String faResultStr = "";
		int result = faBoardService.faBoardUpdate(fvo);
			
		if(result > 0) {
			faResultStr = "Post edit was successful.";
		} else {
			faResultStr = "Editing post failed.";
		}
			
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",faResultStr);
		mav.setViewName(CONTEXT_PATH + "/adfaResult");
	
		return mav;
	}
		
		
	//delete function
	@RequestMapping("/adfaBoardDelete")
	public ModelAndView adfaBoardDelete(@ModelAttribute FaVo fvo) {
		System.out.println("AdminController.adfaBoardDelete SUCCESS >>> : ");
			
		String faResultStr = "";
		int result = faBoardService.faBoardDelete(fvo);
			
		if(result > 0) {
			faResultStr = "Successfully deleted post.";
		} else {
			faResultStr = "Successfully deleted post.";
		}
			
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",faResultStr);
		mav.setViewName(CONTEXT_PATH + "/adfaResult");
	
		return mav;
	}
	//faq end
	
	//mem start
	//full memberlist page
	@RequestMapping(value = "/adlistMember")
	public ModelAndView adlistMember(@ModelAttribute AdminVo adminvo){
		System.out.println("AdminController adlistMember SUCCESS >>> : ");
		System.out.println("AdminController adlistMember param >>>\n"+ adminvo);
		
		List<AdminVo> list = adminService.adlistMember(adminvo);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("admemberList",list);
		mav.addObject("adyn",adminvo.getMdeleteyn()); // 삭제한 y,n의 값 
		mav.addObject("adsearchcondition", adminvo.getAdsearchcondition());
		mav.addObject("adsearchkeyword", adminvo.getAdsearchkeyword());
		mav.setViewName(CONTEXT_PATH + "/adinsert_list");
		return mav;
	}
	//mem end
	
}
