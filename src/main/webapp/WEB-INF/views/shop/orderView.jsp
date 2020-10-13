<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
   href="/resources/css/user/order/mypage2.css" type="text/css">
<link rel="stylesheet" href="/resources/css/main/header-footer.css"
   type="text/css">
<link rel="stylesheet" type="text/css"
   href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<script type="text/javascript"
   src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
   src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<script>
   function button_event() {
      if (true) {
    	  location.href="/shop/orderDeleteViews";
         delForm.submit();
        
      } else {
         return;
      }
   }
</script>

</head>

<body>
   <div class="container-fluid">
      <%@ include file="../include/header2.jsp"%>
   </div>
   <!--container-fluid-->


   <div class="container">
      <div class="row all_wrap">
         <div class="col-sm-3 col-lg-3">
            <div class="side_wrap">
               <h2>마이페이지</h2>
               <ul class="nav nav-pills nav-stacked">
                  <li role="presentation"><a href="/shop/cartList">장바구니</a></li>
                  <li role="presentation" class="active"><a
                     href="/shop/orderList">주문리스트</a></li>
                  <li role="presentation"><a href="/member/memberPassChkView">내
                        정보 수정</a></li>
                  <li role="presentation"><a href="/member/memberPassChkView">회원
                        탈퇴</a></li>
               </ul>
            </div>
         </div>


         <form action="/shop/orderDelete" method="post" id="delForm"
            name="removefrm">

            <div class="col-sm-9 rightWrap">
               <div class="row">
                  <div class="col-sm-12">
                     <h3>주문상세정보</h3>
                     <c:forEach items="${orderView}" var="orderView"
                        varStatus="status">
                        <c:if test="${status.first}">
                           <div class="topBox">
                              <div class="orderDate">
                                 <h4>주문일자</h4>
                                 <p>
                                    <span><fmt:formatDate value="${orderView.orderDate}"
                                          pattern="yyyy-MM-dd" /></span>
                                 </p>
                              </div>
                              <div class="orderNum">
                                 <h4>주문번호</h4>
                                 <p>${orderView.orderId}</p>
                              </div>
                           </div>
                        </c:if>

                     </c:forEach>

                     <div class="content_wrap">
                        <div class="orderTable">
                           <h4 class="odTitle">주문상품</h4>
                           <table>

                              <thead>
                                 <tr>
                                    <th class="productDescription">상품정보</th>
                                    <th class="productPrice">상품금액(수량)</th>
                                    <th class="compayInfo">판매자</th>
                                    <th class="thPay"></th>
                                    <th class="thPay"></th>
                                 </tr>
                              </thead>


                              <tbody>
                                 <c:forEach items="${orderView}" var="orderView"
                                    varStatus="status">
                                    <tr>
                                       <td class="productDescription">
                                          <div>
                                             <span class="productThumb"><img
                                                src="${orderView.gdsThumbImg}"></span>
                                             <div class="names">


                                                <p class="kategorie">
                                                   [${orderdetail[status.index].cateName}]</span><span
                                                      class="companyName">${orderView.gdsName}
                                                </p>

                                                <p class="option">
                                                   옵션 <span>그랜드볼룸홀</span>
                                                </p>
                                             </div>
                                          </div>
                                       </td>

                                       <td class="productPrice">
                                          <div>${orderView.gdsPrice}</div>
                                          <div id="gray">(${orderView.cartStock}개)</div>
                                       </td>

                                       <td class="compayInfo">
                                          <div>${orderdetail[status.index].comName}</div>
                                          <div id="gray">02)666-5658</div>
                                       </td>

                                       <td class="payComplete">
                                          <div>결제완료</div>
                                       </td>

                                       <td class="payCancel">
                                          <div>
                                             <input type="button" class="btn btn-success btn-cancel"
                                                data-toggle="modal" value="주문취소" />
                                          </div>
                                       </td>
                                    </tr>
                                 </c:forEach>
                              </tbody>
                           </table>
                        </div>
                     </div>
                     <!--content_wrap-->



                     <h4 class="odTitle">결제정보</h4>
                     <div class="orderInfo">
                        <c:forEach items="${orderView}" var="orderView"
                           varStatus="status">
                           <c:if test="${status.first}">
                              <ul class="list-unstyled">
                                 <li>결제방법<span>카카오페이</span></li>

                                 <li>결제일자<span><fmt:formatDate
                                          value="${orderView.orderDate}" pattern="yyyy-MM-dd" /></span></li>


                              </ul>
                              <!--orderInfo-->
                              <div class="orderInfoRight pull-right">

                                 <p>
                                    결제금액 : <span><fmt:formatNumber pattern="###,###,###"
                                          value="${orderView.amount}" /> 원</span>
                                 </p>
                              </div>
                           </c:if>
                        </c:forEach>
                     </div>


                     <h4 class="odTitle">배송지정보</h4>

                     <c:forEach items="${orderView}" var="orderView"
                        varStatus="status">
                        <c:if test="${status.first}">
                           <div class="deliveryInfo">
                              <div>
                                 <h5>수령인</h5>
                                 <p>${orderView.orderRec}</p>
                              </div>
                              <div>
                                 <h5>연락처</h5>
                                 <p>${orderView.orderPhon}</p>
                              </div>
                              <div>
                                 <h5>배송지</h5>
                                 <p>${orderView.userAddr1}${orderView.userAddr2}
                                    ${orderView.userAddr3}</p>
                              </div>
                              <div>
                                 <h5>배송메모</h5>
                                 <p>${orderView.orderDes}</p>
                              </div>
                           </div>
                        </c:if>
                     </c:forEach>


                  </div>
                  <!--col-sm-12-->
               </div>
               <!--row-->
            </div>
            <!--col-sm-9-->


         </form>
      </div>
      <!--row -->
   </div>
   <!--container-->

   <!-- modal -->
   <div class="modal fade" id="myModal_cancel" tabindex="-1" role="dialog"
      aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-sm">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
               <!-- <h4 class="modal-title" id="myModalLabel"></h4> -->
            </div>
            <div class="modal-body">주문 취소하시겠습니까?</div>
            <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
               <button type="button" class="btn btn-primary btnOk" onclick="button_event();">확인</button>
               				
            </div>
         </div>
      </div>
   </div>

   <div class="footer">
      <%@ include file="../include/footer2.jsp"%>
   </div>

   <script>
    // 사이드바
    $(document).ready(function(){
      $(".side_wrap li").click(function(){
        var menu= $(".side_wrap li");
        menu.removeClass("active");
        $(this).addClass("active");
      });
    })

    // 모달
    $(document).ready(function(){
     $(".btn-cancel").click(function(){
      $("#myModal_cancel").modal({
        backdrop:"static",
        keyboard:false
      });
     })
    })
 </script>

</body>

</html>