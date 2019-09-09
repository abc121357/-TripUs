package com.tu.restaurantboard.vo;

/**
파일명: TurbboardVO
설 명: 맛집 후기 게시글을 위한 VO
작성일: 2019/8/26
작성자: LHJ
*/

public class TurbboardVO {

	
	private String rbno; // 글번호 size : 6
	private String rbtitle; // 제목 size : 60
	private String rbcontent; // 내용 size : 1000
	private String rbid; // 유저 아이디 size : 500
	private int rbhit; // 조회수 size : 6
	private String rbimage; // 이미지 size : 500
	private String rbtag; // 태그 size : 30
	private int rblike; // 추천 size : 4
	private String rbinsertdate; // 등록일 size : date
	private String rbupdatedate; // 수정일 size : date
	private String rbdeleteyn; // 삭제여부 size : 1
	private String rbrecordinsertdate; // db등록일 size : date
	private String rbrecordupdatedate; // db수정일 size : date
	
	
	
	public TurbboardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getRbno() {
		return rbno;
	}
	public void setRbno(String rbno) {
		this.rbno = rbno;
	}
	public String getRbtitle() {
		return rbtitle;
	}
	public void setRbtitle(String rbtitle) {
		this.rbtitle = rbtitle;
	}
	public String getRbcontent() {
		return rbcontent;
	}
	public void setRbcontent(String rbcontent) {
		this.rbcontent = rbcontent;
	}
	public String getRbid() {
		return rbid;
	}
	public void setRbid(String rbid) {
		this.rbid = rbid;
	}
	public int getRbhit() {
		return rbhit;
	}
	public void setRbhit(int rbhit) {
		this.rbhit = rbhit;
	}
	public String getRbimage() {
		return rbimage;
	}
	public void setRbimage(String rbimage) {
		this.rbimage = rbimage;
	}
	public String getRbtag() {
		return rbtag;
	}
	public void setRbtag(String rbtag) {
		this.rbtag = rbtag;
	}
	public int getRblike() {
		return rblike;
	}
	public void setRblike(int rblike) {
		this.rblike = rblike;
	}
	public String getRbinsertdate() {
		return rbinsertdate;
	}
	public void setRbrbinsertdate(String rbinsertdate) {
		this.rbinsertdate = rbinsertdate;
	}
	public String getrbupdatedate() {
		return rbupdatedate;
	}
	public void setrbupdatedate(String rbupdatedate) {
		this.rbupdatedate = rbupdatedate;
	}
	public String getrbdeleteyn() {
		return rbdeleteyn;
	}
	public void setrbdeleteyn(String rbdeleteyn) {
		this.rbdeleteyn = rbdeleteyn;
	}
	public String getrbrecordinsertdate() {
		return rbrecordinsertdate;
	}
	public void setrbrecordinsertdate(String rbrecordinsertdate) {
		this.rbrecordinsertdate = rbrecordinsertdate;
	}
	public String getrbrecordupdatedate() {
		return rbrecordupdatedate;
	}
	public void setrbrecordupdatedate(String rbrecordupdatedate) {
		this.rbrecordupdatedate = rbrecordupdatedate;
	}
	
	
	
}
