package kr.co.service;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


import kr.co.dao.CompanyDAO;
import kr.co.vo.BouquetdetailVO;
import kr.co.vo.CategoryVO;
import kr.co.vo.DressdetailVO;
import kr.co.vo.GoodsVO;
import kr.co.vo.GoodsViewVO;
import kr.co.vo.HairMakeupdetailVO;
import kr.co.vo.HanbokdetailVO;
import kr.co.vo.InvitationdetailVO;
import kr.co.vo.MemberVO;
import kr.co.vo.MendressdetailVO;
import kr.co.vo.OrderListVO;
import kr.co.vo.OrderVO;
import kr.co.vo.SnapshotDvddetailVO;
import kr.co.vo.StudiodetailVO;
import kr.co.vo.WeddinghalldetailVO;
 
@Service
public class CompanyServiceImpl implements CompanyService {

	@Inject
	private CompanyDAO dao;

	// 카테고리
	@Override
	public List<CategoryVO> category() throws Exception {
		return dao.category();
	}

	// 상품등록
	@Override
	public void register2(GoodsVO vo) throws Exception {
		dao.register2(vo);
	 
		
	}

	// 상품목록
	@Override
	public List<GoodsViewVO> goodslist() throws Exception {
		return dao.goodslist();
	}

	// 상품조회  + 카테고리 조인
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return dao.goodsView(gdsNum);
	}
	
	//웨딩홀상세내용조회
	@Override
	public WeddinghalldetailVO weddingView(int gdsNum) throws Exception {
		return dao.weddingView(gdsNum);
	}
	
	//드레스상세내용조회
	@Override
	public DressdetailVO dressView(int gdsNum) throws Exception{
		// TODO Auto-generated method stub
		return dao.dressView(gdsNum);
	}
	
	//헤어메이크업상세내용조회
	@Override
	public HairMakeupdetailVO hairmakeupView(int gdsNum) throws Exception{
		// TODO Auto-generated method stub
		return dao.hairmakeupView(gdsNum);
	}
	
	//스튜디오상세내용조회
	@Override
	public StudiodetailVO studioView(int gdsNum) throws Exception{
		// TODO Auto-generated method stub
		return dao.studioView(gdsNum);
	}
	
	//스냅샷/DVD/상세내용조회
	@Override
	public SnapshotDvddetailVO snapshotdvdView(int gdsNum) throws Exception{
		// TODO Auto-generated method stub
		return dao.snapshotdvdView(gdsNum);
	}
	
	//예복/상세내용조회
	@Override
	public MendressdetailVO mendressView(int gdsNum) throws Exception{
		// TODO Auto-generated method stub
		return dao.mendressView(gdsNum);
	}
	
	//한복상세내용조회
	@Override
	public HanbokdetailVO hanbokView(int gdsNum) throws Exception{
		// TODO Auto-generated method stub
		return dao.hanbokView(gdsNum);
	}
	
	//부케상세내용조회
	@Override
	public BouquetdetailVO bouquetView(int gdsNum) throws Exception{
		// TODO Auto-generated method stub
		return dao.bouquetView(gdsNum);
	}
	
	//청첩장상세내용조회
	@Override
	public InvitationdetailVO invitView(int gdsNum) throws Exception{
		// TODO Auto-generated method stub
		return dao.invitView(gdsNum);
	}

	// 상품 수정
	@Override
	public void goodsModify(GoodsVO vo) throws Exception {
		dao.goodsModify(vo);
	}
	
	// 웨딩 수정
	@Override
	public void weddingmodify(WeddinghalldetailVO weddingvo) throws Exception{
		dao.weddingmodify(weddingvo);
		
	}
	
	// 드레스 수정
	@Override
	public void dressmodify(DressdetailVO dressvo) throws Exception{
		dao.dressmodify(dressvo);
		
	}
	
	// 헤어&메이크업 수정
	@Override
	public void handmmodify(HairMakeupdetailVO handmvo) throws Exception{
		dao.handmmodify(handmvo);
		
	}
	
	//스튜디오 수정
	@Override
	public void studiomodify(StudiodetailVO studiovo) throws Exception{
		dao.studiomodify(studiovo);
		
	}
	
	//스냅샷 수정
	@Override
	public void snapshotmodify(SnapshotDvddetailVO snapshotdvdvo) throws Exception{
		dao.snapshotmodify(snapshotdvdvo);
		
	}
	
	//예복 수정
	@Override
	public void mendressmodify(MendressdetailVO mendressvo) throws Exception{
		dao.mendressmodify(mendressvo);
		
	}
	
	//한복 수정
	@Override
	public void hanbokmodify(HanbokdetailVO hanbokvo) throws Exception{
		dao.hanbokmodify(hanbokvo);
		
	}
	
	//부케 수정
	@Override
	public void bouquetmodify(BouquetdetailVO bouquetvo) throws Exception{
		dao.bouquetmodify(bouquetvo);
		
	}
	
	//청첩장 수정
	@Override
	public void invitmodify(InvitationdetailVO invitvo) throws Exception{
		dao.invitmodify(invitvo);
		
	}
	
	// 상품 삭제
	@Override
	public void goodsDelete(int gdsNum) throws Exception {
		dao.goodsDelete(gdsNum);
	}
	
	//웨딩홀 상세내용 삭제
	@Override
	public void weddingDelete(int gdsNum) throws Exception {
		// TODO Auto-generated method stub
		dao.weddingDelete(gdsNum);
	}
	
	//드레스 상세내용 삭제
	@Override
	public void dressDelete(int gdsNum) throws Exception {
		// TODO Auto-generated method stub
		dao.dressDelete(gdsNum);
	}
	
	//헤어메이크업 상세내용 삭제
	@Override
	public void hairmakeupDelete(int gdsNum) throws Exception {
		// TODO Auto-generated method stub
		dao.hairmakeupDelete(gdsNum);
	}
	
	//스튜디오 상세내용 삭제
	@Override
	public void studioDelete(int gdsNum) throws Exception {
		// TODO Auto-generated method stub
		dao.studioDelete(gdsNum);
	}
	
	//스냅샷/DVD 상세내용 삭제
	@Override
	public void snapshotdvdDelete(int gdsNum) throws Exception {
		// TODO Auto-generated method stub
		dao.snapshotdvdDelete(gdsNum);
	}
	
	//예복 상세내용 삭제
	@Override
	public void mendressDelete(int gdsNum) throws Exception {
		// TODO Auto-generated method stub
		dao.mendressDelete(gdsNum);
	}
	
	//한복 상세내용 삭제
	@Override
	public void hanbokDelete(int gdsNum) throws Exception {
		// TODO Auto-generated method stub
		dao.hanbokDelete(gdsNum);
	}
	
	
	//부케 상세내용 삭제
	@Override
	public void bouquetDelete(int gdsNum) throws Exception {
		// TODO Auto-generated method stub
		dao.bouquetDelete(gdsNum);
	}
	
	//청첩장 상세내용 삭제
	@Override
	public void invitDelete(int gdsNum) throws Exception {
		// TODO Auto-generated method stub
		dao.invitDelete(gdsNum);
	}
	
	// 주문 목록
	@Override
		public List<OrderVO> orderList() throws Exception {
		return dao.orderList();
		}
		
	// 주문 목록
	@Override
	public List<OrderVO> orderList2(MemberVO member) throws Exception {
		return dao.orderList2(member);
	}
	

	// 특정 주문
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return dao.orderView(order);
	}

	// 배송 상태
