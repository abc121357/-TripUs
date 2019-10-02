package com.tu.faboard.vo;

public class FaVo{
	//field
	private String fano;                //Post number
	private String faid;                //Post id
	private String fatitle;             //Post title
	private String facontent;           //Post content
	private String fatype;              //Post type
	private String faaddsite;         	//Post sitename
	private String fainsertdate;        //Post insertdate
	private String faupdatedate;        //Post updatedate
	private String fadeleteyn;          //Post deleteyn
	private String farecordinsertdate;  //Post recordinsertdate
	private String farecordupdatedate;  //Post recordupdatedate
	
	//search field
	private String fasearchcondition;   //search <select>
	private String fasearchkeyword;     //search keyword
	
	public int eENTRY_SIZE;
	public int sENTRY_SIZE;
	
	//constructor
	public FaVo() {
	}
	
	public FaVo(String fano, String faid, String fatitle, String facontent,
			String fatype, String faaddsite, String fainsertdate,
			String faupdatedate, String fadeleteyn, String farecordinsertdate,
			String farecordupdatedate, String fasearchcondition,
			String fasearchkeyword, int eENTRY_SIZE, int sENTRY_SIZE) {
		this.fano = fano;
		this.faid = faid;
		this.fatitle = fatitle;
		this.facontent = facontent;
		this.fatype = fatype;
		this.faaddsite = faaddsite;
		this.fainsertdate = fainsertdate;
		this.faupdatedate = faupdatedate;
		this.fadeleteyn = fadeleteyn;
		this.farecordinsertdate = farecordinsertdate;
		this.farecordupdatedate = farecordupdatedate;
		this.fasearchcondition = fasearchcondition;
		this.fasearchkeyword = fasearchkeyword;
		this.eENTRY_SIZE = eENTRY_SIZE;
		this.sENTRY_SIZE = sENTRY_SIZE;
	}

	//get&set method
	public String getFano() {
		return fano;
	}
	
	public void setFano(String fano) {
		this.fano = fano;
	}

	public String getFaid() {
		return faid;
	}

	public void setFaid(String faid) {
		this.faid = faid;
	}

	public String getFatitle() {
		return fatitle;
	}

	public void setFatitle(String fatitle) {
		this.fatitle = fatitle;
	}

	public String getFacontent() {
		return facontent;
	}

	public void setFacontent(String facontent) {
		this.facontent = facontent;
	}

	public String getFatype() {
		return fatype;
	}

	public void setFatype(String fatype) {
		this.fatype = fatype;
	}

	public String getFainsertdate() {
		return fainsertdate;
	}

	public void setFainsertdate(String fainsertdate) {
		this.fainsertdate = fainsertdate;
	}

	public String getFaupdatedate() {
		return faupdatedate;
	}

	public void setFaupdatedate(String faupdatedate) {
		this.faupdatedate = faupdatedate;
	}

	public String getFadeleteyn() {
		return fadeleteyn;
	}

	public void setFadeleteyn(String fadeleteyn) {
		this.fadeleteyn = fadeleteyn;
	}

	public String getFarecordinsertdate() {
		return farecordinsertdate;
	}

	public void setFarecordinsertdate(String farecordinsertdate) {
		this.farecordinsertdate = farecordinsertdate;
	}

	public String getFarecordupdatedate() {
		return farecordupdatedate;
	}

	public void setFarecordupdatedate(String farecordupdatedate) {
		this.farecordupdatedate = farecordupdatedate;
	}
	
	//search get&set method
	public String getFasearchcondition() {
		return fasearchcondition;
	}

	public void setFasearchcondition(String fasearchcondition) {
		this.fasearchcondition = fasearchcondition;
	}

	public String getFasearchkeyword() {
		return fasearchkeyword;
	}

	public void setFasearchkeyword(String fasearchkeyword) {
		this.fasearchkeyword = fasearchkeyword;
	}
	
	//sitename get&set method
	public void setFaaddsite(String faaddsite) {
		this.faaddsite = faaddsite;
	}

	public String getFaaddsite() {
		return faaddsite;
	}
	
	//paging
	public int geteENTRY_SIZE() {
		return eENTRY_SIZE;
	}

	public void seteENTRY_SIZE(int eENTRY_SIZE) {
		this.eENTRY_SIZE = eENTRY_SIZE;
	}

	public int getsENTRY_SIZE() {
		return sENTRY_SIZE;
	}

	public void setsENTRY_SIZE(int sENTRY_SIZE) {
		this.sENTRY_SIZE = sENTRY_SIZE;
	}

	//toString()
	@Override
	public String toString() {
		return "FaVo [fano=" + fano + ", faid=" + faid + ", fatitle=" + fatitle
				+ ", facontent=" + facontent + ", fatype=" + fatype
				+ ", faaddsite=" + faaddsite + ", fainsertdate=" + fainsertdate
				+ ", faupdatedate=" + faupdatedate + ", fadeleteyn="
				+ fadeleteyn + ", farecordinsertdate=" + farecordinsertdate
				+ ", farecordupdatedate=" + farecordupdatedate
				+ ", fasearchcondition=" + fasearchcondition
				+ ", fasearchkeyword=" + fasearchkeyword + ", eENTRY_SIZE="
				+ eENTRY_SIZE + ", sENTRY_SIZE=" + sENTRY_SIZE + "]";
	}

}