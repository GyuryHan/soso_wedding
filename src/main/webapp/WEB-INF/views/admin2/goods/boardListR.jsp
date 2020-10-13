<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="/resources/assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="/resources/assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>공지 사항</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
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
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link href="/resources/assets/css/themify-icons.css" rel="stylesheet">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/css/write-read.css">

<!-- 합쳐지고 최소화된 최신 CSS -->

<script>
      // Reply box popup JS
      $(document).ready(function(){
        $(".reply-popup").click(function(){
         $(".reply-box").toggle();
        });
      });
      </script>

<script type="text/javascript">
      document.addEventListener("DOMContentLoaded", function () {
   
        // 브라우저의 현재 날짜를 받아온다.
   
        var toDay = new Date();
        document.getElementById("toYmd").value = toDay.yyyymmdd();
      });
   
      // 현재 날짜값을 yyyy-mm-dd 형식으로 변환해주는 함수
      Date.prototype.yyyymmdd = function () {
        var yyyy = this.getFullYear().toString();
        var mm = (this.getMonth() + 1).toString();
        var dd = this.getDate().toString();
        return yyyy + "-" + (mm[1] ? mm : "0" + mm[0]) + "-" + (dd[1] ? dd : "0" + dd[0]);
      }
     
      </script>
<script type="text/javascript">
      $(document)
		.ready(
				function() {

					//댓글 수정 View
					$(".replyUpdateBtn")
							.on(
									"click",
									function() {
										location.href = "/admin2/goods/board/replyUpdateView?bno=${boardListR.bno}"
												+ "&page=${scri.page}"
												+ "&perPageNum=${scri.perPageNum}"
												+ "&searchType=${scri.searchType}"
												+ "&keyword=${scri.keyword}"
												+ "&rno="
												+ $(this).attr("data-rno");
									});

					//댓글 삭제 View	
					$(".replyDeleteBtn")
							.on(
									"click",
									function() {
										location.href = "/admin2/goods/board/replyDeleteView?bno=${boardListR.bno}"
												+ "&page=${scri.page}"
												+ "&perPageNum=${scri.perPageNum}"
												+ "&searchType=${scri.searchType}"
												+ "&keyword=${scri.keyword}"
												+ "&rno="
												+ $(this).attr("data-rno");
									});
					$(".replyWriteBtn").on("click", function() {
						var formObj = $("form[name='replyForm']");
						formObj.attr("action", "/admin2/goods/board/replyWrite");
						formObj.submit();
					});
				
				})
  	function fn_fileDown(fileNo) {
  		var formObj = $("form[name='readForm']");
  		$("#FILE_NO").attr("value", fileNo);
  		formObj.attr("action", "/board/fileDown");
  		formObj.submit();
  	}
    function del(seq) {
        var chk = confirm("정말 삭제하시겠습니까?");
        if (chk) {
            location.href='boardListD?bno='+seq;
        }
    }
         </script>
         
         
         
         <style>
input#content{
border-radius:5px;
height:40px;
border: 1px solid #ddd;
}
.img-fluid {
    max-width: 100%;
    height: auto;
    margin-left: 3.3px;
    margin-top: 4px;
}
</style>
         
