package com.tu.chaebun;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;

public class TuChaeBun {
	
	public static final String GUBUN_CHAR_M = "M";
	public static final String GUBUN_CHAR_MY = "MY";
	public static final String GUBUN_CHAR_RT = "RT";
	public static final String GUBUN_CHAR_D = "D";
	public static final String GUBUN_CHAR_TR = "TR";
	
	public static final String GUBUN_CHAR_AA = "AA";
	public static final String GUBUN_CHAR_BB = "BB";
	public static final String GUBUN_CHAR_CC = "CC";
	public static final String GUBUN_CHAR_DD = "DD";
	
	public static final int QUERY_CHABUN_INDEX_0 = 0;
	public static final int QUERY_CHABUN_INDEX_1 = 1;
	public static final int QUERY_CHABUN_INDEX_2 = 2;
	public static final int QUERY_CHABUN_INDEX_3 = 3;

	public static final String COMMON_USE_QUERY[] = { 
			"SELECT COUNT(A.MNUM) FROM CHAEBUNTEST A"
           ,"SELECT /*+ INDEX_DESC(A SYS_C0011336) */ "	
		     + " NVL(MAX(SUBSTR(A.MYNO, 13)), 0) + 1 MYNO FROM TUMYFAV A"};

	public static String commYearNo()
	{	
		Connection conn         = null;
		PreparedStatement pstmt = null;
		ResultSet  rsRs         = null;	
		
		String commNO    = "";		 
		int commYEAR_  = 0;
		int commMONTH_ = 0;
		int commDAY_   = 0;
		String commYEAR  = "";
		String commMONTH = "";
		String commDAY   = "";
		
		
		
		try
		{
			conn = ConnProperty.getConnection();
			System.out.println("Connection�� ����Ǿ���ϴ�.");
			
			pstmt = conn.prepareStatement(
					TuChaeBun.COMMON_USE_QUERY[TuChaeBun.QUERY_CHABUN_INDEX_1]);				     		
			rsRs = pstmt.executeQuery();	
			System.out.println("CAHBUN ===> : \n" + TuChaeBun.COMMON_USE_QUERY[1]);					
			
			if ( rsRs != null){
				while (rsRs.next()){
					 commNO = String.valueOf(rsRs.getInt("myNO"));					
				}
			}
			System.out.println(" commNO >>>> : " + commNO);
			
			Calendar cl = Calendar.getInstance( );  // ���� ��¥ ���� ���	
			commYEAR_ = cl.get(Calendar.YEAR);
			commMONTH_ = cl.get(Calendar.MONTH) + 1;
			commDAY_ = cl.get(Calendar.DAY_OF_MONTH);
			
			commYEAR = String.valueOf(commYEAR_);
			commMONTH = String.valueOf(commMONTH_);
			commDAY = String.valueOf(commDAY_);
			
			//commYEAR = commYEAR.substring(2, 4); //2015 -> 15
			if ( commMONTH_ < 10 ) //1, 2 ~ 9 : 01
			{
				commMONTH = "0" + String.valueOf(commMONTH_);
			}
			
		    //System.out.println("���� ��: " +  commYEAR);
		    //System.out.println("���� ��: " +  commMONTH);
		    //System.out.println("���� ��: " +  commDAY);
			
			if (1 == commNO.length())
			{
				commNO = "000" + commNO;
			}
			if (2 == commNO.length())
			{
				commNO = "00" + commNO;
			}
			if (3 == commNO.length())
			{
				commNO = "0" + commNO;
			}
	
			// M201509040001			
			System.out.println("commNO >>>> : " + commNO);
			
			commNO = TuChaeBun.GUBUN_CHAR_MY 
					 + commYEAR 
					 + commMONTH 
					 + commDAY 
					 + commNO;
			System.out.println("commNO >>>> : " + commNO);
			
			ConnProperty.conClose(conn, pstmt);
		}
		catch (Exception e){
			System.out.println("DB ���� " + e.getMessage());
		}
		finally {
			try{
				ConnProperty.conClose(conn, pstmt);
			}catch (Exception e2){
				e2.printStackTrace();
			}				
		} 
	
		return commNO;
	}

}
