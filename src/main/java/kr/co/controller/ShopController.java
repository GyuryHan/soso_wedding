package kr.co.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.service.ShopService;
import kr.co.vo.BouquetdetailVO;
import kr.co.vo.CartListVO;
import kr.co.vo.CartVO;
import kr.co.vo.DressdetailVO;
import kr.co.vo.GoodsViewVO;
import kr.co.vo.HairMakeupdetailVO;
import kr.co.vo.HanbokdetailVO;
import kr.co.vo.InvitationdetailVO;
import kr.co.vo.MemberVO;
import kr.co.vo.MendressdetailVO;
import kr.co.vo.OrderDetailVO;
import kr.co.vo.OrderListVO;
import kr.co.vo.OrderVO;
import kr.co.vo.SnapshotDvddetailVO;
import kr.co.vo.StudiodetailVO;
import kr.co.vo.WeddinghalldetailVO;

@Controller
@RequestMapping("/shop/*")
public class ShopController {

   private static final Logger logger = LoggerFactory.getLogger(ShopController.class);

   @Inject
   ShopService service;
   
   // 카테고리별 상품 리스트
   @RequestMapping(value = "/list", method = RequestMethod.GET)
   public void getList(@RequestParam("c") int cateCode, @RequestParam("l") int level, Model model) throws Exception {
      logger.info("get llist");

      List<GoodsViewVO> list = null;
      list = service.list(cateCode, level);
      System.out.println(list.toString());

      model.addAttribute("list", list);

   }

   // 상품 조회
   @RequestMapping(value = "/view", method = RequestMethod.GET)
   public void getView(@RequestParam("n") int gdsNum, Model model) throws Exception {
      logger.info("get view");

      GoodsViewVO view = service.goodsView(gdsNum);
      model.addAttribute("view", view);
      
      System.out.println(view.toString());
      String detail = view.getCateCode();
      try {
         switch (detail) {
         case "101":
            WeddinghalldetailVO weddingvo = service.weddingView(gdsNum);
            model.addAttribute("weddingvo", weddingvo);
            break;
         case "102":
            DressdetailVO dressvo = service.dressView(gdsNum);
            model.addAttribute("dressvo", dressvo);
            break;
         case "103":
            HairMakeupdetailVO hairmakeupvo = service.hairmakeupView(gdsNum);
            model.addAttribute("hairmakeupvo", hairmakeupvo);
            break;
         case "104":
            StudiodetailVO studiovo = service.studioView(gdsNum);
            model.addAttribute("studiovo", studiovo);
            break;
         case "105":
            SnapshotDvddetailVO snapshotdvdvo = service.snapshotdvdView(gdsNum);
            model.addAttribute("snapshotdvdvo", snapshotdvdvo);
            break;
         case "106":
            MendressdetailVO mendressvo = service.mendressView(gdsNum);
            model.addAttribute("mendressvo", mendressvo);
            break;
         case "107":
            HanbokdetailVO hanbokgvo = service.hanbokView(gdsNum);
            model.addAttribute("hanbokgvo", hanbokgvo);
            break;
         case "108":
            BouquetdetailVO bouquetgvo = service.bouquetView(gdsNum);
            model.addAttribute("bouquetgvo", bouquetgvo);
            break;
         case "109":
            InvitationdetailVO invitvo = service.invitView(gdsNum);
            model.addAttribute("invitvo", invitvo);
            break;
         default:
            System.out.println("카테고리 101~109번사이가 아닐때 나타나는 오류입니다");
            break;

         }
      } catch (Exception e) {
         e.printStackTrace();
      }

   }

