package com.tu.admin.vo;

import com.tu.mem.vo.MemberVO;


public class AdminVo extends MemberVO{

	//adminvo search field
	private String adsearchcondition;     //search <select>
	private String adsearchkeyword;       //search keyword

	// adminvo search field
	public String getAdsearchcondition() {
		return adsearchcondition;
	}
	public void setAdsearchcondition(String adsearchcondition) {
		this.adsearchcondition = adsearchcondition;
	}
	public String getAdsearchkeyword() {
		return adsearchkeyword;
	}
	public void setAdsearchkeyword(String adsearchkeyword) {
		this.adsearchkeyword = adsearchkeyword;
	}
	
	@Override
	public String toString() {
		return "AdminVo [adsearchcondition=" + adsearchcondition
				+ ", adsearchkeyword=" + adsearchkeyword +"], \n"+ super.toString();
	}

}