</head>
<body>

	<div class="wrapper">
		<div class="sidebar" data-background-color="white"
			data-active-color="danger">

			<!--
      Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
      Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
   -->

			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="/admin2/index" class="simple-text"> SOSO WEDDING ADMIN
					</a>
				</div>

				<ul class="nav">
					<li><a href="/admin2/index"> <i class="ti-panel"></i>
							<p>MAIN</p>
					</a></li>
					<li><a href="/admin2/goods/notices"> <i class="ti-bell"></i>
							<p>공지사항</p>
					</a></li>

					<li><a href="/admin2/qna/qnaList"> <i
							class="ti-pencil-alt2"></i>
							<p>Q & A</p>
					</a></li>

					<li><a href="/admin2/goods/list"> <i class="ti-map"></i>
							<p>상품승인</p>
					</a></li>

					<li>
					<li class="active"><a href="/admin2/goods/boardList"> <i
							class="ti-text"></i>
							<p>자유게시판</p>
					</a></li>

					<li><a href="/admin2/goods/user"> <i class="ti-user"></i>
							<p>회원정보</p>
					</a></li>
					<li><a href="/admin2/goods/company"> <i
							class="ti-view-list-alt"></i>
							<p>기업정보</p>
					</a></li>
					<li><a href="/admin2/goods/company"> <i
							class="ti-view-list-alt"></i>
							<p>후기게시판</p>
					</a></li>

				</ul>
			</div>
		</div>

		<div class="main-panel">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar bar1"></span> <span class="icon-bar bar2"></span>
							<span class="icon-bar bar3"></span>
						</button>
						<a class="navbar-brand" href="#">FREE BOARD</a>
					</div>

					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="/"> <i class="ti-panel"></i>
									<p>일반화면</p>
							</a></li>
							<li><a href="/member/signout"> <i class="ti-settings"></i>
									<p>로그아웃</p>
							</a></li>
						</ul>
					</div>
				</div>
			</nav>


			<div class="content">
				<div class="boardwrap">
					<div class="boardwrap2">
						<h2 id="h2">자유게시판</h2>
						<p>소소웨딩 고객님들께서 자유롭게 소통하는 게시판 입니다</p>
					</div>
					<div class="row">
						<div class="col-25">
							<label for="date">날짜</label>
						</div>
						<div class="col-75">
							<!-- <input type="date" id="currentDate" name="date" placeholder="날짜"> -->
							<!--*** <input type="text" id="date"> -->
							<input type="text" id="toYmd" readonly />
						</div>
					</div>

					<div class="row">
						<div class="col-25">
							<label for="name">작성자</label>
						</div>
						<div class="col-75">
							<input type="text" id="fname" name="writer"
								value="${member.userId}" readonly />
						</div>
					</div>

					<div class="row">
						<div class="col-25">
							<label for="categori">말머리</label>
						</div>
						<div class="col-75">
							<input type="text" id="header" name="header"
								value="${boardListR.header}" readonly="readonly">
						</div>
					</div>

					<div class="row">
						<div class="col-25">
							<label for="title">제목</label>
						</div>
						<div class="col-75">
							<input type="text" id="title" name="title"
								value="${boardListR.title}" readonly="readonly">
						</div>
					</div>

					<div class="row">
						<div class="col-25">
							<label for="subject">내용</label>
						</div>
						<div class="col-75">
							<textarea id="subject" name="contents" style="height: 200px"
								readonly="readonly"><c:out
									value="${boardListR.content}" /></textarea>
						</div>
					</div>


					<div class="row">
						<div class="col-25">
							<label for="title">파일첨부</label>
						</div>
						<div class="col-75">
							<p class="upload">
								<c:forEach var="file" items="${file}">
									<a href="#"
										onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)<br>
								</c:forEach>
							</p>
						</div>
					</div>


					<div class="row">
						<input type="submit" id="submit" value="삭제"
							onclick="del(${boardListR.bno})"> <input type="reset"
							id="reset" value="목록"
							onclick='location.href="/admin2/goods/boardList"'>
					</div>

				</div>
			</div>

			<div class="container reply">
				<div class="row">
					<div class="col-12">
						<div class="comments">
							<div class="comment-box add-comment">
								<form name="replyForm" method="post" class="form-horizontal">
									<input type="hidden" id="bno" name="bno"
										value="${boardListR.bno}" /> <input type="hidden" id="page"
										name="page" value="${scri.page}"> <input type="hidden"
										id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
									<input type="hidden" id="searchType" name="searchType"
										value="${scri.searchType}"> <input type="hidden"
										id="keyword" name="keyword" value="${scri.keyword}"> <span
										class="commenter-pic"> <img
										src="/resources/images/border/user.JPG" class="img-fluid">
									</span> <span class="commenter-name"> <input type="hidden"
										id="writer" name="writer" class="form-control" value="관리자" />
										<input type="text" id="content" name="content"
										placeholder="댓글을 입력해주세요" />
										<button type="submit" class="btn btn-default replyWriteBtn">등록</button>
										<button type="reset" class="btn btn-default">취소</button>
									</span>
								</form>
							</div>

							<c:forEach items="${replyList}" var="replyList">
								<div class="comment-box">

									<span class="commenter-pic"> <img
										src="/resources/images/border/user.JPG" class="img-fluid">
									</span> <span class="commenter-name"> <label for="name">${replyList.writer}</label>
										<span class="comment-time"> <fmt:formatDate
												value="${replyList.regdate}" pattern="yyyy-MM-dd" />
									</span>
									</span>
									<p class="comment-txt more">${replyList.content}</p>
									<button type="button" class="replyUpdateBtn"
										data-rno="${replyList.rno}">수정</button>
									<button type="button" class="replyDeleteBtn"
										data-rno="${replyList.rno}">삭제</button>
									<div class="comment-meta">
										<button class="comment-reply reply-popup">
											<i class="fa fa-reply-all" aria-hidden="true"></i> Reply
										</button>
									</div>
									<div class="comment-box add-comment reply-box">
										<span class="commenter-pic"> <img
											src="/resources/images/border/user.JPG" class="img-fluid">
										</span> <span class="commenter-name"> <input type="text"
											placeholder="댓글을 입력해주세요" name="Add Comment">
											<button type="submit" class="btn btn-default">등록</button>
											<button type="reset" class="btn btn-default reply-popup">취소</button>
										</span>
									</div>


								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
</body>

<!--   Core JS Files   -->
<script src="/resources/assets/js/jquery-1.10.2.js"
	type="text/javascript"></script>
<script src="/resources/assets/js/bootstrap.min.js"
	type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script src="/resources/assets/js/bootstrap-checkbox-radio.js"></script>

<!--  Charts Plugin -->
<script src="/resources/assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="/resources/assets/js/bootstrap-notify.js"></script>

<!--  Google Maps Plugin    -->
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js"></script>

<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
<script src="/resources/assets/js/paper-dashboard.js"></script>

<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
<script src="/resources/assets/js/demo.js"></script>


</html>