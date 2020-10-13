package kr.co.vo;

import java.util.Date;

public class GoodsViewVO {

   private int gdsNum;
   private String gdsName;
   private String cateCode;
   private int gdsPrice;
   private int gdsStock;
   private String gdsDes;
   private String gdsImg;
   private String gdsImg2;
   private Date gdsDate;

   private String cateCodeRef;
   private String cateName;

   private String gdsThumbImg;

   private String comName;
   private String comSubway;
   private String comArea;
   private String oaddress;
   private String address;

   private String detailaddress;
   private String tnf;

   public int getGdsNum() {
      return gdsNum;
   }

   public void setGdsNum(int gdsNum) {
      this.gdsNum = gdsNum;
   }

   public String getGdsName() {
      return gdsName;
   }

   public void setGdsName(String gdsName) {
      this.gdsName = gdsName;
   }

   public String getCateCode() {
      return cateCode;
   }

   public void setCateCode(String cateCode) {
      this.cateCode = cateCode;
   }

   public int getGdsPrice() {
      return gdsPrice;
   }

   public void setGdsPrice(int gdsPrice) {
      this.gdsPrice = gdsPrice;
   }

   public int getGdsStock() {
      return gdsStock;
   }

   public void setGdsStock(int gdsStock) {
      this.gdsStock = gdsStock;
   }

   public String getGdsDes() {
      return gdsDes;
   }

   public void setGdsDes(String gdsDes) {
      this.gdsDes = gdsDes;
   }

   public String getGdsImg() {
      return gdsImg;
   }

   public void setGdsImg(String gdsImg) {
      this.gdsImg = gdsImg;
   }

   public String getGdsImg2() {
      return gdsImg2;
   }

   public void setGdsImg2(String gdsImg2) {
      this.gdsImg2 = gdsImg2;
   }

   public Date getGdsDate() {
      return gdsDate;
   }

   public void setGdsDate(Date gdsDate) {
      this.gdsDate = gdsDate;
   }

   public String getCateCodeRef() {
      return cateCodeRef;
   }

   public void setCateCodeRef(String cateCodeRef) {
      this.cateCodeRef = cateCodeRef;
   }

   public String getCateName() {
      return cateName;
   }

   public void setCateName(String cateName) {
      this.cateName = cateName;
   }

   public String getGdsThumbImg() {
      return gdsThumbImg;
   }

   public void setGdsThumbImg(String gdsThumbImg) {
      this.gdsThumbImg = gdsThumbImg;
   }

   public String getComName() {
      return comName;
   }

   public void setComName(String comName) {
      this.comName = comName;
   }

   public String getComSubway() {
      return comSubway;
   }

   public void setComSubway(String comSubway) {
      this.comSubway = comSubway;
   }

   public String getComArea() {
      return comArea;
   }

   public void setComArea(String comArea) {
      this.comArea = comArea;
   }

   public String getOaddress() {
      return oaddress;
   }

   public void setOaddress(String oaddress) {
      this.oaddress = oaddress;
   }

   public String getAddress() {
      return address;
   }

   public void setAddress(String address) {
      this.address = address;
   }

   public String getDetailaddress() {
      return detailaddress;
   }

   public void setDetailaddress(String detailaddress) {
      this.detailaddress = detailaddress;
   }

   public String getTnf() {
      return tnf;
   }

   public void setTnf(String tnf) {
      this.tnf = tnf;
   }

   @Override
   public String toString() {
      return "GoodsViewVO [gdsNum=" + gdsNum + ", gdsName=" + gdsName + ", cateCode=" + cateCode + ", gdsPrice="
            + gdsPrice + ", gdsStock=" + gdsStock + ", gdsDes=" + gdsDes + ", gdsImg=" + gdsImg + ", gdsImg2="
            + gdsImg2 + ", gdsDate=" + gdsDate + ", cateCodeRef=" + cateCodeRef + ", cateName=" + cateName
            + ", gdsThumbImg=" + gdsThumbImg + ", comName=" + comName + ", comSubway=" + comSubway + ", comArea="
            + comArea + ", oaddress=" + oaddress + ", address=" + address + ", detailaddress=" + detailaddress
            + ", tnf=" + tnf + "]";
   }

}