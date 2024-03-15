package com.itbank.model;

import java.sql.Date;

//	IDX           NOT NULL NUMBER        
//	USERID        NOT NULL VARCHAR2(100) 
//	USERPW        NOT NULL VARCHAR2(200) 
//	USERNAME      NOT NULL VARCHAR2(100) 
//	EMAIL         NOT NULL VARCHAR2(100) 
//	GENDER                 VARCHAR2(20)  
//	PHONENUMBER   NOT NULL VARCHAR2(100) 
//	BIRTHYEAR     NOT NULL NUMBER        
//	BIRTHMONTH    NOT NULL NUMBER        
//	BIRTHDAY      NOT NULL NUMBER        
//	JOINDATE               DATE          
//	LASTLOGINDATE          DATE  


public class MemberDTO extends ConditionDTO {
	
	private int idx;
	private String userid;
	private String userpw;
	private String username;
	private String email;
	private String gender;
	private String phoneNumber;
	private int birthYear;
	private int birthMonth;
	private int birthDay;
	private Date joinDate;
	private Date lastLoginDate;
	private int isManager;
	
	
	public int getIsManager() {
		return isManager;
	}
	public void setIsManager(int isManager) {
		this.isManager = isManager;
	}
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
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public int getBirthYear() {
		return birthYear;
	}
	public void setBirthYear(int birthYear) {
		this.birthYear = birthYear;
	}
	public int getBirthMonth() {
		return birthMonth;
	}
	public void setBirthMonth(int birthMonth) {
		this.birthMonth = birthMonth;
	}
	public int getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(int birthDay) {
		this.birthDay = birthDay;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public Date getLastLoginDate() {
		return lastLoginDate;
	}
	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}
}
