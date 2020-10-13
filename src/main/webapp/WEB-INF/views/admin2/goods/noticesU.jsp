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

   <title>공지사항</title>

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
   
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="/resources/css/write-read.css">
</head>

<script type="text/javascript">
$(document).ready(function() {
   $(document).on("click", "#fileDel", function() {
      $(this).parent().remove();
   })
   
      fn_addFile();
   })
function fn_addFile() {
   var fileIndex = 1;
   //$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
   $(".fileAdd_btn")
         .on(
               "click",
               function() {
                  $("#fileIndex")
                        .append(
                              "<span><input type='file'  name='file_"
                                    + (fileIndex++)
                                    + "'>"
                                    + "</button>"
                                    + "<button type='button'  id='fileDelBtn'>"
                                    + "삭제" + "</span></button>");
               });
   $(document).on("click", "#fileDelBtn", function() {
      $(this).parent().remove();

   });
}
var fileNoArry = new Array();
var fileNameArry = new Array();
function fn_del(value, name) {

   fileNoArry.push(value);
   fileNameArry.push(name);
   $("#fileNoDel").attr("value", fileNoArry);
   $("#fileNameDel").attr("value", fileNameArry);
}

</script>
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
                <li><li class="active">
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

                <li>
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
                    <a class="navbar-brand" href="#">NOTICE</a>
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
    
    

    <div class="boardwrap">
        <div class="boardwrap2">
            <h2 id="h2">공지사항 수정</h2>
            <p>소소웨딩의 소식을 전해드립니다</p>
        </div>
        <div class="boardwrap3">
            <form name="readForm" role="form" method="post" action="/admin2/goods/noticesUE" enctype="multipart/form-data">
                <input type="hidden" id="no" name="no" value="${noticesU.no }" > 
                <input type="hidden" id="fileNoDel" name="fileNoDel[]" value="">
                <input type="hidden" id="fileNameDel" name="fileNameDel[]" value="">
    <!--  
            <div class="row">
                <div class="col-25">
                    <label for="date">날짜</label>
                </div>
                <div class="col-75">
                    <!-- <input type="date" id="currentDate" name="date" placeholder="날짜"> 
                    <!--*** <input type="text" id="date"> 
                    <input type="text" id="regdate" name="regdate" value="2020-06-25" readonly="">

                </div>
            </div>
-->
            <div class="row">
                <div class="col-25">
                    <label for="name">작성자</label>
                </div>
                <div class="col-75">
                    <input type="text" id="writer" name="writer" value="관리자" readonly="readonly">
                </div>
            </div>

            <div class="row">
                <div class="col-25">
                    <label for="categori">말머리</label>
                </div>
                <div class="col-75">
                    <input type="text" id="header" name="header" value="${noticesU.header}" readonly="readonly">
                </div>
            </div>

            <div class="row">
                <div class="col-25">
                    <label for="title">제목</label>
                </div>
                <div class="col-75">
                    <input type="text" id="title" name="title" value="${noticesU.title}" >
                </div>
            </div>

            <div class="row">
                <div class="col-25">
                    <label for="subject">내용</label>
                </div>
                <div class="col-75">
                    <textarea id="contents" name="contents" style="height: 200px">${noticesU.contents}</textarea>
                </div>
            </div>

            <div class="row">
                <div class="col-25">
                    <label for="title">파일첨부</label>
                </div>
                <div class="col-75">
                    <c:forEach var="file_1" items="${file_1}">
                    <p class="upload">
                        <input type="hidden" id="FILE_NO" name="FILE_NO_${var.index}" value="${file_1.FILE_NO }">
                  <input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}">
               
                        <a href="#" id="fileName" onclick="return false;">${file_1.ORG_FILE_NAME}</a>(1014.7kb)<br>(${file_1.FILE_SIZE}kb)
                  <button id="fileDel" onclick="fn_del('${file_1.FILE_NO}','FILE_NO_${var.index}');" type="button">삭제</button><br>         
                    </p>
                    </c:forEach>
                </div>
            </div>

            <div class="row" id="down-btn">
                
                 <input type="reset" id="reset" value="목록" onclick='location.href="/admin2/goods/notices"'>
                <input type="submit" id="submit" value="수정완료" data-pagetype="faq" data-action="/customer/faqSave" class="btn_red" onfocus="this.blur()" style="outline: none;">
                <!-- 취소버튼 누르면 목록으로 가게 해주세요  -->

            </div>
            </form>
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