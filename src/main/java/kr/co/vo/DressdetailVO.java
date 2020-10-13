package kr.co.vo;

public class DressdetailVO {
	/*
	pk weddingdetail
	fk gdsnum
	catecode
	드레스타입 dtype
	소재 mater
	사이즈 d_size
	드레스컨셉 d_concept
	웨딩슈즈 여부 w_shoewh
	A/S	as_wh
	*/
	 private int dressDetailsNum;
	 private int gdsNum;
	 private String cateCode;
	 private String d_type;
	 private String mater;
	 private String d_size;
	 private String d_concept;
	 private String w_shoewh;
	 private String as_wh;
	 
	 
	public int getDressDetailNum() {
		return dressDetailsNum;
	}
	public void setDressDetailNum(int dressDetailNum) {
		this.dressDetailsNum = dressDetailNum;
	}
	public int getGdsNum() {
		return gdsNum;
	}
	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}
	public String getD_type() {
		return d_type;
	}
	public void setD_type(String d_type) {
		this.d_type = d_type;
	}
	public String getMater() {
		return mater;
	}
	public void setMater(String mater) {
		this.mater = mater;
	}
	public String getD_size() {
		return d_size;
	}
	public void setD_size(String d_size) {
		this.d_size = d_size;
	}
	public String getD_concept() {
		return d_concept;
	}
	public void setD_concept(String d_concept) {
		this.d_concept = d_concept;
	}
	public String getW_shoewh() {
		return w_shoewh;
	}
	public void setW_shoewh(String w_shoewh) {
		this.w_shoewh = w_shoewh;
	}
	public String getAs_wh() {
		return as_wh;
	}
	public void setAs_wh(String as_wh) {
		this.as_wh = as_wh;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	
	 
	 @Override
		public String toString() {
			return "DressdetailVO [dressDetailNum=" + dressDetailsNum + ", gdsNum=" + gdsNum + ", d_type=" + d_type
					+ ", mater=" + mater + ", d_size=" + d_size + ", d_concept=" + d_concept + ", w_shoewh=" + w_shoewh
					+ ", as_wh=" + as_wh + ", cateCode=" + cateCode + "]";
		}
}
