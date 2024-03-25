package com.itbank.model;

//	이름       널?       유형            
//	-------- -------- ------------- 
//	IDX      NOT NULL NUMBER        
//	REQUSER  NOT NULL VARCHAR2(100) 
//	RESPUSER NOT NULL VARCHAR2(100) 
//	MATCHED           NUMBER


public class MatchDTO {
	
	private int idx;
	private String reqUser;
	private String respUser;
	private String reqUsername;
	private String respUsername;
	
	public String getReqUsername() {
		return reqUsername;
	}
	public void setReqUsername(String reqUsername) {
		this.reqUsername = reqUsername;
	}
	public String getRespUsername() {
		return respUsername;
	}
	public void setRespUsername(String respUsername) {
		this.respUsername = respUsername;
	}
	private int matched;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getReqUser() {
		return reqUser;
	}
	public void setReqUser(String reqUser) {
		this.reqUser = reqUser;
	}
	public String getRespUser() {
		return respUser;
	}
	public void setRespUser(String respUser) {
		this.respUser = respUser;
	}
	public int getMatched() {
		return matched;
	}
	public void setMatched(int matched) {
		this.matched = matched;
	}
	
	
}
