package com.tu.myfavorite.vo;

/**
파일명: MyfavoriteVO
설 명: 즐겨찾기에 임시로 저장하기 위한 VO
작성일: 2019/8/26
작성자: LHJ
*/

public class MyFavoriteVO {

	private String myno; // size : 14
	private String mytitle; // size : 60
	private String myid; // size : 500
	private String mygrade; // size : 1
	private String mylocation; // size : 100
	private String mylink; // size : 300
	private int mycno; // size : 8
	private String myinsertdate; // size: date
	private String mno; // size : 13
	private String myrecordinsertdate; // size : date
	private String myrecordupdatedate; // size : date

	public MyFavoriteVO() {
	}

	public MyFavoriteVO(String myno, String mytitle, String myid, String mygrade, String mylocation, String mylink, String myinsertdate, String mno, String myrecordinsertdate, String myrecordupdatedate) {
		this.myno = myno;
		this.mytitle = mytitle;
		this.myid = myid;
		this.mygrade = mygrade;
		this.mylocation = mylocation;
		this.mylink = mylink;
		this.myinsertdate = myinsertdate;
		this.mno = mno;
		this.myrecordinsertdate = myrecordinsertdate;
		this.myrecordupdatedate = myrecordupdatedate;
	}

	public String getMyno() {
		return myno;
	}

	public void setMyno(String myno) {
		this.myno = myno;
	}

	public String getMytitle() {
		return mytitle;
	}

	public void setMytitle(String mytitle) {
		this.mytitle = mytitle;
	}

	public String getMyid() {
		return myid;
	}

	public void setMyid(String myid) {
		this.myid = myid;
	}

	public String getMygrade() {
		return mygrade;
	}

	public void setMygrade(String mygrade) {
		this.mygrade = mygrade;
	}

	public String getMylocation() {
		return mylocation;
	}

	public void setMylocation(String mylocation) {
		this.mylocation = mylocation;
	}

	public String getMylink() {
		return mylink;
	}

	public void setMylink(String mylink) {
		this.mylink = mylink;
	}
	
	public int getMycno() {
		return mycno;
	}

	public void setMycno(int mycno) {
		this.mycno = mycno;
	}
	
	public String getMyinsertdate() {
		return myinsertdate;
	}

	public void setMyinsertdate(String myinsertdate) {
		this.myinsertdate = myinsertdate;
	}

	public String getMno() {
		return mno;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}

	public String getMyrecordinsertdate() {
		return myrecordinsertdate;
	}

	public void setMyrecordinsertdate(String myrecordinsertdate) {
		this.myrecordinsertdate = myrecordinsertdate;
	}

	public String getMyrecordupdatedate() {
		return myrecordupdatedate;
	}

	public void setMyrecordupdatedate(String myrecordupdatedate) {
		this.myrecordupdatedate = myrecordupdatedate;
	}
}
