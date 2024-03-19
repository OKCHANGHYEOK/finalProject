package com.itbank.model;

import java.sql.Date;

//	IDX      NOT NULL NUMBER        
//	USERID   NOT NULL VARCHAR2(100) 
//	TYPE              VARCHAR2(50)  
//	JOINDATE          DATE 

public class MembershipDTO {
	
	private int idx;
	private String userid;
	private String type;
	private Date joinDate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	
	

}
