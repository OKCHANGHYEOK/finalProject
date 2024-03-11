package com.itbank.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

//	IDX       NOT NULL NUMBER         
//	TITLE     NOT NULL VARCHAR2(500)  
//	WRITER    NOT NULL VARCHAR2(100)  
//	CONTENT   NOT NULL VARCHAR2(3000) 
//	IMG       NOT NULL VARCHAR2(500)  
//	WRITEDATE          DATE  

public class ReviewDTO {
	
	private int idx;
	private String title;
	private String writer;
	private String content;
	private String img;
	private Date writeDate;
	
	private MultipartFile upload;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	
	
}
