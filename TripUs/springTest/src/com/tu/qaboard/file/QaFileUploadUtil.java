package com.tu.qaboard.file;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class QaFileUploadUtil {
	
	
	public static String qaFileUpload(MultipartFile qaFile, HttpServletRequest request) throws IOException{
		System.out.println("QaFileUploadUtil.qaFileUpload SUCCESS >>> : ");
		
		String qaRealname = null;
		String qaOrgname = qaFile.getOriginalFilename();
		
		if(qaOrgname != null && (!qaOrgname.equals(""))){
			qaRealname = "qa_"+ System.currentTimeMillis() + "_" + qaOrgname;
			
			
			String docRoot = request.getSession().getServletContext().getRealPath("/fileupload");
			System.out.println("docRoot confirm >>> : " + docRoot);
			
			File qaFileDir = new File(docRoot);
			if(!qaFileDir.exists()){
				qaFileDir.mkdir();
			}
			File qaFileAdd = new File(docRoot + "/" + qaRealname);
			System.out.println("qaFileAdd confirm >>> : " + qaFileAdd);
			qaFile.transferTo(qaFileAdd);
		}
		
		return qaRealname;
	}
	
	public static void qaFileDelete(String qaFileName, HttpServletRequest request) throws IOException{
		
		boolean qaResult = false;
		String docRoot = request.getSession().getServletContext().getRealPath("/uploadStorage/");
		
		File qaFileDelete = new File(docRoot + "/" + qaFileName);
		if(qaFileDelete.exists() && qaFileDelete.isFile()){
			qaResult = qaFileDelete.delete();
		}
		
	}
}