   /*
    * // 상품 조회 - 소감(댓글) 작성
    * 
    * @RequestMapping(value = "/view", method = RequestMethod.POST) public String
    * registReply(ReplyVO reply, HttpSession session) throws Exception {
    * logger.info("regist reply");
    * 
    * MemberVO member = (MemberVO)session.getAttribute("member");
    * reply.setUserId(member.getUserId());
    * 
    * service.registReply(reply);
    * 
    * return "redirect:/shop/view?n=" + reply.getGdsNum(); }
    */
   /*
    * // 상품 소감(댓글) 작성
    * 
    * @ResponseBody
    * 
    * @RequestMapping(value = "/view/registReply", method = RequestMethod.POST)
    * public void registReply(ReplyVO reply, HttpSession session) throws Exception
    * { logger.info("regist reply");
    * 
    * MemberVO member = (MemberVO)session.getAttribute("member");
    * reply.setUserId(member.getUserId());
    * 
    * service.registReply(reply); }
    */
   /*
    * // 상품 소감(댓글) 목록
    * 
    * @ResponseBody
    * 
    * @RequestMapping(value = "/view/replyList", method = RequestMethod.GET) public
    * List<ReplyListVO> getReplyList(@RequestParam("n") int gdsNum) throws
    * Exception { logger.info("get reply list");
    * 
    * List<ReplyListVO> reply = service.replyList(gdsNum);
    * 
    * return reply; }
    */
   /*
    * // 상품 소감(댓글) 삭제
    * 
    * @ResponseBody
    * 
    * @RequestMapping(value = "/view/deleteReply", method = RequestMethod.POST)
    * public int getReplyList(ReplyVO reply, HttpSession session) throws Exception
    * { logger.info("post delete reply");
    * 
    * // 정상작동 여부를 확인하기 위한 변수 int result = 0;
    * 
    * MemberVO member = (MemberVO)session.getAttribute("member"); // 현재 로그인한 member
    * 세션을 가져옴 String userId = service.idCheck(reply.getRepNum()); // 소감(댓글)을 작성한
    * 사용자의 아이디를 가져옴
    * 
    * // 로그인한 아이디와, 소감을 작성한 아이디를 비교 if(member.getUserId().equals(userId)) {
    * 
    * // 로그인한 아이디가 작성한 아이디와 같다면
    * 
    * reply.setUserId(member.getUserId()); // reply에 userId 저장
    * service.deleteReply(reply); // 서비스의 deleteReply 메서드 실행
    * 
    * // 결과값 변경 result = 1; }
    * 
    * // 정상적으로 실행되면 소감 삭제가 진행되고, result값은 1이지만 // 비정상적으로 실행되면 소감 삭제가 안되고, result값이
    * 0 return result; }
    */
   /*
    * // 상품 소감(댓글) 수정
    * 
    * @ResponseBody
    * 
    * @RequestMapping(value = "/view/modifyReply", method = RequestMethod.POST)
    * public int modifyReply(ReplyVO reply, HttpSession session) throws Exception {
    * logger.info("modify reply");
    * 
    * int result = 0;
    * 
    * MemberVO member = (MemberVO)session.getAttribute("member"); String userId =
    * service.idCheck(reply.getRepNum());
    * 
    * if(member.getUserId().equals(userId)) {
    * 
    * reply.setUserId(member.getUserId()); service.modifyReply(reply); result = 1;
    * }
    * 
    * return result;
    * 
    * }
    */
   // 카트 담기
   @ResponseBody
   @RequestMapping(value = "/view/addCart", method = RequestMethod.POST)
   public int addCart(CartListVO cart, HttpSession session) throws Exception {

      int result = 0;

      MemberVO member = (MemberVO) session.getAttribute("member");

      if (member != null) {
         cart.setUserId(member.getUserId());
         service.addCart(cart);
         result = 1;
      }

      return result;
   }

   // 카트 목록
   @RequestMapping(value = "/cartList", method = RequestMethod.GET)
   public void getCartList(HttpSession session, Model model) throws Exception {
      logger.info("get cart list");

      MemberVO member = (MemberVO) session.getAttribute("member");
      String userId = member.getUserId();

      List<CartListVO> cartList = service.cartList(userId);

      model.addAttribute("cartList", cartList);
      System.out.println(cartList.toString());
      
      List<GoodsViewVO> goods= service.cartList2(userId); 
      model.addAttribute("goods", goods);
      System.out.println(goods.toString());
      
      
   
   }
   
   // 카트 목록
      @RequestMapping(value = "/cartList", method = RequestMethod.POST)
      public String postCartList(HttpSession session, Model model) throws Exception {
         logger.info("post cart list");

//         MemberVO member = (MemberVO) session.getAttribute("member");
//         String userId = member.getUserId();
//
//         List<CartListVO> cartList = service.cartList(userId);
//
//         model.addAttribute("cartList", cartList);
         return "/shop/order2";
      }

   // 카트 삭제
   @ResponseBody
   @RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
   public int deleteCart(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, CartVO cart)
         throws Exception {
      logger.info("delete cart");

      MemberVO member = (MemberVO) session.getAttribute("member");
      String userId = member.getUserId();

      int result = 0;
      int cartNum = 0;

      // 로그인 여부 구분
      if (member != null) {
         cart.setUserId(userId);

         for (String i : chArr) { // 에이젝스에서 받은 chArr의 갯수만큼 반복
            cartNum = Integer.parseInt(i); // i번째 데이터를 cartNum에 저장
            cart.setCartNum(cartNum);
            service.deleteCart(cart);
         }
         result = 1;
      }
      return result;
   }
   
   // 주문
      @RequestMapping(value = "/order2", method = RequestMethod.GET)
      public void getorder(HttpSession session, Model model) throws Exception {
         logger.info("get cart list");

         MemberVO member = (MemberVO) session.getAttribute("member");
         String userId = member.getUserId();

         List<CartListVO> cartList = service.cartList(userId);

         model.addAttribute("cartList", cartList);
         System.out.println(cartList.toString());
         
         List<GoodsViewVO> goods= service.cartList2(userId); 
         model.addAttribute("goods", goods);
         System.out.println(goods.toString());
         
         List<WeddinghalldetailVO> goodwed = service.cartList3(userId);
         model.addAttribute("goodwed", goodwed);
         System.out.println(goodwed.toString());
         
      }

