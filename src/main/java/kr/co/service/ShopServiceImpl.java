package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.ShopDAO;
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

@Service
public class ShopServiceImpl implements ShopService {

	@Inject
	private ShopDAO dao;

	// 카테고리별 상품 리스트
	@Override
	public List<GoodsViewVO> list(int cateCode, int level) throws Exception {
		int cateCodeRef = 0; // 카테고리 참조 코드. 없어도 무관

		if (level == 1) { // lavel 1 = 1차 분류.
			cateCodeRef = cateCode;
			return dao.list(cateCode, cateCodeRef);
			// 두가지 모두 cateCode로 해도 무관
		} else { // lavel 2 = 2차 분류
			return dao.list(cateCode);
		}
	}

	// 상품 조회
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return dao.goodsView(gdsNum);
	}
	
	// 웨딩홀 상세 조회
	@Override
	public WeddinghalldetailVO weddingView(int gdsNum) throws Exception{
		// TODO Auto-generated method stub
		return dao.weddingView(gdsNum);
	}
	// 드레스 상세 조회
	@Override
	public DressdetailVO dressView(int gdsNum) throws Exception{
		return dao.dressView(gdsNum);
	}
	
	// 헤어메이크업 상세 조회
	@Override
	public HairMakeupdetailVO hairmakeupView(int gdsNum) throws Exception{
		return dao.hairmakeupView(gdsNum);
	}
	
	// 스튜디오 상세 조회
	@Override
	public StudiodetailVO studioView(int gdsNum) throws Exception{
		return dao.studioView(gdsNum);
	}
	
	// 스냅샷 상세 조회
	@Override
	public SnapshotDvddetailVO snapshotdvdView(int gdsNum) throws Exception{
		return dao.snapshotdvdView(gdsNum);
	}
	
	//예복 상세 조회
	@Override
	public MendressdetailVO mendressView(int gdsNum) throws Exception{
		return dao.mendressView(gdsNum);
	}
	
	
	//한복 상세조회
	@Override
	public HanbokdetailVO hanbokView(int gdsNum) throws Exception{
		return dao.hanbokView(gdsNum);
	}
	
	
	//부케 상세조회
	@Override
	public BouquetdetailVO bouquetView(int gdsNum) throws Exception{
		return dao.bouquetView(gdsNum);
	}
	
	//청첩장 상세조회
	@Override
	public InvitationdetailVO invitView(int gdsNum) throws Exception{
		return dao.invitView(gdsNum);
	}

	/*
	 * // 상품 소감(댓글) 작성
	 * 
	 * @Override public void registReply(ReplyVO reply) throws Exception {
	 * dao.registReply(reply); }
	 */
	/*
	 * // 상품 소감(댓글) 리스트
	 * 
	 * @Override public List<ReplyListVO> replyList(int gdsNum) throws Exception {
	 * return dao.replyList(gdsNum); }
	 */
	/*
	 * // 상품 소감(댓글) 삭제
	 * 
	 * @Override public void deleteReply(ReplyVO reply) throws Exception {
	 * dao.deleteReply(reply); }
	 */
	// 아이디 체크
	@Override
	public String idCheck(int repNum) throws Exception {
		return dao.idCheck(repNum);
	}

	/*
	 * // 상품 소감(댓글) 수정
	 * 
	 * @Override public void modifyReply(ReplyVO reply) throws Exception {
	 * dao.modifyReply(reply); }
	 */
	// 카트 담기
	@Override
	public void addCart(CartListVO cart) throws Exception {
		dao.addCart(cart);
	}

	// 카트 리스트
	@Override
	public List<CartListVO> cartList(String userId) throws Exception {
		return dao.cartList(userId);
	}

	// 카트 삭제
	@Override
	public void deleteCart(CartVO cart) throws Exception {
		dao.deleteCart(cart);
	}

	// 주문 정보
	@Override
	public void orderInfo(OrderVO order) throws Exception {
		dao.orderInfo(order);
	}

	// 주문 상세 정보
	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		dao.orderInfo_Details(orderDetail);
	}

	// 카트 비우기
	@Override
	public void cartAllDelete(String userId) throws Exception {
		dao.cartAllDelete(userId);
	}

	// 주문 목록
	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return dao.orderList(order);
	}

	// 특정 주문
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return dao.orderView(order);
	}

	@Override
	public List<GoodsViewVO> list(GoodsViewVO vo) throws Exception {
		return dao.list(vo);
	}
    //주문
	@Override
	public List<GoodsViewVO> cartList2(String userId) throws Exception {
		return dao.cartList2(userId);
	}
	//주문 옵션
	@Override
	public List<WeddinghalldetailVO> cartList3(String userId) throws Exception {
		return dao.cartList3(userId);
	}
	
	//주문완료
	@Override
	public List<GoodsViewVO> orderdetail(OrderVO order) throws Exception {
		// TODO Auto-generated method stub
		return dao.orderdetail(order);
	}

	 //주문삭제
	   @Override
	   public void orderDelete(String userId) throws Exception {
	      dao.orderDelete(userId);
	   }

	
}