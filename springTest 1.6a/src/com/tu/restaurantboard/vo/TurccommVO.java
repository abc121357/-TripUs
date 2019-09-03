package com.tu.restaurantboard.vo;

/**
파일명: TurccommVO
설 명: 맛집 후기 게시글의 댓글을 위한 VO
작성일: 2019/8/26
작성자: LHJ
*/

public class TurccommVO {

	private String rcno; // size : 6
	private String rcid; // size : 500
	private String rcnick; // size : 100
	private String rcprofile; // size : 500
	private String rccontent; // size : 300
	private String rcinsertdate; // size : date
	private String rcupdatedate; // size : date
	private String rcdeleteyn; // size : 1
	private String rcrecordinsertdate; // size : date
	private String rcrecordupdatedate; // size : date
	
	public TurccommVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public String getRcno() {
		return rcno;
	}
	public void setRcno(String rcno) {
		this.rcno = rcno;
	}
	public String getRcid() {
		return rcid;
	}
	public void setRcid(String rcid) {
		this.rcid = rcid;
	}
	public String getRcnick() {
		return rcnick;
	}
	public void setRcnick(String rcnick) {
		this.rcnick = rcnick;
	}
	public String getRcprofile() {
		return rcprofile;
	}
	public void setRcprofile(String rcprofile) {
		this.rcprofile = rcprofile;
	}
	public String getRccontent() {
		return rccontent;
	}
	public void setRccontent(String rccontent) {
		this.rccontent = rccontent;
	}
	public String getRcinsertdate() {
		return rcinsertdate;
	}
	public void setRcinsertdate(String rcinsertdate) {
		this.rcinsertdate = rcinsertdate;
	}
	public String getRcupdatedate() {
		return rcupdatedate;
	}
	public void setRcupdatedate(String rcupdatedate) {
		this.rcupdatedate = rcupdatedate;
	}
	public String getRcdeleteyn() {
		return rcdeleteyn;
	}
	public void setRcdeleteyn(String rcdeleteyn) {
		this.rcdeleteyn = rcdeleteyn;
	}
	public String getRcrecordinsertdate() {
		return rcrecordinsertdate;
	}
	public void setRcrecordinsertdate(String rcrecordinsertdate) {
		this.rcrecordinsertdate = rcrecordinsertdate;
	}
	public String getRcrecordupdatedate() {
		return rcrecordupdatedate;
	}
	public void setRcrecordupdatedate(String rcrecordupdatedate) {
		this.rcrecordupdatedate = rcrecordupdatedate;
	}
	
	
	
	
	
	
	
	
	
	
}
