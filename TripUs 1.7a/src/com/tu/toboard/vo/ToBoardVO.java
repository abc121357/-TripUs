package com.tu.toboard.vo;

public class ToBoardVO {
	String viewname;
	String contentid;
	String viewno;
	public String getViewname() {
		return viewname;
	}
	public void setViewname(String viewname) {
		this.viewname = viewname;
	}
	public String getContentid() {
		return contentid;
	}
	public void setContentid(String contentid) {
		this.contentid = contentid;
	}
	public String getViewno() {
		return viewno;
	}
	public void setViewno(String viewno) {
		this.viewno = viewno;
	}
	
	public ToBoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ToBoardVO(String viewname, String contentid, String viewno) {
		super();
		this.viewname = viewname;
		this.contentid = contentid;
		this.viewno = viewno;
	}
	@Override
	public String toString() {
		return "CoBoardVO [viewname=" + viewname + ", contentid=" + contentid
				+ ", viewno=" + viewno + "]";
	}
	
	
	
}
