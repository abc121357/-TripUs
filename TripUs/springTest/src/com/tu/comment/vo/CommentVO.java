/*
CREATE TABLE HELLOBOARD(
 	BNO 		VARCHAR2(20) PRIMARY KEY
   ,BSUBJECT 	VARCHAR2(100) NOT NULL
   ,BNAME    	VARCHAR2(100) NOT NULL
   ,BPW		 	VARCHAR2(20)
   ,BMEMO    	VARCHAR2(2000)
   ,BDELETEYN 	VARCHAR2(1)
   ,BINSERTDATE DATE
   ,BUPDATEDATE DATE
); 

-- ��Ű�� �� Ŭ������
com.baby.emp.mvc.controller.HelloBoardControllerServlet
com.baby.emp.mvc.dao.HelloBoardDAO
com.baby.emp.mvc.dao.HelloBoardDAOImpl
com.baby.emp.mvc.vo.HelloBoardVO
com.baby.emp.mvc.sql.HelloBoardSqlMap
com.baby.common.ConnProperty
com.baby.common.BoardChabun

�۹�ȣ�� ä����� ���
�н������ Base64������� ���ڵ�, ���ڵ�
*/
package com.tu.comment.vo;

import java.util.Date;

public class CommentVO {
 
    
    private String tono;
    private String toid;
    private String tonick;
    private String toprofile;
    private String tocontent;
    private String toinsertdate;
    private String toupdatedate;
    private String todeleteyn;
    private String torecordinsertdate;
    private String torecordupdatedate;
	public String getTono() {
		return tono;
	}
	public void setTono(String tono) {
		this.tono = tono;
	}
	public String getToid() {
		return toid;
	}
	public void setToid(String toid) {
		this.toid = toid;
	}
	public String getTonick() {
		return tonick;
	}
	public void setTonick(String tonick) {
		this.tonick = tonick;
	}
	public String getToprofile() {
		return toprofile;
	}
	public void setToprofile(String toprofile) {
		this.toprofile = toprofile;
	}
	public String getTocontent() {
		return tocontent;
	}
	public void setTocontent(String tocontent) {
		this.tocontent = tocontent;
	}
	public String getToinsertdate() {
		return toinsertdate;
	}
	public void setToinsertdate(String toinsertdate) {
		this.toinsertdate = toinsertdate;
	}
	public String getToupdatedate() {
		return toupdatedate;
	}
	public void setToupdatedate(String toupdatedate) {
		this.toupdatedate = toupdatedate;
	}
	public String getTodeleteyn() {
		return todeleteyn;
	}
	public void setTodeleteyn(String todeleteyn) {
		this.todeleteyn = todeleteyn;
	}
	public String getTorecordinsertdate() {
		return torecordinsertdate;
	}
	public void setTorecordinsertdate(String torecordinsertdate) {
		this.torecordinsertdate = torecordinsertdate;
	}
	public String getTorecordupdatedate() {
		return torecordupdatedate;
	}
	public void setTorecordupdatedate(String torecordupdatedate) {
		this.torecordupdatedate = torecordupdatedate;
	}


 
 
}


