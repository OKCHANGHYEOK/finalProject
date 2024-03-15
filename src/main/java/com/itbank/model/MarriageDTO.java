package com.itbank.model;

import java.sql.Date;

//	------------ -------- ------------- 
//	IDX          NOT NULL NUMBER        
//	USER1        NOT NULL VARCHAR2(100) 
//	USER2        NOT NULL VARCHAR2(100) 
//	MARRIAGEDATE NOT NULL DATE 

public class MarriageDTO {
	
	private int idx;
	private String user1;
	private String user2;
	private Date marriageDate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUser1() {
		return user1;
	}
	public void setUser1(String user1) {
		this.user1 = user1;
	}
	public String getUser2() {
		return user2;
	}
	public void setUser2(String user2) {
		this.user2 = user2;
	}
	public Date getMarriageDate() {
		return marriageDate;
	}
	public void setMarriageDate(Date marriageDate) {
		this.marriageDate = marriageDate;
	}
	
	

}
