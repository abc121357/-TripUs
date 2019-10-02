package com.tu.fsboard.vo;

public class FsBoardVO {
	String viewname;
	String contentid;
	String viewno;
	
	public FsBoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FsBoardVO(String viewname, String contentid, String viewno) {
		super();
		this.viewname = viewname;
		this.contentid = contentid;
		this.viewno = viewno;
	}

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

	@Override
	public String toString() {
		return "FsBoardVO [viewname=" + viewname + ", contentid=" + contentid
				+ ", viewno=" + viewno + "]";
	}
	
	
}
