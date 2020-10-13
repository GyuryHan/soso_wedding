
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/css/board//write-read.css">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/main/header-footer.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">

<script src="./assets/js/pager.js">
   
</script>
<title>freeread</title>

<script>
	// Reply box popup JS
	$(document).ready(function() {
		$(".reply-popup").click(function() {
			$(".reply-box").toggle();
		});
	});
</script>

<script type="text/javascript">
      function fn_fileDown(fileNo){
         var formObj = $("form[name='readForm']");
         $("#FILE_NO").attr("value", fileNo);
         formObj.attr("action", "/admin2/fileDown1");
         formObj.submit();
      }
</script>

</head>

<body>

	<%@ include file="../include/header2.jsp"%>

	<!-- 헤더 끝 -->

	<div class="boardwrap">
		<div class="boardwrap2">
			<h2 id="h2">공지 사항</h2>
		</div>
		<div class="boardwrap3">
			
			<div class="row">
				<div class="col-25">
					<label for="date">날짜</label>
				</div>
				<div class="col-75">
					<!-- <input type="date" id="currentDate" name="date" placeholder="날짜"> -->
					<!--*** <input type="text" id="date"> -->
					<input type="text" id="regdate" name="regdate" value="${noticesR.noticeDate}"
						readonly="readonly"/>

				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="name">작성자</label>
				</div>
				<div class="col-75">
					<input type="text" id="writer" name="writer" value="관리자"
						readonly="readonly" />
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="categori">말머리</label>
				</div>
				<div class="col-75">
					<input type="text" id="header" name="header" value="${noticesR.header}"
						readonly="readonly">
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="title">제목</label>
				</div>
				<div class="col-75">
					<input type="text" id="title" name="title" value="${noticesR.title}"
						readonly="readonly">
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="subject">내용</label>
				</div>
				<div class="col-75">
					<textarea id="content" name="content" readonly="readonly"
						style="height: 200px"><c:out value="${noticesR.contents}" /></textarea>
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="title">파일첨부</label>
				</div>
				<div class="col-75">
					<p class="upload"><c:forEach var="file_1" items="${file_1}">
						<a href="#"
							onclick="fn_fileDown('${file_1.FILE_NO}'); return false;">${file_1.ORG_FILE_NAME}</a>(${file_1.FILE_SIZE}kb)<br>
					</c:forEach></p>
				</div>
			</div>
			
			<div class="row" id="down-btn">
			<input type="reset" id="reset" value="목록" onclick='location.href="/board/notices"'>
				<!-- 취소버튼 누르면 목록으로 가게 해주세요  -->
			</div>

		</div>
	</div>

	<!-- footer -->
	<div class="footer">
		<%@ include file="../include/footer2.jsp"%>
	</div>
	<!--footer-->
</body>
</html>