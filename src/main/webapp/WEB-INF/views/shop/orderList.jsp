<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
  <title>mypage</title>

  <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
   href="/resources/css/user/order/mypage.css" type="text/css">
<link rel="stylesheet" href="/resources/css/main/header-footer.css"
   type="text/css">
<link rel="stylesheet" type="text/css"
   href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<script type="text/javascript"
   src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
   src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>

<body>
<div class="container-fluid">
    <%@ include file="../include/header2.jsp"%>
  </div>  <!--container-fluid-->


     <div class="container">
      <div class="row all_wrap">
        <div class="col-sm-3">
          <div class="side_wrap">
            <h2>마이페이지</h2>
            <ul class="nav nav-pills nav-stacked">
              <li role="presentation"><a href="/shop/cartList">장바구니</a></li>
              <li role="presentation" class="active"><a href="/shop/orderList">주문리스트</a></li>
              <li role="presentation"><a href="/shop/orderDeleteViews">주문취소내역</a></li>
              <li role="presentation"><a href="/member/memberPassChkView">내정보수정</a></li>
              <li role="presentation"><a href="/member/memberPassChkView">회원탈퇴</a></li>
            </ul>
          </div>
        </div>




  <div class="col-sm-9">
      <div class="rightWrap">
      <c:forEach items="${orderList}" var="orderList">
         <div class="content_wrap"> 
              
                
               <a href="/shop/orderView?n=${orderList.orderId}">
                <div class="orderNum">
                  <h4>주문번호</h4><p> ${orderList.orderId} </p>
                 </div>
              <div class="orderName">
               <h4>수령인</h4><p>${orderList.orderRec} </p>
              </div>
              <div class="orderAdress">
                <h4>주소</h4><p>(${orderList.userAddr1}) ${orderList.userAddr2} ${orderList.userAddr3}</p>
              </div>
              <div class="orderPrice">
                <h4>가격</h4><p><fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" />원</p>
              </div>
              </a>
        
              
              </div>  <!-- content_wrap -->
         </c:forEach>
         </div>
   </div>
  </div>
  </div>
  
     <!-- footer -->
   <div class="footer">
      <%@ include file="../include/footer2.jsp"%>
   </div>
   <!--footer-->

<script>

// 사이드바
$(document).ready(function(){
  $(".side_wrap li").click(function(){
    var menu= $(".side_wrap li");
    menu.removeClass("active");
    $(this).addClass("active");
  });
})

</script>

</body>

</html>