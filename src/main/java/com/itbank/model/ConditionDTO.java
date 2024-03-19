package com.itbank.model;

import org.springframework.web.multipart.MultipartFile;
    


public class ConditionDTO {
	private int idx;
	private String userid;
	private int marriedCount;
	private String residence;
	private String education;
	private String job;
	private int salary;
	private String religion;
	private int estate;
	private int owncar;
	private int height;
	private String profile;
	private String introduce;
	private int isMe;
	private String grade;
	
	private MultipartFile upload;
	
	
	
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
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
	public int getMarriedCount() {
		return marriedCount;
	}
	public void setMarriedCount(int marriedCount) {
		this.marriedCount = marriedCount;
	}
	public String getResidence() {
		return residence;
	}
	public void setResidence(String residence) {
		this.residence = residence;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public String getReligion() {
		return religion;
	}
	public void setReligion(String religion) {
		this.religion = religion;
	}
	public int getEstate() {
		return estate;
	}
	public void setEstate(int estate) {
		this.estate = estate;
	}
	public int getOwncar() {
		return owncar;
	}
	public void setOwncar(int owncar) {
		this.owncar = owncar;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public int getIsMe() {
		return isMe;
	}
	public void setIsMe(int isMe) {
		this.isMe = isMe;
	}
}
