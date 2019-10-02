package com.tu.faboard.vo;

public class FaPaging {
		
	//field
	public int eENTRY_SIZE;
	public int sENTRY_SIZE;
	
	public FaPaging() {
	}

	public FaPaging(int eENTRY_SIZE, int sENTRY_SIZE) {
		this.eENTRY_SIZE = eENTRY_SIZE;
		this.sENTRY_SIZE = sENTRY_SIZE;
	}

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

	@Override
	public String toString() {
		return "FaPaging [eENTRY_SIZE=" + eENTRY_SIZE + ", sENTRY_SIZE="
				+ sENTRY_SIZE + "]";
	}
	
	
	
	

	
}
