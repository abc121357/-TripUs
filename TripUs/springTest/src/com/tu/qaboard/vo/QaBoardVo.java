package com.tu.qaboard.vo;

public class QaBoardVo {
	//field
	private String qano;                   //Post number 
	private String qaid;                   //Post id
	private String qatitle;	               //Post title
	private String qacontent;	           //Post content   
	private String qatype;	               //Post type
	private String qaanswertype;           //Post andswer type
	private String qasecretyn;             //Post qasecretyn
	private String qaimage;	               //Post upload image   
	private String qaref;                  //Post ref
	private int    qastep;                 //Post step
	private String qainsertdate;	       //Post insertdate
	private String qaupdatedate;	       //Post updatedate
	private String qadeleteyn;             //Post deleteyn
	private String qarecordinsertdate;	   //Post recordinsertdate
	private String qarecordupdatedate;     //Post recordupdatedate

	//search field
	private String qasearchcondition;      //search <select>
	private String qasearchkeyword;        //search keyword
	
	//reply field
	private String qareplycontent;         //reply content 
	
	//upload field
	private String qarealfilename;  	   //upload file name
	
	//constructor
	public QaBoardVo() {
	}

	public QaBoardVo(String qano, String qaid, String qatitle,
			String qacontent, String qatype, String qaanswertype,
			String qasecretyn, String qaimage, String qaref, int qastep,
			String qainsertdate, String qaupdatedate, String qadeleteyn,
			String qarecordinsertdate, String qarecordupdatedate,
			String qasearchcondition, String qasearchkeyword,
			String qareplycontent, String qarealfilename) {
		this.qano = qano;
		this.qaid = qaid;
		this.qatitle = qatitle;
		this.qacontent = qacontent;
		this.qatype = qatype;
		this.qaanswertype = qaanswertype;
		this.qasecretyn = qasecretyn;
		this.qaimage = qaimage;
		this.qaref = qaref;
		this.qastep = qastep;
		this.qainsertdate = qainsertdate;
		this.qaupdatedate = qaupdatedate;
		this.qadeleteyn = qadeleteyn;
		this.qarecordinsertdate = qarecordinsertdate;
		this.qarecordupdatedate = qarecordupdatedate;
		this.qasearchcondition = qasearchcondition;
		this.qasearchkeyword = qasearchkeyword;
		this.qareplycontent = qareplycontent;
		this.qarealfilename = qarealfilename;
	}

	//GET & SET method
	public String getQano() {
		return qano;
	}

	public void setQano(String qano) {
		this.qano = qano;
	}

	public String getQaid() {
		return qaid;
	}

	public void setQaid(String qaid) {
		this.qaid = qaid;
	}

	public String getQatitle() {
		return qatitle;
	}

	public void setQatitle(String qatitle) {
		this.qatitle = qatitle;
	}

	public String getQacontent() {
		return qacontent;
	}

	public void setQacontent(String qacontent) {
		this.qacontent = qacontent;
	}

	public String getQatype() {
		return qatype;
	}

	public void setQatype(String qatype) {
		this.qatype = qatype;
	}

	public String getQaanswertype() {
		return qaanswertype;
	}

	public void setQaanswertype(String qaanswertype) {
		this.qaanswertype = qaanswertype;
	}

	public String getQasecretyn() {
		return qasecretyn;
	}

	public void setQasecretyn(String qasecretyn) {
		this.qasecretyn = qasecretyn;
	}

	public String getQaimage() {
		return qaimage;
	}

	public void setQaimage(String qaimage) {
		this.qaimage = qaimage;
	}

	public String getQaref() {
		return qaref;
	}

	public void setQaref(String qaref) {
		this.qaref = qaref;
	}

	public int getQastep() {
		return qastep;
	}

	public void setQastep(int qastep) {
		this.qastep = qastep;
	}

	public String getQainsertdate() {
		return qainsertdate;
	}

	public void setQainsertdate(String qainsertdate) {
		this.qainsertdate = qainsertdate;
	}

	public String getQaupdatedate() {
		return qaupdatedate;
	}

	public void setQaupdatedate(String qaupdatedate) {
		this.qaupdatedate = qaupdatedate;
	}

	public String getQadeleteyn() {
		return qadeleteyn;
	}

	public void setQadeleteyn(String qadeleteyn) {
		this.qadeleteyn = qadeleteyn;
	}

	public String getQarecordinsertdate() {
		return qarecordinsertdate;
	}

	public void setQarecordinsertdate(String qarecordinsertdate) {
		this.qarecordinsertdate = qarecordinsertdate;
	}

	public String getQarecordupdatedate() {
		return qarecordupdatedate;
	}

	public void setQarecordupdatedate(String qarecordupdatedate) {
		this.qarecordupdatedate = qarecordupdatedate;
	}

	public String getQasearchcondition() {
		return qasearchcondition;
	}

	public void setQasearchcondition(String qasearchcondition) {
		this.qasearchcondition = qasearchcondition;
	}

	public String getQasearchkeyword() {
		return qasearchkeyword;
	}

	public void setQasearchkeyword(String qasearchkeyword) {
		this.qasearchkeyword = qasearchkeyword;
	}

	public String getQareplycontent() {
		return qareplycontent;
	}

	public void setQareplycontent(String qareplycontent) {
		this.qareplycontent = qareplycontent;
	}

	public String getQarealfilename() {
		return qarealfilename;
	}

	public void setQarealfilename(String qarealfilename) {
		this.qarealfilename = qarealfilename;
	}

	//toString()
	@Override
	public String toString() {
		return "QaBoardVo [qano=" + qano + ", qaid=" + qaid + ", qatitle="
				+ qatitle + ", qacontent=" + qacontent + ", qatype=" + qatype
				+ ", qaanswertype=" + qaanswertype + ", qasecretyn="
				+ qasecretyn + ", qaimage=" + qaimage + ", qaref=" + qaref
				+ ", qastep=" + qastep + ", qainsertdate=" + qainsertdate
				+ ", qaupdatedate=" + qaupdatedate + ", qadeleteyn="
				+ qadeleteyn + ", qarecordinsertdate=" + qarecordinsertdate
				+ ", qarecordupdatedate=" + qarecordupdatedate
				+ ", qasearchcondition=" + qasearchcondition
				+ ", qasearchkeyword=" + qasearchkeyword + ", qareplycontent="
				+ qareplycontent + ", qarealfilename=" + qarealfilename + "]";
	}

}