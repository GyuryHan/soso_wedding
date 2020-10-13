package kr.co.vo;

public class BouquetdetailVO {
	/*
	pk bouquetDetailsNum
fk gdsnum
catecode
상품구성 prod_comp
규격  standard
소재 mater
색상 color
판매가능시기 sale_ava_time
		*/
	
		 private int bouquetDetailsNum;
		 private int gdsNum;
		 private String cateCode;
		 private String prod_comp;
		 private String standard;
		 private String mater;
		 private String color;
		 private String sale_ava_time;
		 
		 public int getBouquetDetailsNum() {
			return bouquetDetailsNum;
		}
		
		public void setBouquetDetailsNum(int bouquetDetailsNum) {
			this.bouquetDetailsNum = bouquetDetailsNum;
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
		public String getStandard() {
			return standard;
		}
		public void setStandard(String standard) {
			this.standard = standard;
		}
		public String getMater() {
			return mater;
		}
		public void setMater(String mater) {
			this.mater = mater;
		}
		public String getColor() {
			return color;
		}
		public void setColor(String color) {
			this.color = color;
		}
		public String getSale_ava_time() {
			return sale_ava_time;
		}
		public void setSale_ava_time(String sale_ava_time) {
			this.sale_ava_time = sale_ava_time;
		}
		
		@Override
		public String toString() {
			return "BouquetdetailVO [bouquetDetailsNum=" + bouquetDetailsNum + ", gdsNum=" + gdsNum + ", cateCode="
					+ cateCode + ", prod_comp=" + prod_comp + ", standard=" + standard + ", mater=" + mater + ", color="
					+ color + ", sale_ava_time=" + sale_ava_time + "]";
		}
		
		 
}
