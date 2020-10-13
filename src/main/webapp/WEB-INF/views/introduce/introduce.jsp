<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- 합쳐지고 최소화된 최신 CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  <!-- <link rel="stylesheet" href="./assets/css/board.css"> -->
  <script src="http://code.jquery.com/jquery-1.11.0.js"> </script>
  <link rel="stylesheet" href="./assets/css/header-footer.css">

<!--<link rel="stylesheet" href="./assets/css/main.css">-->
<style>
/* <!--
  body{
    background-image: url('../awesplash-master/assets/images/willyoumarryme.jpg');
  }
--> */

* {
  box-sizing: cover;
}

 h1 {
    text-align: center;
}

 h4{
    text-align: center;
    color: #fff;


 }
p{
  color: rgb(253, 252, 252);
}

body {
  font-family: Arial;
  font-size: 15px;
}

.form {
  position: relative;
  /* max-width: 800px; */
  margin: 0 auto;
  padding:0px;
}

.container img {vertical-align: middle;}

.form .content {
  position: absolute;
  text-align: center;
  top: 50%;
  bottom: 0;
  background: rgb(0, 0, 0); /* Fallback color */
  background: rgba(0, 0, 0, 0.5); /* Black background with 0.5 opacity */
  color: #f1f1f1;
  width: 100%;
  /* padding: 20px; */
}

h2::after{
    position: absolute;
    left: 0;
    width: 100%;
    height: 100%;
    content:"";
 /*background-image:url('../awesplash-master/assets/images/introduce6.jpg'); */
}
.rrr img{
  width: 100%;
}

/* .glow {
  font-size: 60px;
  font-weight: bold;
  color: #fff;
  text-align: center;
  -webkit-animation: glow 1s ease-in-out infinite alternate;
  -moz-animation: glow 1s ease-in-out infinite alternate;
  animation: glow 1s ease-in-out infinite alternate;
  /* padding-top: 100px; */
  /* padding-bottom: 100px; */

/* @-webkit-keyframes glow { */
  /* from {
    text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px #e60073, 0 0 40px #e60073, 0 0 50px #e60073, 0 0 60px #e60073, 0 0 70px #e60073;
  }
  
  to {
    text-shadow: 0 0 20px #fff, 0 0 30px #ff4da6, 0 0 40px #ff4da6, 0 0 50px #ff4da6, 0 0 60px #ff4da6, 0 0 70px #ff4da6, 0 0 80px #ff4da6;
  }
*/ 

</style>
</head>
<body>
  <div class="container">
    <div class="form">
  <!-- header -->
  <div class="header">
    <div class="row">
      <div class="col-xs-6">
        <a href="main_1-1.html"><img src="logo.png" alt="logo"></a>
      </div>
      <div class="col-xs-6">
        <form class="pull-right">
          <button type="button" class="btn loginbtn" data-toggle="button"
            onclick="location.href='login.html'">Login</button>
          <button type="button" class="btn joinbtn" data-toggle="button"
            onclick="location.href='join.html'">Signup</button>
        </form>
      </div>
    </div>
    <div class="row">
      <div class="col-sm-12 marginSm">
        <nav class="navbar navbar-inverse">
          <!-- mobile -->
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
              data-target="#bs-example-navbar-collapse-1">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
          </div>
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
              <li><a href="main_1-1.html"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a></li>
              <li><a href="store_2-1.html">상점</a></li>
              <li><a href="order_5-1.html">견적</a></li>
              <li><a href="review_6-1.html">후기</a></li>
              <li><a href="notice_7-1.html">커뮤니티</a></li>
              <li><a href="introduce_8-1.html">회사소개</a></li>
            </ul>
            <form class="navbar-form navbar-right" role="search">
              <input type="text" class="form-control headerSearch1">
              <button type="submit" class="btn btn-default headerSearch2">검색</button>
              <a class="btn btn-default headerSearch3" href="cart_4-1.html" role="button">
                <span class="glyphicon glyphicon-shopping-cart"></span></a>
            </form>
          </div>
        </nav>
      </div>
    </div>
  </div><!--header-->
 </div>

<!-- <h1 class="glow">SOSO WEDDING</h1> -->

<!-- <div style="position: relative;"> -->

  <div class="row">
    <div class="col-sm-12 rrr">
  <img src="../final_20200605_/assets/images/we.png" alt="회사소개">
</div>
</div>


  <div class="content">
    <div class="row">
    <h4><br>
        예약실에 일일이 문의하지 않고도
        <b>최저가</b>를 알아볼 수 있는 길을 열어드립니다</h4>
 
<p>
대한민국에는 수많은 결혼관련 업체들이 존재합니다<br>
견적을 위해 전화를 하는 경우 업체 측은 방문을 유도하기 때문에 필요한 정보를 얻기가 힘듭니다<br>
시간이 없어서 직접 꼼꼼하게 따지고 알아보지 못하기 때문에 적지않는 돈을 투자하게 됩니다<br>
이런 불편함을 해소하고, 예비부부님들의 편의를 위해, 최적의 결혼 환경을 만들어 드리고자<br>
<br>
<B>2020년 7월 소소웨딩이 탄생했습니다</B>
</p>
  </div>
</div>
</div>



<!-- </div> -->

 <!-- footer -->
 <div class="footer">
  <div class="row">
    <div class="col-sm-6">
      <p id="info">
        (주)소소웨딩<br>
        서울시 마포구 백범로 23 | 서울 마포구 신수동 63-14<br>
        사업자등록번호 120-10-4999<br>
        Copyright (c) 비트캠프 All rights reserved.
        </p>
    </div>
    <div class="col-sm-6">
      <p id="phoneNumber">010-6658-1111</p>
      <p id="phoneImage">☎고객상담</p>
    </div>
  </div>
</div><!--footer-->


  <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
 <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>
