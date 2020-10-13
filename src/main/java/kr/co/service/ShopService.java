package kr.co.service;

import java.util.List;

import kr.co.vo.BouquetdetailVO;
import kr.co.vo.CartListVO;
import kr.co.vo.CartVO;
import kr.co.vo.DressdetailVO;
import kr.co.vo.GoodsViewVO;
import kr.co.vo.HairMakeupdetailVO;
import kr.co.vo.HanbokdetailVO;
import kr.co.vo.InvitationdetailVO;
import kr.co.vo.MendressdetailVO;
import kr.co.vo.OrderDetailVO;
import kr.co.vo.OrderListVO;
import kr.co.vo.OrderVO;
import kr.co.vo.SnapshotDvddetailVO;
import kr.co.vo.StudiodetailVO;
import kr.co.vo.WeddinghalldetailVO;

public interface ShopService {

	// 카테고리별 상품 리스트
	public List<GoodsViewVO> list(int cateCode, int level) throws Exception;

	// 상품조회
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	// 웨딩홀 상세조회
	public WeddinghalldetailVO weddingView(int gdsNum) throws Exception;
	// 드레스 상세조회
	public DressdetailVO dressView(int gdsNum) throws Exception;
	// 헤어메이크업 상세조회
	public HairMakeupdetailVO hairmakeupView(int gdsNum) throws Exception;
	// 스튜디오 상세조회
	public StudiodetailVO studioView(int gdsNum) throws Exception;
	// 스냅샷/DVD 상세조회
	public SnapshotDvddetailVO snapshotdvdView(int gdsNum) throws Exception;
	// 예복 상세조회
	public MendressdetailVO mendressView(int gdsNum) throws Exception;
	// 한복 상세조회
	public HanbokdetailVO hanbokView(int gdsNum) throws Exception;
	// 부케 상세조회
	public BouquetdetailVO bouquetView(int gdsNum) throws Exception;
	// 청첩장 상세조회
	public InvitationdetailVO invitView(int gdsNum) throws Exception;

	/*
	 * // 상품 소감(댓글) 작성 public void registReply(ReplyVO reply) throws Exception;
	 */
	/*
	 * // 상품 소감(댓글) 리스트 public List<ReplyListVO> replyList(int gdsNum) throws
	 * Exception;
	 */
	/*
	 * // 상품 소감(댓글) 삭제 public void deleteReply(ReplyVO reply) throws Exception;
	 */
	// 아이디 체크
	public String idCheck(int repNum) throws Exception;

	/*
	 * // 상품 소감(댓글) 수정 public void modifyReply(ReplyVO reply) throws Exception;
	 */
	// 카트 담기
	public void addCart(CartListVO cart) throws Exception;

	// 카트 리스트
	public List<CartListVO> cartList(String userId) throws Exception;
	
	// 주문
	public List<GoodsViewVO> cartList2(String userId) throws Exception;
	
	//주문 옵션	
	public List<WeddinghalldetailVO> cartList3(String userId) throws Exception;	

	// 카트 삭제
	public void deleteCart(CartVO cart) throws Exception;

	// 주문 정보
	public void orderInfo(OrderVO order) throws Exception;

	// 주문 상세 정보
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception;

	// 카트 비우기
	public void cartAllDelete(String userId) throws Exception;

	// 주문 목록
	public List<OrderVO> orderList(OrderVO order) throws Exception;

	// 특정 주문 목록
	public List<OrderListVO> orderView(OrderVO order) throws Exception;

	// 검색별 상품 리스트
	public List<GoodsViewVO> list(GoodsViewVO vo) throws Exception;
	
	//주문완료창
	public List<GoodsViewVO> orderdetail(OrderVO order) throws Exception;

	public void orderDelete(String userId) throws Exception;

	
}