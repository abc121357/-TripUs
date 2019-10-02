package com.tu.mem.vo;

public class MemberVO {
	
	private String mno;
	private String mid;
	private String mpw;
	private String mname;
	private String mnick;
	private String mgender;
	private String mhp;
	private String memail;
	private String mbirth;
	private String mdeleteyn;
	private String minsertdate;
	private String mupdatedate;
	private String mdeletedate;
	private String mprofile;
	private String mgrade;
	private String snsid;
	private String snsage;
	private String snsbirth;
	private String snsconnectdate;
	private String mrecordinsertdate;
	private String mrecordupdatedate;
	private String number;
	
	public MemberVO() {
		super();
	}

	public MemberVO(String mno, String mid, String mpw, String mname,
			String mnick, String mgender, String mhp, String memail,
			String mbirth, String mdeleteyn, String minsertdate,
			String mupdatedate, String mdeletedate, String mprofile,
			String mgrade, String snsid, String snsage, String snsbirth,
			String snsconnectdate, String mrecordinsertdate,
			String mrecordupdatedate, String number) {
		super();
		this.mno = mno;
		this.mid = mid;
		this.mpw = mpw;
		this.mname = mname;
		this.mnick = mnick;
		this.mgender = mgender;
		this.mhp = mhp;
		this.memail = memail;
		this.mbirth = mbirth;
		this.mdeleteyn = mdeleteyn;
		this.minsertdate = minsertdate;
		this.mupdatedate = mupdatedate;
		this.mdeletedate = mdeletedate;
		this.mprofile = mprofile;
		this.mgrade = mgrade;
		this.snsid = snsid;
		this.snsage = snsage;
		this.snsbirth = snsbirth;
		this.snsconnectdate = snsconnectdate;
		this.mrecordinsertdate = mrecordinsertdate;
		this.mrecordupdatedate = mrecordupdatedate;
		this.number = number;
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

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMnick() {
		return mnick;
	}

	public void setMnick(String mnick) {
		this.mnick = mnick;
	}

	public String getMgender() {
		return mgender;
	}

	public void setMgender(String mgender) {
		this.mgender = mgender;
	}

	public String getMhp() {
		return mhp;
	}

	public void setMhp(String mhp) {
		this.mhp = mhp;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public String getMbirth() {
		return mbirth;
	}

	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}

	public String getMdeleteyn() {
		return mdeleteyn;
	}

	public void setMdeleteyn(String mdeleteyn) {
		this.mdeleteyn = mdeleteyn;
	}

	public String getMinsertdate() {
		return minsertdate;
	}

	public void setMinsertdate(String minsertdate) {
		this.minsertdate = minsertdate;
	}

	public String getMupdatedate() {
		return mupdatedate;
	}

	public void setMupdatedate(String mupdatedate) {
		this.mupdatedate = mupdatedate;
	}

	public String getMdeletedate() {
		return mdeletedate;
	}

	public void setMdeletedate(String mdeletedate) {
		this.mdeletedate = mdeletedate;
	}

	public String getMprofile() {
		return mprofile;
	}

	public void setMprofile(String mprofile) {
		this.mprofile = mprofile;
	}

	public String getMgrade() {
		return mgrade;
	}

	public void setMgrade(String mgrade) {
		this.mgrade = mgrade;
	}

	public String getSnsid() {
		return snsid;
	}

	public void setSnsid(String snsid) {
		this.snsid = snsid;
	}

	public String getSnsage() {
		return snsage;
	}

	public void setSnsage(String snsage) {
		this.snsage = snsage;
	}

	public String getSnsbirth() {
		return snsbirth;
	}

	public void setSnsbirth(String snsbirth) {
		this.snsbirth = snsbirth;
	}

	public String getSnsconnectdate() {
		return snsconnectdate;
	}

	public void setSnsconnectdate(String snsconnectdate) {
		this.snsconnectdate = snsconnectdate;
	}

	public String getMrecordinsertdate() {
		return mrecordinsertdate;
	}

	public void setMrecordinsertdate(String mrecordinsertdate) {
		this.mrecordinsertdate = mrecordinsertdate;
	}

	public String getMrecordupdatedate() {
		return mrecordupdatedate;
	}

	public void setMrecordupdatedate(String mrecordupdatedate) {
		this.mrecordupdatedate = mrecordupdatedate;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	@Override
	public String toString() {
		return "MemberVO [mno=" + mno + ", mid=" + mid + ", mpw=" + mpw
				+ ", mname=" + mname + ", mnick=" + mnick + ", mgender="
				+ mgender + ", mhp=" + mhp + ", memail=" + memail + ", mbirth="
				+ mbirth + ", mdeleteyn=" + mdeleteyn + ", minsertdate="
				+ minsertdate + ", mupdatedate=" + mupdatedate
				+ ", mdeletedate=" + mdeletedate + ", mprofile=" + mprofile
				+ ", mgrade=" + mgrade + ", snsid=" + snsid + ", snsage="
				+ snsage + ", snsbirth=" + snsbirth + ", snsconnectdate="
				+ snsconnectdate + ", mrecordinsertdate=" + mrecordinsertdate
				+ ", mrecordupdatedate=" + mrecordupdatedate + ", number="
				+ number + "]";
	}
	
}// end of MemverVO class 
