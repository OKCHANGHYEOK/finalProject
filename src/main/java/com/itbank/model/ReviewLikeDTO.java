package com.itbank.model;

//	USERID    NOT NULL VARCHAR2(100) 
//	BOARD_IDX NOT NULL NUMBER  

public class ReviewLikeDTO {
	
	private String userid;
	private int board_idx;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	
	
}
