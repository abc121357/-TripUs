package com.tu.myfavorite.vo;

/**
파일명: MyfavoriteVO
설 명: 즐겨찾기에 임시로 저장하기 위한 VO
작성일: 2019/8/26
작성자: LHJ
*/

public class MyFavoriteVO {

	private String MYNO; // size : 14
	private String MYTITLE; // size : 60
	private String MYID; // size : 500
	private String MYGRADE; // size : 1
	private String MYLOCATION; // size : 100
	private String MYLINK; // size : 300
	private String MYINSERTDATE; // size: date
	private String MNO; // size : 13
	private String MYRECORDINSERTDATE; // size : date
	private String MYRECORDUPDATEDATE; // size : date
	
	
	
	public MyFavoriteVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MyFavoriteVO(String mYNO, String mYTITLE, String mYID, String mYGRADE, String mYLOCATION, String mYLINK,
			String mYINSERTDATE, String mNO, String mYRECORDINSERTDATE, String mYRECORDUPDATEDATE) {
		super();
		MYNO = mYNO;
		MYTITLE = mYTITLE;
		MYID = mYID;
		MYGRADE = mYGRADE;
		MYLOCATION = mYLOCATION;
		MYLINK = mYLINK;
		MYINSERTDATE = mYINSERTDATE;
		MNO = mNO;
		MYRECORDINSERTDATE = mYRECORDINSERTDATE;
		MYRECORDUPDATEDATE = mYRECORDUPDATEDATE;
	}
	public String getMYNO() {
		return MYNO;
	}
	public void setMYNO(String mYNO) {
		MYNO = mYNO;
	}
	public String getMYTITLE() {
		return MYTITLE;
	}
	public void setMYTITLE(String mYTITLE) {
		MYTITLE = mYTITLE;
	}
	public String getMYID() {
		return MYID;
	}
	public void setMYID(String mYID) {
		MYID = mYID;
	}
	public String getMYGRADE() {
		return MYGRADE;
	}
	public void setMYGRADE(String mYGRADE) {
		MYGRADE = mYGRADE;
	}
	public String getMYLOCATION() {
		return MYLOCATION;
	}
	public void setMYLOCATION(String mYLOCATION) {
		MYLOCATION = mYLOCATION;
	}
	public String getMYLINK() {
		return MYLINK;
	}
	public void setMYLINK(String mYLINK) {
		MYLINK = mYLINK;
	}
	public String getMYINSERTDATE() {
		return MYINSERTDATE;
	}
	public void setMYINSERTDATE(String mYINSERTDATE) {
		MYINSERTDATE = mYINSERTDATE;
	}
	public String getMNO() {
		return MNO;
	}
	public void setMNO(String mNO) {
		MNO = mNO;
	}
	public String getMYRECORDINSERTDATE() {
		return MYRECORDINSERTDATE;
	}
	public void setMYRECORDINSERTDATE(String mYRECORDINSERTDATE) {
		MYRECORDINSERTDATE = mYRECORDINSERTDATE;
	}
	public String getMYRECORDUPDATEDATE() {
		return MYRECORDUPDATEDATE;
	}
	public void setMYRECORDUPDATEDATE(String mYRECORDUPDATEDATE) {
		MYRECORDUPDATEDATE = mYRECORDUPDATEDATE;
	}
	
	
	
}
