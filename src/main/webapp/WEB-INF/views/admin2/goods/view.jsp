<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="/resources/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/resources/assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>상품승인</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="/resources/assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="/resources/assets/css/animate.min.css" rel="stylesheet" />

    <!--  Paper Dashboard core CSS    -->
    <link href="/resources/assets/css/paper-dashboard.css" rel="stylesheet" />

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="/resources/assets/css/demo.css" rel="stylesheet" />

    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="/resources/assets/css/themify-icons.css" rel="stylesheet">


    <style>
        .inputArea {
            margin: 10px 0;
        }

        select {
            width: 100px;
        }

        label {
            display: inline-block;
            width: 70px;
            padding: 5px;
        }

        label[for='gdsDes'] {
            display: block;
        }

        input {
            width: 150px;
        }

        textarea#gdsDes {
            width: 400px;
            height: 180px;
        }

 
body {
   font-family: '맑은 고딕', verdana;
   padding: 0;
   margin: 0;
}

ul {
   padding: 0;
   margin: 0;
   list-style: none;
}

div#root {
   width: 90%;
   margin: 0 auto;
}

header#header {
   font-size: 60px;
   padding: 20px 0;
}

header#header h1 a {
   color: #000;
   font-weight: bold;
}

nav#nav {
   padding: 10px;
   text-align: right;
}

nav#nav ul li {
   display: inline-block;
   margin-left: 10px;
}

section#container {
   padding: 20px 0;
   border-top: 2px solid #eee;
   border-bottom: 2px solid #eee;
}

section#container::after {
   content: "";
   display: block;
   clear: both;
}

aside {
   float: left;
   width: 200px;
}

div#container_box {
   float: right;
   width: calc(100% - 200px - 20px);
}

aside ul li {
   text-align: center;
   margin-bottom: 10px;
}

aside ul li a {
   display: block;
   width: 100%;
   padding: 10px 0;
}

aside ul li a:hover {
   background: #eee;
}

footer#footer {
   background: #f9f9f9;
   padding: 20px;
}

footer#footer ul li {
   display: inline-block;
   margin-right: 10px;
}




.inputArea {
   margin: 10px 0;
}

select {
   width: 100px;
}

label {
   display: inline-block;
   width: 70px;
   padding: 5px;
}

label[for='gdsDes'] {
   display: block;
}

input {
   width: 150px;
}

textarea#gdsDes {
   width: 400px;
   height: 180px;
}

.select_img img {
   margin: 20px 0;
}

.inputArea #sample2_address { width:230px; }
.inputArea #sample2_detailAddress { width:280px; }
.inputArea #sample2_extraAddress { display:none; }




#container_box table { width:900px; } 
#container_box table th { font-size:20px; font-weight:bold;
                     text-align:center; padding:10px; border-bottom:2px solid #666; }
#container_box table tr:hover { background:#eee; }
#container_box table td { padding:10px; text-align:center; }
#container_box table img { width:150px; height:auto; }

    </style>
    <script type="text/javascript">
        function del(seq) {
            var chk = confirm("정말 삭제하시겠습니까?");
            if (chk) {
                location.href = 'delete?gdsNum=' + seq;
            }
        }
        function com(seq) {
            var chk = confirm("정말 승인하시겠습니까?");
            if (chk) {
                location.href = 'update2?gdsNum=' + seq;
            }
        }
        function can(seq) {
            var chk = confirm("정말 취소하시겠습니까?");
            if (chk) {
                location.href = 'update3?gdsNum=' + seq;
            }
        }   
    </script>
    
</head>

