package kr.co.dao;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

@Repository
public class CompanyDAOImpl implements CompanyDAO {

   @Inject
   private SqlSession sql;
   
   // 매퍼 
   private static String namespace = "companyMapper";

   // 카테고리
   @Override
   public List<CategoryVO> category() throws Exception {
      return sql.selectList("companyMapper.category");
   }

   // 상품등록
   @Override
   public void register2(GoodsVO vo) throws Exception {
	   sql.insert(namespace + ".register2", vo);
	
   }
   
   // 웨딩홀상세내용등록
   @Override
   public void weddingdetail(WeddinghalldetailVO weddingvo) throws Exception{
	   sql.insert(namespace + ".weddingdetail", weddingvo);
   	
   }
   
 //드레스 상세내용
   @Override
   public void dressdetail(DressdetailVO dressvo) throws Exception{
	   sql.insert(namespace + ".dressdetail", dressvo);
   	
   }
   
 //헤어메이크업 상세내용
   @Override
   public void handmdetail(HairMakeupdetailVO handmvo) throws Exception {
	   sql.insert(namespace + ".handmdetail", handmvo);
   	
   }

 //스튜디오 상세내용
   @Override
   public void studiodetail(StudiodetailVO studiovo) throws Exception {
	   sql.insert(namespace + ".studiodetail", studiovo);
   	
   }

   //스냅샷/dvd 상세내용
   @Override
   public void snapDvdDetail(SnapshotDvddetailVO snapshotdvdvo) throws Exception {
	   sql.insert(namespace + ".snapDvdDetail", snapshotdvdvo);
   	
   }
   
 //예복 상세내용
   @Override
   public void mendressdetail(MendressdetailVO mendressvo) throws Exception {
	   sql.insert(namespace + ".mendressdetail", mendressvo);
   	
   }

 //한복 상세내용
   @Override
   public void hanbokdetail(HanbokdetailVO hanbokvo) throws Exception {
	   sql.insert(namespace + ".hanbokdetail", hanbokvo);
   	
   }

   //부케 상세내용
   @Override
   public void boquetdetail(BouquetdetailVO bouquetvo) throws Exception {
	   sql.insert(namespace + ".boquetdetail", bouquetvo);
   	
   }
   
 //청첩장 상세내용
   @Override
   public void invitdetail(InvitationdetailVO invitvo) throws Exception {
	   sql.insert(namespace + ".invitdetail", invitvo);
   	
   }

   // 상품목록
   @Override
   public List<GoodsViewVO> goodslist() throws Exception {
      return sql.selectList(namespace + ".goodslist");
   }

   // 상품조회 + 카테고리 조인
   @Override
   public GoodsViewVO goodsView(int gdsNum) throws Exception {
      return sql.selectOne(namespace + ".goodsView", gdsNum);
   }
   
   //웨딩홀상세내용조회
   @Override
   public WeddinghalldetailVO weddingView(int gdsNum) throws Exception {
	   return sql.selectOne(namespace + ".weddingView", gdsNum);
   }
   
   //드레스상세내용조회
   @Override
   public DressdetailVO dressView(int gdsNum) throws Exception {
	   return sql.selectOne(namespace + ".dressView", gdsNum);
   }
   
 //헤어메이크업상세내용조회
   @Override
   public HairMakeupdetailVO hairmakeupView(int gdsNum) throws Exception {
	   return sql.selectOne(namespace + ".hairmakeupView", gdsNum);
   }

   //스튜디오상세내용조회
   @Override
   public StudiodetailVO studioView(int gdsNum) throws Exception {
	   return sql.selectOne(namespace + ".studioView", gdsNum);
   }
   
   //스냅샷/DVD상세내용조회
   @Override
   public SnapshotDvddetailVO snapshotdvdView(int gdsNum) throws Exception {
	   return sql.selectOne(namespace + ".snapshotdvdView", gdsNum);
   }
   
 //예복상세내용조회
   @Override
   public MendressdetailVO mendressView(int gdsNum) throws Exception {
	   return sql.selectOne(namespace + ".mendressView", gdsNum);
   }
   
 //한복상세내용조회
   @Override
   public HanbokdetailVO hanbokView(int gdsNum) throws Exception {
	   return sql.selectOne(namespace + ".hanbokView", gdsNum);
   }
   
 //부케상세내용조회
   @Override
   public BouquetdetailVO bouquetView(int gdsNum) throws Exception {
	   return sql.selectOne(namespace + ".bouquetView", gdsNum);
   }
   
   //청첩장상세내용조회
   @Override
   public InvitationdetailVO invitView(int gdsNum) throws Exception {
	   return sql.selectOne(namespace + ".invitView", gdsNum);
   }

