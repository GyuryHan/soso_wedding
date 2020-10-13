package kr.co.vo;

public class HanbokdetailVO {
	/*
	pk hanbokDetailsNum
fk gdsnum
catecode
상품구성 prod_comp
대여구매방법 rent_purch_method
수령반납방법 retrun_collect_method
피팅비  fitting_cost
A/S as_wh
		*/
	
		 private int hanbokDetailsNum;
		 private int gdsNum;
		 private String cateCode;
		 private String prod_comp;
		 private String rent_purch_method;
		 private String retrun_collect_method;
		 private String fitting_cost;
		 private String as_wh;
		 
		public int getHanbokDetailsNum() {
			return hanbokDetailsNum;
		}
		public void setHanbokDetailsNum(int hanbokDetailsNum) {
			this.hanbokDetailsNum = hanbokDetailsNum;
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
		public String getRent_purch_method() {
			return rent_purch_method;
		}
		public void setRent_purch_method(String rent_purch_method) {
			this.rent_purch_method = rent_purch_method;
		}
		public String getRetrun_collect_method() {
			return retrun_collect_method;
		}
		public void setRetrun_collect_method(String retrun_collect_method) {
			this.retrun_collect_method = retrun_collect_method;
		}
		public String getFitting_cost() {
			return fitting_cost;
		}
		public void setFitting_cost(String fitting_cost) {
			this.fitting_cost = fitting_cost;
		}
		public String getAs_wh() {
			return as_wh;
		}
		public void setAs_wh(String as_wh) {
			this.as_wh = as_wh;
		}
		
		@Override
		public String toString() {
			return "HanbokdetailVO [hanbokDetailsNum=" + hanbokDetailsNum + ", gdsNum=" + gdsNum + ", cateCode="
					+ cateCode + ", prod_comp=" + prod_comp + ", rent_purch_method=" + rent_purch_method
					+ ", retrun_collect_method=" + retrun_collect_method + ", fitting_cost=" + fitting_cost + ", as_wh="
					+ as_wh + "]";
		}
		
		 
		 
}