<body>
    <div class="wrapper">
        <div class="sidebar" data-background-color="white" data-active-color="danger">

            <!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="/admin2/index" class="simple-text">
                        SOSO WEDDING ADMIN
                    </a>
                </div>

                <ul class="nav">
                    <li>
                        <a href="/admin2/index">
                            <i class="ti-panel"></i>
                            <p>MAIN</p>
                        </a>
                    </li>
                    <li>
                        <a href="/admin2/goods/notices">
                            <i class="ti-bell"></i>
                            <p>공지사항</p>
                        </a>
                    </li>

                    <li>
                        <a href="/admin2/qna/qnaList">
                            <i class="ti-pencil-alt2"></i>
                            <p>Q & A</p>
                        </a>
                    </li>

                    <li><li class="active">
                        <a href="/admin2/goods/list">
                            <i class="ti-map"></i>
                            <p>상품승인</p>
                        </a>
                    </li>

                    <li>
                        <a href="/admin2/goods/boardList">
                            <i class="ti-text"></i>
                            <p>자유게시판</p>
                        </a>
                    </li>

                    <li>
                        <a href="/admin2/goods/user">
                            <i class="ti-user"></i>
                            <p>회원정보</p>
                        </a>
                    </li>
                    <li>
                        <a href="/admin2/goods/company">
                            <i class="ti-view-list-alt"></i>
                            <p>기업정보</p>
                        </a>
                    </li>
                     <li>
                        <a href="/admin2/goods/company">
                            <i class="ti-view-list-alt"></i>
                            <p>후기게시판</p>
                        </a>
                    </li>

                </ul>
            </div>
        </div>



        <div class="main-panel">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar bar1"></span>
                            <span class="icon-bar bar2"></span>
                            <span class="icon-bar bar3"></span>
                        </button>
                        <a class="navbar-brand" href="#">USER LIST</a>
                    </div>

                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-right">
                             <li>
                                <a href="/">
                                    <i class="ti-panel"></i>
                                    <p>일반화면</p>
                                </a>
                            </li>
                            <li>
                                <a href="/member/signout">
                                    <i class="ti-settings"></i>
                                    <p>로그아웃</p>
                                </a>
                            </li>
                        </ul>

                    </div>

                </div>
            </nav>

            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <form role="form" method="post" autocomplete="off">
                                    <div id="pack">
                                        <div class="inputArea">
                                            <label>1차 분류</label>
                                            <span class="category1"></span>
                                            <label>2차 분류</label>
                                            <span class="category2">${goods.cateCode}
                                              </span>
                                              <label>승인여부</label>
                                             <c:if test="${goods.tnf eq 'T'}">
    											<span>승인</span>
												</c:if>
												<c:if test="${goods.tnf eq 'F'}">
    											<span>미승인</span>
												</c:if>
                                        </div>

                                        <div class="inputArea">
                                            <label for="gdsName">상품명</label>
                                            <span>${goods.gdsName}</span>
                                        </div>

                                        <div class="inputArea">
                                            <label for="gdsPrice">상품가격</label>
                                             <span><fmt:formatNumber value="${goods.gdsPrice}" pattern="###,###,###"/></span>
                                        </div>

                                        <div class="inputArea">
                                            <label for="gdsStock">상품수량</label>
                                            <span>${goods.gdsStock}</span>
                                        </div>

                                        <div class="inputArea">
                                            <label for="gdsDes">상품소개</label>
                                            <div class="gdsDes">${goods.gdsDes}</div>
                                        </div>
										<div class="inputArea">
								            <label for="gdsImg">이미지</label>
								            <p>원본 이미지</p>
								            <img src="${goods.gdsImg}" class="oriImg"/>
								            
								            <p>썸네일</p>
								            <img src="${goods.gdsThumbImg}" class="thumbImg"/> 
								         </div>
                                        <div class="inputArea">
                                            <button type="reset"id="reload" class="btn btn-resbtn" onclick="com(${goods.gdsNum})">승인</button>
                                            <button type="reset" id="reload" class="btn btn-resbtn" onclick="can(${goods.gdsNum})">미승인</button>
                                            <button type="reset" id="reload" class="btn btn-resbtn" onclick='location.href="/admin2/goods/list"'>목록</button>
                                            <button type="submit"id="reload" class="btn btn-resbtn"  onclick="del(${goods.gdsNum})">삭제</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

</body>
<!--   Core JS Files   -->
<script src="/resources/assets/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="/resources/assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script src="/resources/assets/js/bootstrap-checkbox-radio.js"></script>

<!--  Charts Plugin -->
<script src="/resources/assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="/resources/assets/js/bootstrap-notify.js"></script>

<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>

<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
<script src="/resources/assets/js/paper-dashboard.js"></script>

<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
<script src="/resources/assets/js/demo.js"></script>
</html>