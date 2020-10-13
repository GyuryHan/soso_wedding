package kr.co.vo;

public class HairMakeupdetailVO {
	/*
	pk weddingdetail
fk gdsnum
catecode
헤어담당 hair_ch
메이크업담당 makeup_ch
네일아트 nailart_wh
방식 formula
	*/
	 private int hairMakeupDetailsNum;
	 private int gdsNum;
	 private String cateCode;
	 private String hair_ch;
	 private String makeup_ch;
	 private String nailart_wh;
	 private String formula;
	 
	
	public int getHairMakeupDetailsNum() {
		return hairMakeupDetailsNum;
	}
	public void setHairMakeupDetailsNum(int hairMakeupDetailsNum) {
		this.hairMakeupDetailsNum = hairMakeupDetailsNum;
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
	public String getHair_ch() {
		return hair_ch;
	}
	public void setHair_ch(String hair_ch) {
		this.hair_ch = hair_ch;
	}
	public String getMakeup_ch() {
		return makeup_ch;
	}
	public void setMakeup_ch(String makeup_ch) {
		this.makeup_ch = makeup_ch;
	}
	public String getNailart_wh() {
		return nailart_wh;
	}
	public void setNailart_wh(String nailart_wh) {
		this.nailart_wh = nailart_wh;
	}
	public String getFormula() {
		return formula;
	}
	public void setFormula(String formula) {
		this.formula = formula;
	}
	
	@Override
	public String toString() {
		return "HairMakeupdetailVO [hairMakeupDetailsNum=" + hairMakeupDetailsNum + ", gdsNum=" + gdsNum + ", cateCode="
				+ cateCode + ", hair_ch=" + hair_ch + ", makeup_ch=" + makeup_ch + ", nailart_wh=" + nailart_wh
				+ ", formula=" + formula + "]";
	}
}
