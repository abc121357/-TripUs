package com.tu.restaurant.vo;


/**
파일명: TurtcommVO
설 명: 맛집 상세 정보 게시글의 댓글을 위한 VO
작성일: 2019/8/26
작성자: LHJ
*/

public class TurtcommVO {

	
	private String rtno; // size : 6
	private String rtid; // size : 500
	private String rtnick; // size : 100
	private String rtprofile; // size : 500
	private String rtcontent; // size : 300
	private String rtinsertdate; // size : date
	private String rtupdatedate; // size : date
	private String rtdeleteyn; // size : 1
	private String rtrecordinsertdate; // size : date
	private String rtrecordupdatedate; // size : date
	
	public TurtcommVO(String rtno, String rtid, String rtnick,
			String rtprofile, String rtcontent, String rtinsertdate,
			String rtupdatedate, String rtdeleteyn, String rtrecordinsertdate,
			String rtrecordupdatedate) {
		super();
		this.rtno = rtno;
		this.rtid = rtid;
		this.rtnick = rtnick;
		this.rtprofile = rtprofile;
		this.rtcontent = rtcontent;
		this.rtinsertdate = rtinsertdate;
		this.rtupdatedate = rtupdatedate;
		this.rtdeleteyn = rtdeleteyn;
		this.rtrecordinsertdate = rtrecordinsertdate;
		this.rtrecordupdatedate = rtrecordupdatedate;
	}
	
	public String getRtno() {
		return rtno;
	}
	public void setRtno(String rtno) {
		this.rtno = rtno;
	}
	public String getRtid() {
		return rtid;
	}
	public void setRtid(String rtid) {
		this.rtid = rtid;
	}
	public String getRtnick() {
		return rtnick;
	}
	public void setRtnick(String rtnick) {
		this.rtnick = rtnick;
	}
	public String getRtprofile() {
		return rtprofile;
	}
	public void setRtprofile(String rtprofile) {
		this.rtprofile = rtprofile;
	}
	public String getRtcontent() {
		return rtcontent;
	}
	public void setRtcontent(String rtcontent) {
		this.rtcontent = rtcontent;
	}
	public String getRtinsertdate() {
		return rtinsertdate;
	}
	public void setRtinsertdate(String rtinsertdate) {
		this.rtinsertdate = rtinsertdate;
	}
	public String getRtupdatedate() {
		return rtupdatedate;
	}
	public void setRtupdatedate(String rtupdatedate) {
		this.rtupdatedate = rtupdatedate;
	}
	public String getRtdeleteyn() {
		return rtdeleteyn;
	}
	public void setRtdeleteyn(String rtdeleteyn) {
		this.rtdeleteyn = rtdeleteyn;
	}
	public String getRtrecordinsertdate() {
		return rtrecordinsertdate;
	}
	public void setRtrecordinsertdate(String rtrecordinsertdate) {
		this.rtrecordinsertdate = rtrecordinsertdate;
	}
	public String getRtrecordupdatedate() {
		return rtrecordupdatedate;
	}
	public void setRtrecordupdatedate(String rtrecordupdatedate) {
		this.rtrecordupdatedate = rtrecordupdatedate;
	}
	public TurtcommVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
}
