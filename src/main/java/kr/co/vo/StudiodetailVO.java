package kr.co.vo;

public class StudiodetailVO {
	/*
pk weddingdetail
fk gdsnum
catecode
룸 갯수 rnum
인원  seat
카메라대여 (가능여부) cam_rent_wh
렌즈대여(가능여부)  lens_rent_wh
반려동물동반(가능여부) pet_comp_wh
야간촬영(가능여부) night_shot_wh
	*/
	 private int studioDetailsNum;
	 private int gdsNum;
	 private String cateCode;
	 private String r_num;
	 private String seat;
	private String cam_rent_wh;
	private String lens_rent_wh;
	 private String pet_comp_wh;
	 private String night_comp_wh;
	 
	 public int getStudioDetailsNum() {
		return studioDetailsNum;
	}
	public void setStudioDetailsNum(int studioDetailsNum) {
		this.studioDetailsNum = studioDetailsNum;
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
	public String getR_num() {
		return r_num;
	}
	public void setR_num(String r_num) {
		this.r_num = r_num;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public String getCam_rent_wh() {
		return cam_rent_wh;
	}
	public void setCam_rent_wh(String cam_rent_wh) {
		this.cam_rent_wh = cam_rent_wh;
	}
	public String getLens_rent_wh() {
		return lens_rent_wh;
	}
	public void setLens_rent_wh(String lens_rent_wh) {
		this.lens_rent_wh = lens_rent_wh;
	}
	public String getPet_comp_wh() {
		return pet_comp_wh;
	}
	public void setPet_comp_wh(String pet_comp_wh) {
		this.pet_comp_wh = pet_comp_wh;
	}
	public String getNight_comp_wh() {
		return night_comp_wh;
	}
	public void setNight_comp_wh(String night_comp_wh) {
		this.night_comp_wh = night_comp_wh;
	}
	
	@Override
	public String toString() {
		return "StudiodetailVO [studioDetailsNum=" + studioDetailsNum + ", gdsNum=" + gdsNum + ", cateCode=" + cateCode
				+ ", r_num=" + r_num + ", seat=" + seat + ", cam_rent_wh=" + cam_rent_wh + ", lens_rent_wh="
				+ lens_rent_wh + ", pet_comp_wh=" + pet_comp_wh + ", night_comp_wh=" + night_comp_wh + "]";
	}
	
}
