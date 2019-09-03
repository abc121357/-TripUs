package com.tu.lp.vo;

public class LoginVO {
	String mno;
	String mid;
	String mpw;
	String mupdatedate;
	String mdeleteyn;
	String mdeletedate;
	
	public LoginVO(){
	}
	
	public LoginVO(String mno, String mid, String mpw, String mupdatedate,
			String mdeleteyn, String mdeletedate){
		this.mno=mno;
		this.mid=mid;
		this.mpw=mpw;
		this.mupdatedate=mupdatedate;
		this.mdeleteyn=mdeleteyn;
		this.mdeletedate=mdeletedate;
	}
	
	public String getMno() {
		return mno;
	}
	public void setMno(String mno) {
		this.mno = mno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMupdatedate() {
		return mupdatedate;
	}
	public void setMupdatedate(String mupdatedate) {
		this.mupdatedate = mupdatedate;
	}
	public String getMdeleteyn() {
		return mdeleteyn;
	}
	public void setMdeleteyn(String mdeleteyn) {
		this.mdeleteyn = mdeleteyn;
	}
	
	public String getMdeletedate() {
		return mdeletedate;
	}
	public void setMdeletedate(String mdeletedate) {
		this.mdeletedate = mdeletedate;
	}
	
	
	
}
