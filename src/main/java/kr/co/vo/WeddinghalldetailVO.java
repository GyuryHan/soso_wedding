package kr.co.vo;


public class WeddinghalldetailVO {
	/*
	pk weddingdetail
	fk gdsnum
	catecode
	홀타입 h_type
	홀수 oddnum
	좌석수(인원) seat
	예식타입 w_type
	식사메뉴 m_menu
	식사비용 m_cost
	*/
	 private int weddingDetailsNum;
	 private int gdsNum;
	 private String cateCode;
	 private String h_type;
	 private String oddnum;
	 private String seat;
	 private String w_type;
	 private String m_menu;
	 private int m_cost;
	 
	 public int getWeddingDetailNum() {
		return weddingDetailsNum;
	}
	public void setWeddingDetailNum(int weddingDetailNum) {
		this.weddingDetailsNum = weddingDetailNum;
	}
	public int getGdsNum() {
		return gdsNum;
	}
	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String getH_type() {
		return h_type;
	}
	public void setH_type(String h_type) {
		this.h_type = h_type;
	}
	public String getOddnum() {
		return oddnum;
	}
	public void setOddnum(String oddnum) {
		this.oddnum = oddnum;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public String getW_type() {
		return w_type;
	}
	public void setW_type(String w_type) {
		this.w_type = w_type;
	}
	public String getM_menu() {
		return m_menu;
	}
	public void setM_menu(String m_menu) {
		this.m_menu = m_menu;
	}
	public int getM_cost() {
		return m_cost;
	}
	public void setM_cost(int m_cost) {
		this.m_cost = m_cost;
	}
	@Override
	public String toString() {
		return "WeddinghalldetailVO [weddingDetailNum=" + weddingDetailsNum + ", gdsNum=" + gdsNum + ", cateCode="
				+ cateCode + ", h_type=" + h_type + ", oddnum=" + oddnum + ", seat=" + seat + ", w_type=" + w_type
				+ ", m_menu=" + m_menu + ", m_cost=" + m_cost + "]";
	}
	
}
