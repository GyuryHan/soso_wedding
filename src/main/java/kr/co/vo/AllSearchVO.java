package kr.co.vo;

public class AllSearchVO extends AllSearchCriteria{
	private String keyword="";

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "AllSearchVO [keyword=" + keyword + "]";
	}
	
	
}