   // 주문
   @RequestMapping(value = "/order2", method = RequestMethod.POST)
   public String order(HttpSession session, OrderVO order, OrderDetailVO orderDetail) throws Exception {

      logger.info("order");

      MemberVO member = (MemberVO) session.getAttribute("member");
      String userId = member.getUserId();

      // 캘린더 호출
      Calendar cal = Calendar.getInstance();
      int year = cal.get(Calendar.YEAR); // 연도 추출
      String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1); // 월 추출
      String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE)); // 일 추출
      String subNum = ""; // 랜덤 숫자를 저장할 문자열 변수

      for (int i = 1; i <= 6; i++) { // 6회 반복
         subNum += (int) (Math.random() * 10); // 0~9까지의 숫자를 생성하여 subNum에 저장
      }

      String orderId = ymd + "_" + subNum; // [연월일]_[랜덤숫자] 로 구성된 문자

      order.setOrderId(orderId);
      order.setUserId(userId);

      service.orderInfo(order);

      orderDetail.setOrderId(orderId);
      service.orderInfo_Details(orderDetail);
      System.out.println(orderDetail.toString());

      // 주문 테이블, 주문 상세 테이블에 데이터를 전송하고, 카트 비우기
      service.cartAllDelete(userId);

      return "redirect:/shop/orderdetail";
   }
   
   // 주문 목록
         @RequestMapping(value = "/orderdetail", method = RequestMethod.GET)
         public void getorderdetail(HttpSession session, OrderVO order, Model model, OrderDetailVO orderDetail) throws Exception {
            logger.info("get order orderdetail");

            MemberVO member = (MemberVO) session.getAttribute("member");
            String userId = member.getUserId();

            order.setUserId(userId);
            List<OrderVO> orderList = service.orderList(order);
            model.addAttribute("orderList", orderList);
            String orderId = orderList.get(0).getOrderId();
            order.setOrderId(orderId);
            
            System.out.println(order.toString());
            List<OrderListVO> orderref = service.orderView(order);
            model.addAttribute("orderref", orderref);
            System.out.println(orderref.toString());
            
            List<GoodsViewVO> orderdetail = service.orderdetail(order);
            model.addAttribute("orderdetail", orderdetail);
            System.out.println(orderdetail.toString());
            
            
         }
   
   // 주문 목록
   @RequestMapping(value = "/orderList", method = RequestMethod.GET)
   public void getOrderList(HttpSession session, OrderVO order, Model model) throws Exception {
      logger.info("get order list");

      MemberVO member = (MemberVO) session.getAttribute("member");
      String userId = member.getUserId();

      order.setUserId(userId);
      System.out.println(order.toString());

      List<OrderVO> orderList = service.orderList(order);

      model.addAttribute("orderList", orderList);
      System.out.println(orderList.toString());
   }

   // 주문 상세 목록
      @RequestMapping(value = "/orderView", method = RequestMethod.GET)
      public void getOrderList(HttpSession session, @RequestParam("n") String orderId, OrderVO order, Model model)
            throws Exception {
         logger.info("get order view");

         MemberVO member = (MemberVO) session.getAttribute("member");
         String userId = member.getUserId();

         order.setUserId(userId);
         order.setOrderId(orderId);
         List<OrderListVO> orderView = service.orderView(order);
         model.addAttribute("orderView", orderView);
         System.out.println(orderView.toString());
         
         List<GoodsViewVO> orderdetail = service.orderdetail(order);
         model.addAttribute("orderdetail", orderdetail);
         System.out.println(orderdetail.toString());
      }

   // 메인검색별 상품 리스트
   @RequestMapping(value = "/list", method = RequestMethod.POST)
   public void postList(GoodsViewVO vo, Model model) throws Exception {
      logger.info("post llist");
      List<GoodsViewVO> list = null;
      list = service.list(vo);
      System.out.println(vo.toString());
      model.addAttribute("list", list);

   }
   
      @RequestMapping(value="/orderListView", method = RequestMethod.GET)
      public String orderDelete() throws Exception{
         return "shop/orderList";
      }
      
      @RequestMapping(value="/orderDelete", method = RequestMethod.POST)
      public String orderDelete(OrderVO vo, HttpSession session, String orderId, RedirectAttributes rttr) throws Exception{
         MemberVO member = (MemberVO) session.getAttribute("member");
         String userId = member.getUserId();
         vo.setUserId(userId);
         vo.setOrderId(orderId);
         service.orderDelete(userId);
         
         return "shop/orderList";
      }

      @RequestMapping(value="/orderDeleteViews")
      public void orderDeleteViews() throws Exception{
    	  
      }
}