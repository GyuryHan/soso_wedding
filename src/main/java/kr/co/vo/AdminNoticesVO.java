package kr.co.vo;

import java.sql.Date;

public class AdminNoticesVO {

	private int no;
	private String header;
	private String admin;
	private String title;
	private String contents;
	private Date noticeDate;
	private int hit;
	
	
	
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getHeader() {
		return header;
	}
	public void setHeader(String header) {
		this.header = header;
	}
	
	public Date getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	@Override
	public String toString() {
		return "AdminNoticesVO [no=" + no + ", header=" + header + ", admin=" + admin + ", title=" + title
				+ ", contents=" + contents + ", noticeDate=" + noticeDate + ", hit=" + hit + "]";
	}
	
}
