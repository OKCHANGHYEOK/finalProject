package com.itbank.model;

import java.sql.Date;

//IDX        NOT NULL NUMBER        
//USERID     NOT NULL VARCHAR2(100) 
//TYPE                VARCHAR2(50)  
//JOINDATE            DATE          
//PAYNUM     NOT NULL NUMBER        
//PAYMETHOD  NOT NULL VARCHAR2(50)  
//PRICE      NOT NULL NUMBER        
//MATCHCOUNT NOT NULL NUMBER  

public class MembershipDTO {
   
   private int idx;
   private String userid;
   private String type;
   private Date joinDate;
   private String payNum;
   private String payMethod;
   private int price;
   private int matchCount;
   
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
public String getPayNum() {
	return payNum;
}
public void setPayNum(String payNum) {
	this.payNum = payNum;
}
public String getPayMethod() {
	return payMethod;
}
public void setPayMethod(String payMethod) {
	this.payMethod = payMethod;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public int getMatchCount() {
	return matchCount;
}
public void setMatchCount(int matchCount) {
	this.matchCount = matchCount;
}
   
   
   
   
   

   
   

}
