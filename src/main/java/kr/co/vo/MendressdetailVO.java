package kr.co.vo;

public class MendressdetailVO {
	
	/*
	pk mendressDetailsNum
fk gdsnum
catecode
상품구성 prod_comp
제조사  manufacturer
소재 mater
맞춤/대여 c_r_wh
대여기간 rent_per
제작기간 prod_per
		*/
	
		 private int mendressDetailsNum;
		 private int gdsNum;
		 private String cateCode;
		 private String prod_comp;
		 private String manufacturer;
		 private String mater;
		 private String c_r_wh;
		 private String rent_per;
		 private String prod_per;
		
		public int getMendressDetailsNum() {
			return mendressDetailsNum;
		}
		public void setMendressDetailsNum(int mendressDetailsNum) {
			this.mendressDetailsNum = mendressDetailsNum;
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
		public String getProd_comp() {
			return prod_comp;
		}
		public void setProd_comp(String prod_comp) {
			this.prod_comp = prod_comp;
		}
		public String getManufacturer() {
			return manufacturer;
		}
		public void setManufacturer(String manufacturer) {
			this.manufacturer = manufacturer;
		}
		public String getMater() {
			return mater;
		}
		public void setMater(String mater) {
			this.mater = mater;
		}
		public String getC_r_wh() {
			return c_r_wh;
		}
		public void setC_r_wh(String c_r_wh) {
			this.c_r_wh = c_r_wh;
		}
		public String getRent_per() {
			return rent_per;
		}
		public void setRent_per(String rent_per) {
			this.rent_per = rent_per;
		}
		public String getProd_per() {
			return prod_per;
		}
		public void setProd_per(String prod_per) {
			this.prod_per = prod_per;
		}
		
		
		@Override
		public String toString() {
			return "MendressdetailVO [mendressDetailsNum=" + mendressDetailsNum + ", gdsNum=" + gdsNum + ", cateCode="
					+ cateCode + ", prod_comp=" + prod_comp + ", manufacturer=" + manufacturer + ", mater=" + mater
					+ ", c_r_wh=" + c_r_wh + ", rent_per=" + rent_per + ", prod_per=" + prod_per + "]";
		}
}
