package com.api;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.json.simple.JSONObject;

/**
클래스명 : PublicData
설명 : 메인에서 지역별 음식점들을 가져오기 위한  파일
날 짜 : 2019-09-05
작성자명 : LHJ
*/
@WebServlet("/PublicData.do")
public class PublicData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PublicData() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String areaCode=request.getParameter("areaCode");
		String foodCat=request.getParameter("foodCat");
		int pageNo=1;
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
		String serviceKey = "XcYnvXiczkLLceGeiZC%2FS25vRTz20RORZFfahcwPXWDAwCCkf9aPPDxbShnDX6apwNOjl4gBEw7hdF9A1g8XcA%3D%3D";
		String parameter = "";
		//serviceKey = URLEncoder.encode(serviceKey,"utf-8");
		PrintWriter out = response.getWriter();
		System.out.println("PublicData.do 진입");
		if(areaCode!=null){
		
		parameter = parameter + "&" + "contentTypeId=39";
		parameter = parameter + "&" + "areaCode="+areaCode;
		parameter = parameter + "&" + "sigunguCode=";
		parameter = parameter + "&" + "cat1=A05&cat2=A0502&cat3=";
		parameter = parameter + "&" + "listYN=Y&MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
		parameter = parameter + "&" + "arrange=A&numOfRows=12&pageNo="+pageNo;
		parameter = parameter + "&" + "_type=json";
		}
		else if(foodCat!=null){
			parameter = parameter + "&" + "contentTypeId=39";
			parameter = parameter + "&" + "areaCode=";
			parameter = parameter + "&" + "sigunguCode=";
			parameter = parameter + "&" + "cat1=A05&cat2=A0502&cat3="+foodCat;
			parameter = parameter + "&" + "listYN=Y&MobileOS=ETC";
			parameter = parameter + "&" + "MobileApp=TourAPI3.0_Guide";
			parameter = parameter + "&" + "arrange=A&numOfRows=12&pageNo="+pageNo;
			parameter = parameter + "&" + "_type=json";
		}
		
		addr = addr + serviceKey + parameter;
		System.out.println("addr : "+addr);
		URL url = new URL(addr);

		
//		BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

		InputStream in = url.openStream(); 
//		CachedOutputStream bos = new CachedOutputStream();
		ByteArrayOutputStream  bos1 = new ByteArrayOutputStream();
		IOUtils.copy(in, bos1);
		in.close();
		bos1.close();
	    
		String mbos = bos1.toString("UTF-8");
		System.out.println("mbos: "+mbos);
	    
		byte[] b = mbos.getBytes("UTF-8");
		String s = new String(b, "UTF-8");
		out.println(s);
		
		JSONObject json = new JSONObject();
		json.put("data", s);
//		json.put("data", data);
		System.out.println("json: "+json);
		
	}
}
