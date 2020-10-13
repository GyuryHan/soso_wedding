<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>main_1-1</title>


<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/main/header-footer.css">
<link rel="stylesheet" href="/resources/css/main/main_1-1.css">
<link rel="stylesheet" type="text/css"
   href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">

</head>

<body>

   <div class="container-fluid">
      <%@ include file="include/header2.jsp"%>
   </div>
   <!-- slide1 -->
   <div class="slide1">
      <div class="row">
         <div class="col-xs-12">
            <div id="carouselSlide1" class="carousel slide" data-ride="carousel">
               <ol class="carousel-indicators">
                  <li data-target="#carouselSlide1" data-slide-to="0" class="active"></li>
                  <li data-target="#carouselSlide1" data-slide-to="1"></li>
               </ol>

               <div class="carousel-inner" role="listbox">
                  <div class="item active">
                     <img src="/resources/images/main/mainslide/mainSlide2.jpg"
                        alt="슬라이드1">
                  </div>
                  <div class="item">
                     <img src="/resources/images/main/mainslide/mainSlide2.jpg"
                        alt="슬라이드2">
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div> <!-- slide1 -->


   <!--카테고리 검색바-->
   <div class="WeddingSearch">
      <form action="/shop/list" method="post">
         <div class="row">
            <div class="container">
               <div id="WeddingSearch">
                  <p>카테고리</p>
                  <select name="cateCode" id="btnSelect1">
                     <option value="101">웨딩홀</option>
                     <option value="102">드레스</option>
                     <option value="103">헤어/메이크업</option>
                     <option value="104">스튜디오</option>
                     <option value="105">스냅/DVD</option>
                     <option value="106">예복</option>
                     <option value="107">한복</option>
                     <option value="108">부케</option>
                     <option value="109">청첩장</option>
                  </select>
               </div>
               <div id="WeddingSearch">
                  <p>지역</p>
                  <select name="comArea" id="btnSelect2">

                     <option value="서울">서울</option>
                     <option value="경기">경기</option>
                     <option value="인천">인천</option>
                     <option value="강원">강원</option>
                     <option value="충청">충청</option>
                     <option value="전라">전라</option>
                     <option value="경상">경상</option>
                     <option value="제주">제주</option>
                  </select>
               </div>
               <div id="WeddingSearch">
                  <p>금액대</p>
                  <select name="gdsPrice" id="btnSelect3">
                     <option value="0">금액무관</option>
                     <option value="1">~100만원</option>
                     <option value="1000000">100~200만원</option>
                     <option value="2000000">200~300만원</option>
                     <option value="3000000">300~500만원</option>
                  </select>
               </div>
               <div id="WeddingSearch">
                  <button type="submit" class="btn btn-lg" id="btnSelect4">
                     검색</button>
               </div>
            </div>
         </div>
      </form>
   </div>

   <div class="container">
      <div class="row">
         <h2 class="title">About SOSO</h2>
         <p class="subtitle">소소웨딩, 무엇이 다를까요</p>
      </div>
      <div class="row titleImg">
         <div class="col-sm-4 titles1">
            <img src="/resources/images/main/document.png">
            <div class="pink_title">한눈에 비교하는 견적</div>
            <div class="gray_title">
               지역별, 가격대별로 웨딩상품 견적을<br> 한눈에 비교해보고 예약하세요
            </div>
         </div>
         <div class="col-sm-4 titles2">
            <img src="/resources/images/main/calculator.png">
            <div class="pink_title">최저가 확인</div>
            <div class="gray_title">
               고객님들이 부담할 수수료가 없습니다.<br> 국내 최저가의 웨딩견적을 확인하세요
            </div>
         </div>
         <div class="col-sm-4 titles3">
            <img src="/resources/images/main/backend.png">
            <div class="pink_title">9개 카테고리</div>
            <div class="gray_title">
               스튜디오, 드레스, 헤어&메이크업 등<br> 9개의 카테고리를 한눈에 확인하세요
            </div>
         </div>
      </div> <!-- /row titleImg -->

      <!-- slide2 -->
      <div class="row hotdeal">
         <div class="col-sm-12">
            <h2 class="title">스드메 핫딜</h2>
            <p class="subtitle">최저가 한눈에 확인!</p>
         </div>
      </div>
      <div class="slide2">
         <div class="row">
            <div class="col-sm-12 btnSlide2">
               <button class="btn" id="btnSlide2-1">
                  <img src="/resources/images/main/icon/hallBtn.png"
                     class="img-circle">
               </button>
               <button class="btn" id="btnSlide2-2">
                  <img src="/resources/images/main/icon/dressBtn.png"
                     class="img-circle">
               </button>
               <button class="btn" id="btnSlide2-3">
                  <img src="/resources/images/main/icon/cosmeticBtn.png"
                     class="img-circle">
               </button>
               <button class="btn" id="btnSlide2-4">
                  <span class="glyphicon glyphicon-pause"></span>
               </button>
            </div>
         </div> <!-- /row -->
         <div class="row">
            <div id="carouselSlide2" class="carousel slide" data-ride="carousel">
               <div class="carousel-inner" role="listbox">
                  <ul class="item active col-xs-6 col-sm-3">
                     <li><a href="/shop/view?n=178"><img
                           src="/resources/images/main/hall/hall1.jpg" alt="웨딩홀1"></a>
                        <p>그랜드 오스티엄</p>
                        <h4>가격: 4,000,000 원</h4></li>
                     <li><a href="/shop/view?n=177"><img
                           src="/resources/images/main/hall/hall2.jpg" alt="웨딩홀2"></a>
                        <p>그랜드웨딩의전당</p>
                        <h4>가격: 2,600,000원</h4></li>
                     <li><a href="/shop/view?n=176"><img
                           src="/resources/images/main/hall/hall3.jpg" alt="웨딩홀3"></a>
                        <p>빌라드마리</p>
                        <h4>가격: 3,500,000</h4></li>
                     <li><a href="/shop/view?n=155"><img
                           src="/resources/images/main/hall/hall4.jpg" alt="웨딩홀4"></a>
                        <p>메모리스클래식 신림</p>
                        <h4>가격: 2,000,000원</h4></li>
                  </ul>
                  <ul class="item col-xs-6 col-sm-3">
                     <li><a href="/shop/view?n=193"><img
                           src="/resources/images/main/dress/dress1.jpg" alt="드레스1"></a>
                        <p class="card-text">제시카로렌</p>
                        <h4>가격: 950,000원</h4></li>
                     <li><a href="/shop/view?n=192"><img
                           src="/resources/images/main/dress/dress2.jpg" alt="드레스2"></a>
                        <p>리안마리</p>
                        <h4>가격: 600,000원</h4></li>
                     <li><a href="/shop/view?n=191"><img
                           src="/resources/images/main/dress/dress3.jpg" alt="드레스3"></a>
                        <p>본느마리에</p>
                        <h4>가격: 850,000</h4></li>
                     <li><a href="/shop/view?n=190"><img
                           src="/resources/images/main/dress/dress4.jpg" alt="드레스4"></a>
                        <p>클라우디아</p>
                        <h4>가격: 1,300,000원</h4></li>
                  </ul>
                  <ul class="item col-xs-6 col-sm-3">
                     <li><a href="/shop/view?n=247"><img
                           src="/resources/images/main/hair/hair1.jpg" alt="헤어/메이크업1"></a>
                        <p>웜메이크업</p>
                        <h4>가격: 350,000원</h4></li>
                     <li><a href="/shop/view?n=246"><img
                           src="/resources/images/main/hair/hair2.jpg" alt="헤어/메이크업3"></a>
                        <p>러블리즈메이크업</p>
                        <h4>가격: 300,000원</h4></li>
                     <li><a href="/shop/view?n=245"><img
                           src="/resources/images/main/hair/hair3.jpg" alt="헤어/메이크업2"></a>
                        <p>단정헤어메이크업</p>
                        <h4>가격: 250,000원</h4></li>
                     <li><a href="/shop/view?n=244"><img
                           src="/resources/images/main/hair/hair4.jpg" alt="헤어/메이크업4"></a>
                        <p>롱컬펄프핑크</p>
                        <h4>가격: 440,000원</h4></li>
                  </ul>
               </div>
            </div>
         </div> <!-- /row -->
      </div> <!-- /slide2 -->

      <!-- 6개 썸네일 -->
      <div class="thumb">
         <div class="row">
            <div class="col-xs-4 col-md-2 boxThumb">
               <a href="/shop/list?c=104&l=2"><img
                  src="/resources/images/main/sumnail/studio.png" alt="스튜디오"
                  class="img-responsive img-circle"></a>
               <p>스튜디오</p>
            </div>
            <div class="col-xs-4 col-md-2 boxThumb">
               <a href="/shop/list?c=105&l=2"><img
                  src="/resources/images/main/sumnail/snapdvd.png" alt="스냅/DVD"
                  class="img-responsive img-circle"></a>
               <p>스냅/DVD</p>
            </div>
            <div class="col-xs-4 col-md-2 boxThumb">
               <a href="/shop/list?c=106&l=2"><img
                  src="/resources/images/main/sumnail/dressSuit.png" alt="예복"
                  class="img-responsive img-circle"></a>
               <p>예복</p>
            </div>
            <div class="col-xs-4 col-md-2 boxThumb">
               <a href="/shop/list?c=107&l=2"><img
                  src="/resources/images/main/sumnail/hanbok.png" alt="한복"
                  class="img-responsive img-circle"></a>
               <p>한복</p>
            </div>
            <div class="col-xs-4 col-md-2 boxThumb">
               <a href="/shop/list?c=108&l=2"><img
                  src="resources/images/main/sumnail/bouquet.png" alt="부케"
                  class="img-responsive img-circle"></a>
               <p>부케</p>
            </div>
            <div class="col-xs-4 col-md-2 boxThumb">
               <a href="/shop/list?c=109&l=2"><img
                  src="/resources/images/main/sumnail/invitation.png" alt="청첩장"
                  class="img-responsive img-circle"></a>
               <p>청첩장</p>
            </div>
         </div>
      </div> <!-- /thumb -->

      <div class="eventLink">
         <a href="/board/notices"><img src="/resources/images/main/event.png"></a>
      </div>

      <!-- 예약현황,  후기현황 -->
      <div class="reserveReview">
         <div class="row">
            <div class="col-sm-6">
               <c:if test="${member == null}">
                  <button type="button" class="btn-lg btn-block reserveBtn"
                     data-toggle="button">주문현황</button>
               </c:if>
               <c:if test="${member != null}">
                  <button type="button" class="btn-lg btn-block reserveBtn"
                     data-toggle="button">주문현황</button>
               </c:if>
               <table class="table">
                  <c:forEach var="orderList" items="${orderList}" end="10">
                     <tr>
                        <th><img src="/resources/images/main/reserve.png"></th>
                        <td>${orderList.orderRec}님신청 접수 되었습니다. <span
                           class="label label-danger">new</span></td>
                        <td><fmt:formatDate value="${orderList.orderDate}"
                              pattern="yyyy-MM-dd" /></td>
                     </tr>
                  </c:forEach>
               </table>
            </div> <!-- /col-sm-6 -->
            
            <div class="col-sm-6 ">
               <button type="button" class="btn btn-lg btn-block reviewBtn"
                  data-toggle="button" onclick="location.href='/reviewboard/list'">고객후기</button>
               <table class="table table-hover">
                  <c:forEach var="homelist" items="${homelist}" end="10">
                     <tr>
                        <th><img src="/resources/images/main/review.png"></th>
                        <td>${homelist.writer}님의소중한후기입니다. &nbsp;
                           [${homelist.reply_cnt}]</td>
                        <td><fmt:formatDate value="${homelist.regdate}"
                              pattern="yyyy-MM-dd" /></td>
                     </tr>
                  </c:forEach>
               </table>
            </div> <!-- /col-sm-6 -->
         </div> <!-- /row -->
      </div>
   </div> <!--/container-->


   <div class="footer">
      <%@ include file="include/footer2.jsp"%>
   </div>


   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   <script
      src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
   <script>
    $(function () {
      $("#carouselSlide2").carousel({
        interval: 4000
      })
      $("#btnSlide2-1").click(function () {
        $("#carouselSlide2").carousel(0);
      })
      $("#btnSlide2-2").click(function () {
        $("#carouselSlide2").carousel(1);
      })
      $("#btnSlide2-3").click(function () {
        $("#carouselSlide2").carousel(2);
      })
      $("#btnSlide2-4").click(function () {
        $("#carouselSlide2").carousel("pause");
      })
    })
  </script>
</body>

</html>