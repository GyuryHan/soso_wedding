package kr.co.vo;

public class InvitationdetailVO {
	/*
pk invitationDetailsNum
fk gdsnum
catecode
상품구성 prod_comp
제작기간 prod_per
규격 standard
모바일청첩장 m_invit
컨셉 i_concept
		*/
	
		 private int invitationDetailsNum;
		 private int gdsNum;
		 private String cateCode;
		 private String prod_comp;
		 private String prod_per;
		 private String standard;
		 private String m_invit;
		 private String i_concept;
		public int getInvitationDetailsNum() {
			return invitationDetailsNum;
		}
		public void setInvitationDetailsNum(int invitationDetailsNum) {
			this.invitationDetailsNum = invitationDetailsNum;
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
		public String getProd_per() {
			return prod_per;
		}
		public void setProd_per(String prod_per) {
			this.prod_per = prod_per;
		}
		public String getStandard() {
			return standard;
		}
		public void setStandard(String standard) {
			this.standard = standard;
		}
		public String getM_invit() {
			return m_invit;
		}
		public void setM_invit(String m_invit) {
			this.m_invit = m_invit;
		}
		public String getI_concept() {
			return i_concept;
		}
		public void setI_concept(String i_concept) {
			this.i_concept = i_concept;
		}
		
		@Override
		public String toString() {
			return "InvitationdetailVO [invitationDetailsNum=" + invitationDetailsNum + ", gdsNum=" + gdsNum
					+ ", cateCode=" + cateCode + ", prod_comp=" + prod_comp + ", prod_per=" + prod_per + ", standard="
					+ standard + ", m_invit=" + m_invit + ", i_concept=" + i_concept + "]";
		}
		 
		 
}
