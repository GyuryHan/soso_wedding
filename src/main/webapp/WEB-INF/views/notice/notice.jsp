<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <script src="http://code.jquery.com/jquery-1.11.0.js"> </script>
  <link rel="stylesheet" href="../resources/css/main/header-footer.css">
   <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<style>

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

body {

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
</style>
</head>
<body>
  <div class="container">
    <div class="form">
  <!-- header -->
  <div class="header">
    <%@ include file="../include/header2.jsp" %>
  </div><!--header-->
  
  <div class="row">
    <div class="col-sm-12 rrr">
  <img src="../resources/images/wed/we.png" alt="회사소개">
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

   </div>

<!-- footer -->
   
        <div class="footer">
    <%@ include file="../include/footer2.jsp" %>
  </div><!--header-->
    <!--footer-->
 
</body>
</html>