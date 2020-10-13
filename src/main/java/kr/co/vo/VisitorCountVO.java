package kr.co.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;


public class VisitorCountVO {

	private int count;
	private String ip;
	@JsonFormat(pattern = "yyyy-MM-dd",shape = JsonFormat.Shape.STRING)
	private Date ipdate;
	
	@Override
	public String toString() {
		return "VisitorCountVO [count=" + count + ", ip=" + ip + ", ipdate=" + ipdate + "]";
	}
	
	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Date getIpdate() {
		return ipdate;
	}
	public void setIpdate(Date ipdate) {
		this.ipdate = ipdate;
	}
	
	
}
