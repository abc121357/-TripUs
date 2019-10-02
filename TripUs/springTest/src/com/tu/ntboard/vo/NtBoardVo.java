package com.tu.ntboard.vo;

public class NtBoardVo {
	//field
	private String ntno;                  //Post number
	private String ntid;                  //Post id
	private String nttitle;               //Post title
	private String ntcontent;             //Post content
	private String nthit;                 //Post hit
	private String ntinsertdate;          //Post insertdate
	private String ntupdatedate;          //Post updatedate
	private String ntdeleteyn;            //Post deleteyn
	private String ntrecordinsertdate;    //Post recordinsertdate
	private String ntrecordupdatedate;    //Post recordupdatedate
	
	//search field
	private String ntsearchcondition;     //search <select>
	private String ntsearchkeyword;       //search keyword
	
	//constructor
	public NtBoardVo() {
	}

	public NtBoardVo(String ntno, String nttitle, String ntcontent,
			String nthit, String ntinsertdate, String ntupdatedate,
			String ntdeleteyn, String ntrecordinsertdate,
			String ntrecordupdatedate, String ntsearchcondition, 
			String ntsearchkeyword, String ntid) {
		this.ntno = ntno;
		this.ntno = ntid;
		this.nttitle = nttitle;
		this.ntcontent = ntcontent;
		this.nthit = nthit;
		this.ntinsertdate = ntinsertdate;
		this.ntupdatedate = ntupdatedate;
		this.ntdeleteyn = ntdeleteyn;
		this.ntrecordinsertdate = ntrecordinsertdate;
		this.ntrecordupdatedate = ntrecordupdatedate;
		this.ntsearchcondition = ntsearchcondition;
		this.ntsearchkeyword = ntsearchkeyword;
	}

	//GET & SET method
	public String getNtno() {
		return ntno;
	}

	public void setNtno(String ntno) {
		this.ntno = ntno;
	}
	
	public String getNtid() {
		return ntid;
	}

	public void setNtid(String ntid) {
		this.ntid = ntid;
	}

	public String getNttitle() {
		return nttitle;
	}

	public void setNttitle(String nttitle) {
		this.nttitle = nttitle;
	}

	public String getNtcontent() {
		return ntcontent;
	}

	public void setNtcontent(String ntcontent) {
		this.ntcontent = ntcontent;
	}

	public String getNthit() {
		return nthit;
	}

	public void setNthit(String nthit) {
		this.nthit = nthit;
	}

	public String getNtinsertdate() {
		return ntinsertdate;
	}

	public void setNtinsertdate(String ntinsertdate) {
		this.ntinsertdate = ntinsertdate;
	}

	public String getNtupdatedate() {
		return ntupdatedate;
	}

	public void setNtupdatedate(String ntupdatedate) {
		this.ntupdatedate = ntupdatedate;
	}

	public String getNtdeleteyn() {
		return ntdeleteyn;
	}

	public void setNtdeleteyn(String ntdeleteyn) {
		this.ntdeleteyn = ntdeleteyn;
	}

	public String getNtrecordinsertdate() {
		return ntrecordinsertdate;
	}

	public void setNtrecordinsertdate(String ntrecordinsertdate) {
		this.ntrecordinsertdate = ntrecordinsertdate;
	}

	public String getNtrecordupdatedate() {
		return ntrecordupdatedate;
	}

	public void setNtrecordupdatedate(String ntrecordupdatedate) {
		this.ntrecordupdatedate = ntrecordupdatedate;
	}

	//search GET & SET method
	public String getNtsearchcondition() {
		return ntsearchcondition;
	}

	public void setNtsearchcondition(String ntsearchcondition) {
		this.ntsearchcondition = ntsearchcondition;
	}

	public String getNtsearchkeyword() {
		return ntsearchkeyword;
	}

	public void setNtsearchkeyword(String ntsearchkeyword) {
		this.ntsearchkeyword = ntsearchkeyword;
	}
	
	//toString()
	@Override
	public String toString() {
		return "NtBoardVo [ntno=" + ntno + ", ntid=" + ntid + ", nttitle="
							+ nttitle + ", ntcontent=" + ntcontent + ", nthit=" + nthit
							+ ", ntinsertdate=" + ntinsertdate + ", ntupdatedate="
							+ ntupdatedate + ", ntdeleteyn=" + ntdeleteyn
							+ ", ntrecordinsertdate=" + ntrecordinsertdate
							+ ", ntrecordupdatedate=" + ntrecordupdatedate
							+ ", ntsearchcondition=" + ntsearchcondition
							+ ", ntsearchkeyword=" + ntsearchkeyword + "]";
	}
	
}
