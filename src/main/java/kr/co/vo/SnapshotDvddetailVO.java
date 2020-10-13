package kr.co.vo;

public class SnapshotDvddetailVO {
	/*
	pk snapshotDvdDetailsNum
fk gdsnum
catecode
상품구성 prod_comp
촬영스텝 shooting_step
촬영장비 shooting_eq
런닝타임 runtime
제작과정 prod_proc
		*/
		 private int snapshotDvdDetailsNum;
		 private int gdsNum;
		 private String cateCode;
		 private String prod_comp;
		 private String shooting_step;
		
		private String shooting_eq;
		private String runtime;
		private String prod_proc;
		
		 public int getSnapshotDvdDetailsNum() {
			return snapshotDvdDetailsNum;
		}
		public void setSnapshotDvdDetailsNum(int snapshotDvdDetailsNum) {
			this.snapshotDvdDetailsNum = snapshotDvdDetailsNum;
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
		public String getShooting_step() {
			return shooting_step;
		}
		public void setShooting_step(String shooting_step) {
			this.shooting_step = shooting_step;
		}
		public String getShooting_eq() {
			return shooting_eq;
		}
		public void setShooting_eq(String shooting_eq) {
			this.shooting_eq = shooting_eq;
		}
		public String getRuntime() {
			return runtime;
		}
		public void setRuntime(String runtime) {
			this.runtime = runtime;
		}
		public String getProd_proc() {
			return prod_proc;
		}
		public void setProd_proc(String prod_proc) {
			this.prod_proc = prod_proc;
		}
		
		
		@Override
		public String toString() {
			return "SnapshotDvddetailVO [snapshotDvdDetailsNum=" + snapshotDvdDetailsNum + ", gdsNum=" + gdsNum
					+ ", cateCode=" + cateCode + ", prod_comp=" + prod_comp + ", shooting_step=" + shooting_step
					+ ", shooting_eq=" + shooting_eq + ", runtime=" + runtime + ", prod_proc=" + prod_proc + "]";
		}
}