   // 상품 수정
   @Override
   public void goodsModify(GoodsVO vo) throws Exception {
      sql.update(namespace + ".goodsModify", vo);
   }
   // 웨딩 수정
   @Override
   public void weddingmodify(WeddinghalldetailVO weddingvo) throws Exception {
	   sql.update(namespace + ".weddingmodify", weddingvo);
   	
   }
   
// 드레스 수정
   @Override
   public void dressmodify(DressdetailVO dressvo) throws Exception {
	   sql.update(namespace + ".dressmodify", dressvo);
   	
   }
   
// 헤어앤드메이크업 수정
   @Override
   public void handmmodify(HairMakeupdetailVO handmvo) throws Exception {
	   sql.update(namespace + ".handmmodify", handmvo);
   	
   }
// 스튜디오 수정
   @Override
   public void studiomodify(StudiodetailVO studiovo) throws Exception {
	   sql.update(namespace + ".studiomodify", studiovo);
   	
   }

//스냅샷 수정
   @Override
   public void snapshotmodify(SnapshotDvddetailVO snapshotdvdvo) throws Exception {
	   sql.update(namespace + ".snapshotmodify", snapshotdvdvo);
   	
   }

   //예복 수정
   @Override
   public void mendressmodify(MendressdetailVO mendressvo) throws Exception {
	   sql.update(namespace + ".mendressmodify", mendressvo);
   	
   }
   
   //한복 수정
   @Override
   public void hanbokmodify(HanbokdetailVO hanbokvo) throws Exception {
	   sql.update(namespace + ".hanbokmodify", hanbokvo);
   	
   }

   //부케수정
   @Override
   public void bouquetmodify(BouquetdetailVO bouquetvo) throws Exception {
	   sql.update(namespace + ".bouquetmodify", bouquetvo);
   	
   }

 //청첩장 수정
   @Override
   public void invitmodify(InvitationdetailVO invitvo) throws Exception {
	   sql.update(namespace + ".invitmodify", invitvo);
   	
   }
  

   // 상품 삭제
   @Override
   public void goodsDelete(int gdsNum) throws Exception {
      sql.delete(namespace + ".goodsDelete", gdsNum);
   }
   
// 웨딩상세내용 삭제
   @Override
   public void weddingDelete(int gdsNum) throws Exception {
	   sql.delete(namespace + ".weddingDelete", gdsNum);
   	
   }
// 드레스 상세내용 삭제
   @Override
   public void dressDelete(int gdsNum) throws Exception {
	   sql.delete(namespace + ".dressDelete", gdsNum);
   	
   }
// 헤어메이크업 상세내용 삭제
   @Override
   public void hairmakeupDelete(int gdsNum) throws Exception {
	   sql.delete(namespace + ".hairmakeupDelete", gdsNum);
   	
   }
// 스튜디오 상세내용 삭제
   @Override
   public void studioDelete(int gdsNum) throws Exception {
	   sql.delete(namespace + ".studioDelete", gdsNum);
   	
   }
// 스냅샷/DVD 상세내용 삭제
   @Override
   public void snapshotdvdDelete(int gdsNum) throws Exception {
	   sql.delete(namespace + ".snapshotdvdDelete", gdsNum);
   	
   }
// 예복상세내용  삭제
   @Override
   public void mendressDelete(int gdsNum) throws Exception {
	   sql.delete(namespace + ".mendressDelete", gdsNum);
   	
   }
// 한복상세내용 삭제
   @Override
   public void hanbokDelete(int gdsNum) throws Exception {
	   sql.delete(namespace + ".hanbokDelete", gdsNum);
   	
   }
// 부케 상세내용 삭제
   @Override
   public void bouquetDelete(int gdsNum) throws Exception {
	   sql.delete(namespace + ".bouquetDelete", gdsNum);
   	
   }
// 청첩장 상세내용 삭제
   @Override
   public void invitDelete(int gdsNum) throws Exception {
	   sql.delete(namespace + ".invitDelete", gdsNum);
   	
   }
   // 주문 목록
   @Override
   public List<OrderVO> orderList() throws Exception {
      return sql.selectList(namespace + ".orderList");
   }
   
   // 주문 목록
   @Override
   public List<OrderVO> orderList2(MemberVO member) throws Exception {
      return sql.selectList(namespace + ".orderList2", member);
   }

   // 특정 주문 목록 
   @Override
   public List<OrderListVO> orderView(OrderVO order) throws Exception {
      return sql.selectList(namespace + ".orderView", order);
   }

   // 배송 상태
   @Override
   public void delivery(OrderVO order) throws Exception {
      sql.update(namespace + ".delivery", order);
   }
   
   // 상품 수량 조절
   @Override
   public void changeStock(GoodsVO goods) throws Exception {      
      sql.update(namespace + ".changeStock", goods);
   }
/*
   // 모든 소감(댓글)
   @Override
   public List<ReplyListVO> allReply() throws Exception {
      return sql.selectList(namespace + ".allReply");
   }
*/
   // 소감(댓글) 삭제
   @Override
   public void deleteReply(int repNum) throws Exception {
      sql.delete(namespace + ".deleteReply", repNum);
   }












} 