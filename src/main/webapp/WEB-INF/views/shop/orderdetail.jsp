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
  <title>cart_4-3-2</title>

  <!-- 합쳐지고 최소화된 최신 CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="/resources/css/user/cart/cart_4-3.css" type="text/css">
  <link rel="stylesheet" href="/resources/css/main/header-footer.css" type="text/css">
  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">

</head>

<body>
  <div class="container-fluid">
    <%@ include file="../include/header2.jsp"%>
  </div>  <!--container-fluid-->

  <div class="container">
    <div class="row topInfo">
      <div class="col-sm-6">
        <h3>주문/결제</h3>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb">
          <li>장바구니</li>
          <li>주문/결제</li>
          <li class="active">주문완료</li>
        </ol>
      </div>
    </div>

    <div class="row orderContent">
      <div class="col-sm-7 orderLeft">
        <div class="orderTop">
          <h2><span id="pink">결제 완료</span>되었습니다.</h2>
        </div>
       
        <c:forEach items="${orderref}" var="orderref" varStatus="status">
          <c:if test="${status.first}">
        <div class="orderBody">
          <div class="info_wrap">
            <h5>주문번호</h5>
            <p id="orderNum">${orderref.orderId}</p>
          </div>
          <div class="info_wrap">
            <h5>배송지정보</h5>
            <ul>
              <li>${orderref.orderRec}</li>
              <li>${orderref.orderPhon}</li>
              <li>${orderref.userAddr1} ${orderref.userAddr2} ${orderref.userAddr3}</li>
            </ul>
          </div>
          <div class="info_wrap">
            <h5>결제정보</h5>
            <ul>
              <li>카카오페이</li>
              <li>결제금액 : <span><fmt:formatNumber pattern="###,###,###" value="${orderref.amount}" /> 원</span></li>
            </ul>
          </div>
        </div>
        </c:if>
   </c:forEach>
      </div> <!--col-sm-7-->

      <div class="col-sm-5">
        <div class="orderRight">
        <c:set var="sum" value="0" />
        <c:set var="end" value="0" />
          <div class="order_wrap">
         <c:forEach items="${orderdetail}" var="orderdetail" varStatus="status">
         
          <div class="billBody">
         
            <img src="${orderdetail.gdsThumbImg}" class="img-circle">
            <div class="billBodyContent">
              <a href="store_3-1.html">
                <h5>${orderdetail.gdsName}_${orderdetail.comArea}</h5>
              </a>
              <a href="store_3-1.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>
                <p id="storeName">${orderdetail.comName}</p>
              </a>
              <h5>
              <fmt:formatNumber pattern="###,###,###" value="${orderdetail.gdsPrice}" /><span>원</span>
              </h5>
            </div>
            </div>
 
           <c:set var="sum"
                  value="${sum + (orderdetail.gdsPrice)}" />
         <c:set var="end"
                  value="${end + status.step}" />
                  
          </c:forEach>
                   </div>
          <div class="billBottom">
            <p id="billPrice1">결제금액</p>
            <h3 id="billPrice2"><fmt:formatNumber
                  pattern="###,###,###" value="${sum}" /><span id="billPrice3">원</span></h3>
          </div>
      </div>
      </div> <!-- /col-sm-5 -->

      <div class="row">
        <div class="col-sm-7">
          <div class="bottomBtn">
            <a href="/shop/orderList"><button type="button" class="btn btn-primary btn-lg btnOrder">구매내역보기</button></a>
            <a href="/shop/list?c=100&l=1"><button type="button" class="btn btn-primary btn-lg btnOrder">쇼핑계속하기</button></a>
          </div>
        </div> 
      </div> <!-- /row -->
    </div> <!-- /row orderContent -->
  </div> <!--container-->

  <!-- footer -->
  <div class="footer">
    <%@ include file="../include/footer2.jsp"%>
  </div> <!--footer-->


  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>

</html>