//	@Override
//	public void delivery(OrderVO order) throws Exception {
//		dao.delivery(order);
//	}

	// 상품 수량 조절
	@Override
	public void changeStock(GoodsVO goods) throws Exception {		
		dao.changeStock(goods);
	}
/*
	// 모든 소감(댓글)
	@Override
	public List<ReplyListVO> allReply() throws Exception {
		return dao.allReply();
	}
*/
	// 소감(댓글) 삭제
	@Override
	public void deleteReply(int repNum) throws Exception {
		dao.deleteReply(repNum);
	}
	//웨딩홀상세내용 등록
	@Override
	public void weddingdetail(WeddinghalldetailVO weddingvo) throws Exception {
		dao.weddingdetail(weddingvo);
	
	}
	
	//드레스 상세내용
	@Override
	public void dressdetail(DressdetailVO dressvo) throws Exception {
		dao.dressdetail(dressvo);
		
	}
	
	//헤어메이크업 상세내용
	@Override
	public void handmdetail(HairMakeupdetailVO handmvo) throws Exception {
		dao.handmdetail(handmvo);
		
	}
	
	//스튜디오 상세내용
	@Override
	public void studiodetail(StudiodetailVO studiovo) throws Exception {
		dao.studiodetail(studiovo);
		
	}
	
	//스냅샷/dvd 상세내용
	@Override
	public void snapDvdDetail(SnapshotDvddetailVO snapshotdvdvo) throws Exception {
		dao.snapDvdDetail(snapshotdvdvo);
		
	}
	
	//예복 상세내용
	@Override
	public void mendressdetail(MendressdetailVO mendressvo) throws Exception {
		dao.mendressdetail(mendressvo);
		
	}
	
	//한복 상세내용
	@Override
	public void hanbokdetail(HanbokdetailVO hanbokvo) throws Exception {
		dao.hanbokdetail(hanbokvo);
		
	}
	
	//부케 상세내용
	@Override
	public void boquetdetail(BouquetdetailVO bouquetvo) throws Exception {
		dao.boquetdetail(bouquetvo);
		
	}
	
	//청첩장 상세내용
	@Override
	public void invitdetail(InvitationdetailVO invitvo) throws Exception {
		dao.invitdetail(invitvo);
		
	}

	

	

	

	
	
	
}