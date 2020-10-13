<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>store_3-1</title>
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/user/shop/store_3.css"
   type="text/css">
<link rel="stylesheet" href="/resources/css/main/header-footer.css">
<link rel="stylesheet" type="text/css"
   href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<link
   href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
   rel="stylesheet">

<style>
.cartStock span {
   display: inline-block;
   width: 100px;
   margin-right: 15px;
   font-size: 18px;
}

p.cartStock {
   margin-bottom: 0;
}

p.cartStock input {
   font-size: 16px;
   width: 50px;
   padding: 5px;
   margin: 0;
   border: 1px solid #eee;
   padding-left: 17px;
}

p.cartStock button {
   font-size: 21px;
   border: none;
   background: none;
}

p.addToCart {
   text-align: right;
}

p.addToCart button {
   font-size: 22px;
   padding: 5px 10px;
   border: 1px solid #eee;
   background: #eee;
}

div.gdsDes {
   font-size: 18px;
   clear: both;
   padding-top: 30px;
}

.addCart_btn {
   background: #fff;
   border: none;
   outline: none;
}

.hi {
   padding-top: 20px;
}
</style>
</head>


<body>

      <!-- header -->
      <div class="header">
         <%@ include file="../include/header2.jsp"%>
      </div>
      <!--header-->

   <div class="container">
      <!-- 상단 상품정보 -->
      <div class="product">
         <h3>${view.comName }</h3>
         <h4>${view.address },${view.detailaddress }</h4>
         <div class="row">
            <form role="form" method="post">
               <input type="hidden" name="gdsNum" id="gdsNum"
                  value="${view.gdsNum}" />
            </form>
            <div class="col-sm-6">
               <img src="${view.gdsImg}">
            </div>
            <div class="col-sm-6 productRight">
               <c:if test="${view.cateCode == 101 }">
                  <h2 id="productName">${view.gdsName}</h2>
                  <h3 id="productPrice">
                     <fmt:formatNumber pattern="###,###,###" value="${view.gdsPrice}" />
                     원
                  </h3>

                  <table class="table">
                     <tr>
                        <th>홀타입</th>
                        <td>${weddingvo.h_type}</td>
                     </tr>
                     <tr>
                        <th>홀 수</th>
                        <td>${weddingvo.oddnum}</td>
                     </tr>
                     <tr>
                        <th>좌석수(인원)</th>
                        <td>${weddingvo.seat}</td>
                     </tr>
                     <tr>
                        <th>예식타입</th>
                        <td>${weddingvo.w_type}</td>
                     </tr>
                     <tr>
                        <th>식사메뉴</th>
                        <td>${weddingvo.m_menu}</td>
                     </tr>
                     <tr>
                        <th>식사비용</th>
                        <td>${weddingvo.m_cost}</td>
                     </tr>
                     <tr>
                        <th>인근지하철역</th>
                        <td>${view.comSubway}</td>
                     </tr>
                  </table>
               </c:if>
               <c:if test="${view.cateCode == 102 }">
                  <h2 id="productName">${view.gdsName}</h2>
                  <h3 id="productPrice">
                     <fmt:formatNumber pattern="###,###,###" value="${view.gdsPrice}" />
                     원
                  </h3>
                  <table class="table">
                     <tr>
                        <th>드레스타입</th>
                        <td>${dressvo.d_type}</td>
                     </tr>
                     <tr>
                        <th>소재</th>
                        <td>${dressvo.mater}</td>
                     </tr>
                     <tr>
                        <th>사이즈</th>
                        <td>${dressvo.d_size}</td>
                     </tr>
                     <tr>
                        <th>드레스컨셉</th>
                        <td>${dressvo.d_concept}</td>
                     </tr>
                     <tr>
                        <th>웨딩슈즈</th>
                        <td>${dressvo.w_shoewh}</td>
                     </tr>
                     <tr>
                        <th>A/S</th>
                        <td>${dressvo.as_wh}</td>
                     </tr>
                     <tr>
                        <th>인근지하철역</th>
                        <td>${view.comSubway}</td>
                     </tr>
                  </table>
               </c:if>
               <c:if test="${view.cateCode == 103 }">
                  <h2 id="productName">${view.gdsName}</h2>
                  <h3 id="productPrice">
                     <fmt:formatNumber pattern="###,###,###" value="${view.gdsPrice}" />
                     원
                  </h3>
                  <table class="table">
                     <tr>
                        <th>헤어담당</th>
                        <td>${hairmakeupvo.hair_ch}</td>
                     </tr>
                     <tr>
                        <th>메이크업담당</th>
                        <td>${hairmakeupvo.makeup_ch}</td>
                     </tr>
                     <tr>
                        <th>네일아트</th>
                        <td>${hairmakeupvo.nailart_wh}</td>
                     </tr>
                     <tr>
                        <th>방식</th>
                        <td>${hairmakeupvo.formula}</td>
                     </tr>
                     <tr>
                        <th>인근지하철역</th>
                        <td>${view.comSubway}</td>
                     </tr>
                     <tr >
                     <th style="text-align:center;">-</th>
                     <td > - </td>
                     </tr>
                       <tr>
                     <th style="text-align:center;">-</th>
                     <td > - </td>
                     </tr>

                  </table>
               </c:if>
               <c:if test="${view.cateCode == 104 }">
                  <h2 id="productName">${view.gdsName}</h2>
                  <h3 id="productPrice">
                     <fmt:formatNumber pattern="###,###,###" value="${view.gdsPrice}" />
                     원
                  </h3>
                  <table class="table">
                     <tr>
                        <th>룸 갯수</th>
                        <td>${studiovo.r_num}</td>
                     </tr>
                     <tr>
                        <th>인원</th>
                        <td>${studiovo.seat}</td>
                     </tr>
                     <tr>
                        <th>카메라대여</th>
                        <td>${studiovo.cam_rent_wh}</td>
                     </tr>
                     <tr>
                        <th>렌즈대여</th>
                        <td>${studiovo.lens_rent_wh}</td>
                     </tr>
                     <tr>
                        <th>반려동물동반</th>
                        <td>${studiovo.pet_comp_wh}</td>
                     </tr>
                     <tr>
                        <th>야간촬영</th>
                        <td>${studiovo.night_comp_wh}</td>
                     </tr>
                     <tr>
                        <th>인근지하철역</th>
                        <td>${view.comSubway}</td>
                     </tr>
                  </table>
               </c:if>
               <c:if test="${view.cateCode == 105 }">
                  <h2 id="productName">${view.gdsName}</h2>
                  <h3 id="productPrice">
                     <fmt:formatNumber pattern="###,###,###" value="${view.gdsPrice}" />
                     원
                  </h3>
                  <table class="table">
                     <tr>
                        <th>상품구성</th>
                        <td>${snapshotdvdvo.prod_comp}</td>
                     </tr>
                     <tr>
                        <th>촬영스탭</th>
                        <td>${snapshotdvdvo.shooting_step}</td>
                     </tr>
                     <tr>
                        <th>촬영장비</th>
                        <td>${snapshotdvdvo.shooting_eq}</td>
                     </tr>
                     <tr>
                        <th>런닝타임</th>
                        <td>${snapshotdvdvo.runtime}</td>
                     </tr>
                     <tr>
                        <th>제작과정</th>
                        <td>${snapshotdvdvo.prod_proc}</td>
                     </tr>
                     <tr>
                        <th>인근지하철역</th>
                        <td>${view.comSubway}</td>
                     </tr>
                        <tr>
                     <th style="text-align:center;">-</th>
                     <td > - </td>
                     </tr>
                  </table>
               </c:if>
               <c:if test="${view.cateCode == 106 }">
                  <h2 id="productName">${view.gdsName}</h2>
                  <h3 id="productPrice">
                     <fmt:formatNumber pattern="###,###,###" value="${view.gdsPrice}" />
                     원
                  </h3>
                  <table class="table">
                     <tr>
                        <th>상품구성</th>
                        <td>${mendressvo.prod_comp}</td>
                     </tr>
                     <tr>
                        <th>제조사</th>
                        <td>${mendressvo.manufacturer}</td>
                     </tr>
                     <tr>
                        <th>소재</th>
                        <td>${mendressvo.mater}</td>
                     </tr>
                     <tr>
                        <th>맞춤/대여</th>
                        <td>${mendressvo.c_r_wh}</td>
                     </tr>
                     <tr>
                        <th>대여기간</th>
                        <td>${mendressvo.rent_per}</td>
                     </tr>
                     <tr>
                        <th>제작기간</th>
                        <td>${mendressvo.prod_per}</td>
                     </tr>
                     <tr>
                        <th>인근지하철역</th>
                        <td>${view.comSubway}</td>
                     </tr>
                  </table>
               </c:if>
               <c:if test="${view.cateCode == 107 }">
                  <h2 id="productName">${view.gdsName}</h2>
                  <h3 id="productPrice">
                     <fmt:formatNumber pattern="###,###,###" value="${view.gdsPrice}" />
                     원
                  </h3>
                  <table class="table">
                     <tr>
                        <th>상품구성</th>
                        <td>${hanbokgvo.prod_comp}</td>
                     </tr>
                     <tr>
                        <th>대여구매방법</th>
                        <td>${hanbokgvo.rent_purch_method}</td>
                     </tr>
                     <tr>
                        <th>수령반납방법</th>
                        <td>${hanbokgvo.retrun_collect_method}</td>
                     </tr>
                     <tr>
                        <th>피팅비</th>
                        <td>${hanbokgvo.fitting_cost}</td>
                     </tr>
                     <tr>
                        <th>A/S</th>
                        <td>${hanbokgvo.as_wh}</td>
                     </tr>
                     <tr>
                        <th>인근지하철역</th>
                        <td>${view.comSubway}</td>
                     </tr>
                        <tr>
                     <th style="text-align:center;">-</th>
                     <td > - </td>
                     </tr>
                  </table>
               </c:if>
               <c:if test="${view.cateCode == 108 }">
                  <h2 id="productName">${view.gdsName}</h2>
                  <h3 id="productPrice">
                     <fmt:formatNumber pattern="###,###,###" value="${view.gdsPrice}" />
                     원
                  </h3>
                  <table class="table">
                     <tr>
                        <th>상품구성</th>
                        <td>${bouquetgvo.prod_comp}</td>
                     </tr>
                     <tr>
                        <th>규격</th>
                        <td>${bouquetgvo.standard}</td>
                     </tr>
                     <tr>
                        <th>소재</th>
                        <td>${bouquetgvo.mater}</td>
                     </tr>
                     <tr>
                        <th>색상</th>
                        <td>${bouquetgvo.color}</td>
                     </tr>
                     <tr>
                        <th>판매가능시기</th>
                        <td>${bouquetgvo.sale_ava_time}</td>
                     </tr>
                     <tr>
                        <th>인근지하철역</th>
                        <td>${view.comSubway}</td>
                     </tr>
                        <tr>
                     <th style="text-align:center;">-</th>
                     <td > - </td>
                     </tr>
                  </table>
               </c:if>
               <c:if test="${view.cateCode == 109 }">
                  <h2 id="productName">${view.gdsName}</h2>
                  <h3 id="productPrice">
                     <fmt:formatNumber pattern="###,###,###" value="${view.gdsPrice}" />
                     원
                  </h3>
                  <table class="table">
                     <tr>
                        <th>상품구성</th>
                        <td>${invitvo.prod_comp}</td>
                     </tr>
                     <tr>
                        <th>제작기간</th>
                        <td>${invitvo.prod_per}</td>
                     </tr>
                     <tr>
                        <th>규격</th>
                        <td>${invitvo.standard}</td>
                     <tr>
                        <th>모바일청첩장</th>
                        <td>${invitvo.m_invit}</td>
                     </tr>
                     <tr>
                        <th>컨셉</th>
                        <td>${invitvo.i_concept}</td>
                     </tr>
                     <tr>
                        <th>인근지하철역</th>
                        <td>${view.comSubway}</td>
                     </tr>
                        <tr>
                     <th style="text-align:center;">-</th>
                     <td > - </td>
                     </tr>
                  </table>
               </c:if>
               <c:if test="${view.gdsStock != 0}">
                  <p class="cartStock">
                     <span>구입 수량</span>
                     <button type="button" class="plus">+</button>
                     <input type="number" class="numBox" min="1"
                        max="${view.gdsStock}" value="1" readonly="readonly" />
                     <button type="button" class="minus">-</button>
                     <input type="hidden" value="${view.gdsStock}"
                        class="gdsStock_hidden" />
                     <script src="/resources/js/user/shop/stockBtn.js"></script>
                  </p>
               </c:if>

               <c:if test="${view.gdsStock == 0}">
                  <p>상품 수량이 부족합니다.</p>
               </c:if>
               <h4 id="pink">★ ★ ★ ★ ☆</h4>
               <a href="/reviewboard/list">
                  <p id="goReview">평점 121건 전체보기 ▶</p>
               </a>
               <div>
             <!--    <button type="button" class="addCart_btn">
                     <img src="/resources/images/main/cartIcon.png" id="cart">
                  </button>   -->  

                        <button type="button" class="btn btn-lg addCart_btn" id="cart">
                           <b>장바구니</b>
                        </button>
          

                  <c:if test="${member.userId != null}">
                     <a href="/shop/cartList">
                        <button class="btn btn-lg" id="buyBtn">
                           <b>구매하기</b>
                        </button>
                     </a>
                  </c:if>
                  <c:if test="${member.userId == null }">
                     <a href="/member/signin">
                        <button class="btn btn-lg" id="buyBtn">
                           <b>구매하기</b>
                        </button>
                     </a>
                  </c:if>


                  <script>
                     $(".addCart_btn").click(function() {

                        var gdsNum = $("#gdsNum").val();
                        var cartStock = $(".numBox").val();

                        var data = {
                           gdsNum : gdsNum,
                           cartStock : cartStock
                        };

                        $.ajax({
                           url : "/shop/view/addCart",
                           type : "post",
                           data : data,
                           success : function(result) {

                              if (result == 1) {
                                 alert("카트 담기 성공");
                                 $(".numBox").val("1");
                              } else {
                                 alert("회원만 사용할 수 있습니다.")
                                 $(".numBox").val("1");
                              }
                           },
                           error : function() {
                              alert("카트 담기 실패");
                           }
                        });
                     });
                  </script>
               </div>
            </div>
         </div>
      </div>  <!--product-->

   <div class="info_wrap">
      <!-- 상품 정보 -->
      <div class="description">
         <h3>  ㆍ상품정보 </h3>
          <img src = "${view.gdsImg2}"> 
      </div>

      <!-- 업체 정보 -->
      <div class="companyInfo">
         <h3>ㆍ업체정보</h3>
         <div class="row companyBorder">
            <div class="col-sm-6 hi">
               <!-- kakao map -->
               <em class="link"> <a href="javascript:void(0);" class="mapApi"
                  onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum')">
                     <!--                   onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=900, height=600')"> -->
               </a>

                  <div id="map" style="width: 100%; height: 300px;"></div>
                  </em>
            </div>
            <div class="col-sm-6">
               <hr>
               <p> <b>*주차시설</b> </p>
               <p>400여대 동시주차가능 / 2시간무료</p>
               <p>혼주차량 주차가능 / 전일무료</p>
               <hr>
               <p> <b>*전화번호</b> </p>
               <p>031) 400-7777</p>
               <hr>
               <p> <b>*사이트 바로가기</b> </p>
              <p> <a href="http://gdconvention.com">http://gdconvention.com</a> </p>
               <hr>
            </div>
         </div>
      </div>  <!--companyInfo-->

      <!-- 별점으로 보기 -->
      <c:if test="${view.cateCode == 101 }">
         <div class="starWeddinghall">
            <h3>ㆍ별점으로 보는 웨딩홀</h3>
            <div class="iconPackage">
               <div class="iconStar">
                  <img src="/resources/images/store3/car.png" alt="시설">
                  <p>시설</p>
                  <p id="pink2">★4.5</p>
               </div>
               <div class="iconStar">
                  <img src="/resources/images/store3/food.png" alt="교통">
                  <p>교통</p>
                  <p id="pink2">★4.7</p>
               </div>
               <div class="iconStar">
                  <img src="/resources/images/store3/money.png" alt="음식">
                  <p>음식</p>
                  <p id="pink2">★4.5</p>
               </div>
               <div class="iconStar">
                  <img src="/resources/images/store3/park.png" alt="가격">
                  <p>가격</p>
                  <p id="pink2">★2.8</p>
               </div>
               <div class="iconStar">
                  <img src="/resources/images/store3/serviece.png" alt="서비스">
                  <p>서비스</p>
                  <p id="pink2">★4.5</p>
               </div>
            </div>
         </div>
      </c:if>
      <c:if test="${view.cateCode == 102 }">
         <div class="starWeddinghall">
            <h4>ㆍ별점으로 보는 드레스</h4>
            <div class="iconPackage">
               <div class="iconStar">
                  <img src="/resources/images/store3/car.png" alt="시설">
                  <p>시설</p>
                  <p id="pink2">★2.9</p>
               </div>
               <div class="iconStar">
                  <img src="/resources/images/store3/food.png" alt="교통">
                  <p>교통</p>
                  <p id="pink2">★3.7</p>
               </div>
               <div class="iconStar">
                  <img src="/resources/images/store3/park.png" alt="가격">
                  <p>가격</p>
                  <p id="pink2">★2.1</p>
               </div>
               <div class="iconStar">
                  <img src="/resources/images/store3/serviece.png" alt="서비스">
                  <p>서비스</p>
                  <p id="pink2">★4.9</p>
               </div>
            </div>
         </div>
      </c:if>
      <c:if test="${view.cateCode == 103 }">
         <div class="starWeddinghall">
            <h4>ㆍ별점으로 보는 헤어/메이크업</h4>
            <div class="iconPackage">
               <div class="iconStar">
                  <img src="/resources/images/store3/car.png" alt="시설">
                  <p>시설</p>
                  <p id="pink2">★4.8</p>
               </div>
               <div class="iconStar">
                  <img src="/resources/images/store3/food.png" alt="교통">
                  <p>교통</p>
                  <p id="pink2">★4.2</p>
               </div>
               <div class="iconStar">
                  <img src="/resources/images/store3/money.png" alt="음식">
                  <p>음식</p>
                  <p id="pink2">★4.9</p>
               </div>
               <div class="iconStar">
                  <img src="/resources/images/store3/park.png" alt="가격">
                  <p>가격</p>
                  <p id="pink2">★3.1</p>
               </div>
            </div>
         </div>
      </c:if>
      <c:if test="${view.cateCode == 104 }">
         <div class="starWeddinghall">
            <h4>ㆍ별점으로 보는 스튜디오</h4>
            <div class="iconPackage">
               <div class="iconStar">
                  <img src="/resources/images/store3/car.png" alt="시설">
                  <p>시설</p>
                  <p id="pink2">★4.8</p>
               </div>
               <div class="iconStar">
                  <img src="/resources/images/store3/food.png" alt="교통">
                  <p>교통</p>
                  <p id="pink2">★4.3</p>
               </div>
               <div class="iconStar">
                  <img src="/resources/images/store3/money.png" alt="음식">
                  <p>음식</p>
                  <p id="pink2">★4.1</p>
               </div>
               <div class="iconStar">
                  <img src="/resources/images/store3/park.png" alt="가격">
                  <p>가격</p>
                  <p id="pink2">★3.2</p>
               </div>
            </div>
         </div>
      </c:if>
      <c:if test="${view.cateCode == 105 }">
         <div class="starWeddinghall">
            <h4>ㆍ별점으로 보는 스냅사진/DVD</h4>
            <div class="iconPackage">
               <div class="iconStar">
                  <img src="/resources/images/store3/car.png" alt="시설">
                  <p>시설</p>
                  <p id="pink2">★4.1</p>
               </div>
               <div class="iconStar">
                  <img src="/resources/images/store3/food.png" alt="교통">
                  <p>교통</p>
                  <p id="pink2">★4.2</p>
               </div>
               <div class="iconStar">
                  <img src="/resources/images/store3/money.png" alt="음식">
                  <p>음식</p>
                  <p id="pink2">★4.3</p>
               </div>
               <div class="iconStar">
                  <img src="/resources/images/store3/park.png" alt="가격">
                  <p>가격</p>
                  <p id="pink2">★2.4</p>
               </div>
            </div>
         </div>
      </c:if>
      <c:if test="${view.cateCode == 106 }">
         <div class="starWeddinghall">
            <h4>ㆍ별점으로 보는 예복</h4>
            <div class="iconPackage">
               <div class="iconStar">
                  <img src="/resources/images/store3/car.png" alt="시설">
                  <p>시설</p>
                  <p id="pink2">★4.5</p>
               </div>
               <div class="iconStar">
                  <img src="/resources/images/store3/food.png" alt="교통">
                  <p>교통</p>
                  <p id="pink2">★4.7</p>
               </div>
               <div class="iconStar">
                  <img src="/resources/images/store3/money.png" alt="음식">
                  <p>음식</p>
                  <p id="pink2">★4.5</p>
               </div>
               <div class="iconStar">
                  <img src="/resources/images/store3/park.png" alt="가격">
                  <p>가격</p>
                  <p id="pink2">★2.8</p>
               </div>
            </div>
         </div>
      </c:if>
      <c:if test="${view.cateCode == 107 }">
         <div class="starWeddinghall">
            <h4>ㆍ별점으로 보는 한복</h4>
            <div class="iconPackage">
               <div class="iconStar">
                  <img src="/resources/images/store3/car.png" alt="시설">
                  <p>시설</p>
                  <p id="pink2">★4.5</p>
               </div>
               <div class="iconStar">
                  <img src="/resources/images/store3/food.png" alt="교통">
                  <p>교통</p>
                  <p id="pink2">★4.7</p>
               </div>
               <div class="iconStar">
                  <img src="/resources/images/store3/money.png" alt="음식">
                  <p>음식</p>
                  <p id="pink2">★4.5</p>
               </div>
               <div class="iconStar">
                  <img src="/resources/images/store3/park.png" alt="가격">
                  <p>가격</p>
                  <p id="pink2">★2.8</p>
               </div>
            </div>
         </div>
      </c:if>
      <c:if test="${view.cateCode == 108 }">
         <div class="starWeddinghall">
            <h4>ㆍ별점으로 보는 부케</h4>
            <div class="iconPackage">
               <div class="iconStar">
                  <img src="/resources/images/store3/car.png" alt="시설">
                  <p>시설</p>
                  <p id="pink2">★4.5</p>
               </div>
               <div class="iconStar">
                  <img src="/resources/images/store3/food.png" alt="교통">
                  <p>교통</p>
                  <p id="pink2">★4.7</p>
               </div>
               <div class="iconStar">
                  <img src="/resources/images/store3/money.png" alt="음식">
                  <p>음식</p>
                  <p id="pink2">★4.5</p>
               </div>
               <div class="iconStar">
                  <img src="/resources/images/store3/park.png" alt="가격">
                  <p>가격</p>
                  <p id="pink2">★2.8</p>
               </div>
            </div>
         </div>
      </c:if>
      <c:if test="${view.cateCode == 109 }">
         <div class="starWeddinghall">
            <h4>ㆍ별점으로 보는 청첩장</h4>
            <div class="iconPackage">
               <div class="iconStar">
                  <img src="/resources/images/store3/car.png" alt="시설">
                  <p>시설</p>
                  <p id="pink2">★4.5</p>
               </div>
               <div class="iconStar">
                  <img src="/resources/images/store3/food.png" alt="교통">
                  <p>교통</p>
                  <p id="pink2">★4.7</p>
               </div>
               <div class="iconStar">
                  <img src="/resources/images/store3/money.png" alt="음식">
                  <p>음식</p>
                  <p id="pink2">★4.5</p>
               </div>
               <div class="iconStar">
                  <img src="/resources/images/store3/park.png" alt="가격">
                  <p>가격</p>
                  <p id="pink2">★2.8</p>
               </div>
            </div>
         </div>
      </c:if>  <!--starWeddinghall--> 
    </div> <!-- info_wrap -->
 </div>
 
 
      <div class="footer">
         <%@ include file="../include/footer2.jsp"%>
      </div>
  
  

   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js">
      
   </script>
                  <script
                     src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
         <!-- kakaomap  -->
   <script type="text/javascript"
                     src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1de9f82b062ca8bf11ccd23bc515c9f3&libraries=services"></script>
   <script>
            //주소

            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
               center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
               level : 3
            // 지도의 확대 레벨
            };

            // 지도를 생성합니다    
            var map = new kakao.maps.Map(mapContainer, mapOption);
            // 주소-좌표 변환 객체를 생성합니다
            var geocoder = new kakao.maps.services.Geocoder();
            // 주소로 좌표를 검색합니다
            geocoder
                  .addressSearch(
                        '${view.address}',
                        function(result, status) {
                           // 정상적으로 검색이 완료됐으면 
                           if (status === kakao.maps.services.Status.OK) {
                              var coords = new kakao.maps.LatLng(
                                    result[0].y, result[0].x);
                              // 결과값으로 받은 위치를 마커로 표시합니다
                              var marker = new kakao.maps.Marker({
                                 map : map,
                                 position : coords
                              });

                              // 인포윈도우로 장소에 대한 설명을 표시.
                              var infowindow = new kakao.maps.InfoWindow(
                                    {
                                       //업체명 받아오기'
                                       content : '<div style="width:150px;text-align:center;padding:6px 0; font-style:normal;">${view.comName}</div>'
                                    });
                              infowindow.open(map, marker);
                              // 지도의 중심을 결과값으로 받은 위치로 이동.
                              map.setCenter(coords);
                           }
                        });
         </script>


               </body>

</html>