package com.udong.board.news.model.vo;

import java.sql.Date;

public class NewsReply {
	private int replyNo; // REPLY_NO NUMBER
	private int refBno; // REF_BNO NUMBER
	private String replyWriter; // REPLY_WRITER VARCHAR2(40 BYTE)
	private String replyContent; // REPLY_CONTENT VARCHAR2(1000 BYTE)
	private Date createDate; // CREATE_DATE DATE
	private Date modifyDate; // MODIFY_DATE DATE
	private String status; // STATUS VARCHAR2(1 BYTE)

	public NewsReply() {
		super();
	}
	
	

	public NewsReply(int replyNo, int refBno, String replyWriter, Date createDate, String replyContent ) {
		super();
		this.replyNo = replyNo;
		this.refBno = refBno;
		this.replyWriter = replyWriter;
		this.createDate = createDate;
		this.replyContent = replyContent;
	}



	public NewsReply(int replyNo, int refBno, String replyWriter, String replyContent, Date createDate, Date modifyDate,
			String status) {
		super();
		this.replyNo = replyNo;
		this.refBno = refBno;
		this.replyWriter = replyWriter;
		this.replyContent = replyContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getRefBno() {
		return refBno;
	}

	public void setRefBno(int refBno) {
		this.refBno = refBno;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "NewsReply [replyNo=" + replyNo + ", refBno=" + refBno + ", replyWriter=" + replyWriter
				+ ", replyContent=" + replyContent + ", createDate=" + createDate + ", modifyDate=" + modifyDate
				+ ", status=" + status + "]";
	}

}
