package kr.co.service;
import java.util.List;

import kr.co.vo.BouquetdetailVO;
import kr.co.vo.CategoryVO;
import kr.co.vo.DressdetailVO;
import kr.co.vo.GoodsVO;
import kr.co.vo.GoodsViewVO;
import kr.co.vo.HairMakeupdetailVO;
import kr.co.vo.HanbokdetailVO;
import kr.co.vo.InvitationdetailVO;
import kr.co.vo.MendressdetailVO;
import kr.co.vo.OrderListVO;
import kr.co.vo.OrderVO;
import kr.co.vo.SnapshotDvddetailVO;
import kr.co.vo.StudiodetailVO;
import kr.co.vo.WeddinghalldetailVO;

public interface AdminService {

	// 카테고리 
	public List<CategoryVO> category() throws Exception;
	
	// 상품등록
	public void register2(GoodsVO vo) throws Exception;
	
	
	// 웨딩홀상세내용
	public void weddingdetail(WeddinghalldetailVO weddingvo) throws Exception;
	//드레스 상세내용
	public void dressdetail(DressdetailVO dressvo) throws Exception;
	//헤어메이크업 상세내용
	public void handmdetail(HairMakeupdetailVO handmvo) throws Exception;
	//스튜디오 상세내용
	public void studiodetail(StudiodetailVO studiovo) throws Exception;
	//스냅사진/DVD 상세내용
	public void snapDvdDetail(SnapshotDvddetailVO snapshotdvdvo) throws Exception;
	//예복 상세내용
	public void mendressdetail(MendressdetailVO mendressvo) throws Exception;
	//한복 상세내용
	public void hanbokdetail(HanbokdetailVO hanbokvo) throws Exception;
	//부케 상세내용
	public void boquetdetail(BouquetdetailVO bouquetvo) throws Exception;
	//청첩장 상세내용
	public void invitdetail(InvitationdetailVO invitvo) throws Exception;
	

	// 상품목록
	public List<GoodsViewVO> goodslist() throws Exception;

	// 상품조회  + 카테고리 조인
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	
	// 웨딩홀조인
	public WeddinghalldetailVO weddingView(int gdsNum) throws Exception;

	// 드레스조인
	public DressdetailVO dressView(int gdsNum) throws Exception;
	//헤어메이크업조인
	public HairMakeupdetailVO hairmakeupView(int gdsNum) throws Exception;
	//스튜디오조인
	public StudiodetailVO studioView(int gdsNum) throws Exception;
	//스냅샷디비디조인
	public SnapshotDvddetailVO snapshotdvdView(int gdsNum) throws Exception;
	//예복조인
	public MendressdetailVO mendressView(int gdsNum) throws Exception;
	//한복조인
	public HanbokdetailVO hanbokView(int gdsNum) throws Exception;
	//부케조인
	public BouquetdetailVO bouquetView(int gdsNum) throws Exception;
	//청첩장조인
	public InvitationdetailVO invitView(int gdsNum) throws Exception;
	
	// 상품 수정
	public void goodsModify(GoodsVO vo) throws Exception;
	// 웨딩 수정
	public void weddingmodify(WeddinghalldetailVO weddingvo) throws Exception;
	//드레스 수정
	public void dressmodify(DressdetailVO dressvo) throws Exception;
	//헤어메이크업 수정
	public void handmmodify(HairMakeupdetailVO handmvo) throws Exception;
	//스튜디오 수정
	public void studiomodify(StudiodetailVO studiovo) throws Exception;
	//스냅샷 수정
	public void snapshotmodify(SnapshotDvddetailVO snapshotdvdvo) throws Exception;
	//예복 수정
	public void mendressmodify(MendressdetailVO mendressvo) throws Exception;
	//한복 수정
	public void hanbokmodify(HanbokdetailVO hanbokvo) throws Exception;
	//부케 수정
	public void bouquetmodify(BouquetdetailVO bouquetvo) throws Exception; 
	//청첩장 수정
	public void invitmodify(InvitationdetailVO invitvo) throws Exception;
	
	// 상품 삭제
	public void goodsDelete(int gdsNum) throws Exception;
	// 웨딩상세내용 삭제
	public void weddingDelete(int gdsNum) throws Exception;
	// 드레스상세내용 삭제
	public void dressDelete(int gdsNum) throws Exception;
	// 헤어메이크업상세내용 삭제
	public void hairmakeupDelete(int gdsNum) throws Exception;
	// 스튜디오상세내용 삭제
	public void studioDelete(int gdsNum) throws Exception;
	// 스냅샷/DVD상세내용 삭제
	public void snapshotdvdDelete(int gdsNum) throws Exception;
	// 예복상세내용 삭제
	public void mendressDelete(int gdsNum) throws Exception;
	// 한복상세내용 삭제
	public void hanbokDelete(int gdsNum) throws Exception;
	// 부케 상세내용 삭제
	public void bouquetDelete(int gdsNum) throws Exception;
	// 청첩장상세내용 삭제
	public void invitDelete(int gdsNum) throws Exception;
	
	// 주문 목록
	public List<OrderVO> orderList() throws Exception;
	
	// 특정 주문 목록
	public List<OrderListVO> orderView(OrderVO order) throws Exception;

	// 배송 상태
//	public void delivery(OrderVO order) throws Exception;
	
	// 상품 수량 조절
	public void changeStock(GoodsVO goods) throws Exception;
/*
	// 모든 소감(댓글)
	public List<ReplyListVO> allReply() throws Exception;
	*/
	// 소감(댓글) 삭제
	public void deleteReply(int repNum) throws Exception;

	

	

	

	
	

	

	

	
} 