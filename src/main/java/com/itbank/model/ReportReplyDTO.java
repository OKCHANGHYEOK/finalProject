package com.itbank.model;

//이름        널?       유형             
//--------- -------- -------------- 
//IDX       NOT NULL NUMBER         
//REPORTIDX NOT NULL NUMBER         
//CONTENT   NOT NULL VARCHAR2(2000) 

public class ReportReplyDTO {

	private int idx;
	private int reportIdx;
	private String content;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getReportIdx() {
		return reportIdx;
	}
	public void setReportIdx(int reportIdx) {
		this.reportIdx = reportIdx;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
