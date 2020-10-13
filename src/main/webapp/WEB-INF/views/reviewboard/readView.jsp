
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
	document.addEventListener("DOMContentLoaded", function() {

		// 브라우저의 현재 날짜를 받아온다.

		var toDay = new Date();
		document.getElementById("toYmd").value = toDay.yyyymmdd();
	});

	// 현재 날짜값을 yyyy-mm-dd 형식으로 변환해주는 함수
	Date.prototype.yyyymmdd = function() {
		var yyyy = this.getFullYear().toString();
		var mm = (this.getMonth() + 1).toString();
		var dd = this.getDate().toString();
		return yyyy + "-" + (mm[1] ? mm : "0" + mm[0]) + "-"
				+ (dd[1] ? dd : "0" + dd[0]);
	}

	 $(document).ready(function(){
         var formObj = $("form[name='readForm']");
         
         // 수정 
         $(".update_btn").on("click", function(){
            formObj.attr("action", "/reviewboard/updateView");
            formObj.attr("method", "get");
            formObj.submit();            
         })
         
         // 삭제
         $(".delete_btn").on("click", function(){
            
            var deleteYN = confirm("삭제하시겠습니까?");
            if(deleteYN == true){
               
            formObj.attr("action", "/reviewboard/delete");
            formObj.attr("method", "post");
            formObj.submit();
               
            }
         })
         
         // 목록
         $(".list_btn").on("click", function(){
            
            location.href = "/reviewboard/list?page=${scri.page}"
                        +"&perPageNum=${scri.perPageNum}"
                        +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
         })
         
         $(".replyWriteBtn").on("click", function(){
            var formObj = $("form[name='replyForm']");
            formObj.attr("action", "/reviewboard/replyWrite");
            formObj.submit();
         });
         
         //댓글 수정 View
         $(".replyUpdateBtn").on("click", function(){
            location.href = "/reviewboard/replyUpdateView?bno=${read.bno}"
                        + "&page=${scri.page}"
                        + "&perPageNum=${scri.perPageNum}"
                        + "&searchType=${scri.searchType}"
                        + "&keyword=${scri.keyword}"
                        + "&rno="+$(this).attr("data-rno");
         });
         
         //댓글 삭제 View
         $(".replyDeleteBtn").on("click", function(){
            location.href = "/reviewboard/replyDeleteView?bno=${read.bno}"
               + "&page=${scri.page}"
               + "&perPageNum=${scri.perPageNum}"
               + "&searchType=${scri.searchType}"
               + "&keyword=${scri.keyword}"
               + "&rno="+$(this).attr("data-rno");
         });
      })
      function fn_fileDown(fileNo){
         var formObj = $("form[name='readForm']");
         $("#FILE_NO").attr("value", fileNo);
         formObj.attr("action", "/reviewboard/fileDown");
         formObj.submit();
      }
</script>

</head>

<body>

	<%@ include file="../include/header2.jsp"%>

	<!-- 헤더 끝 -->

	<div class="boardwrap">
		<div class="boardwrap2">
			<h2 id="h2">후기 게시판</h2>
		</div>
		<div class="boardwrap3">
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="bno" name="bno" value="${read.bno}" /> <input
					type="hidden" id="page" name="page" value="${scri.page}"> <input
					type="hidden" id="perPageNum" name="perPageNum"
					value="${scri.perPageNum}"> <input type="hidden"
					id="searchType" name="searchType" value="${scri.searchType}">
				<input type="hidden" id="keyword" name="keyword"
					value="${scri.keyword}"> <input type="hidden" id="FILE_NO"
					name="FILE_NO" value="">
			</form>
			<div class="row">
				<div class="col-25">
					<label for="date">날짜</label>
				</div>
				<div class="col-75">
					<!-- <input type="date" id="currentDate" name="date" placeholder="날짜"> -->
					<!--*** <input type="text" id="date"> -->
					<input type="text" id="regdate" name="regdate"
						value="<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" /> "
						readonly/>

				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="name">작성자</label>
				</div>
				<div class="col-75">
					<input type="text" id="writer" name="writer" value="${read.writer}"
						readonly="readonly" />
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="categori">말머리</label>
				</div>
				<div class="col-75">
					<input type="text" id="header" name="header" value="${read.header}"
						readonly="readonly">
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="title">제목</label>
				</div>
				<div class="col-75">
					<input type="text" id="title" name="title" value="${read.title}"
						readonly="readonly">
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="subject">내용</label>
				</div>
				<div class="col-75">
					<textarea id="content" name="content" readonly="readonly"
						style="height: 200px"><c:out value="${read.content}" /></textarea>
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="title">파일첨부</label>
				</div>
				<div class="col-75">
					<p class="upload"><c:forEach var="file" items="${file}">
						<a href="#"
							onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)<br>
					</c:forEach></p>
				</div>
			</div>
			
			<div class="row" id="down-btn">
				<c:if
					test="${mp_member.userId eq review_board.writer && mp_member.userId != null}">
					<input type="button" class="update_btn resbtn" id="modify"
						value="수정">
					<input type="button" class="delete_btn resbtn" id="cancel"
						value="삭제">
				</c:if>
				<input type="button" class="list_btn resbtn" id="reset" value="목록">
				<!-- 취소버튼 누르면 목록으로 가게 해주세요  -->
			</div>

		</div>
	</div>

	<!-- 댓글 -->


	<div class="container reply">
		<div class="row">
			<div class="col-12">
				<div class="comments">
					<div class="comment-box add-comment">
						<form name="replyForm" method="post" class="form-horizontal">
							<input type="hidden" id="bno" name="bno" value="${read.bno}" />
               <input type="hidden" id="page" name="page" value="${scri.page}"> 
               <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
               <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
               <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
							<c:if test="${member.userId != null }">
								<span class="commenter-pic"> <img
									src="/resources/images/border/user.JPG"
									class="img-fluid">
								</span>
								<span class="commenter-name"> 
								 <c:if test="${member.verify == 9}">
                        <input type="hidden" id="writer" name="writer" class="form-control"
                     value="관리자" /></c:if><c:if test="${member.verify != 9}">
                         <input type="hidden" id="writer" name="writer" class="form-control"
                     value="${member.userId}" /></c:if>
								<input type="text"
									id="content" name="content" placeholder="댓글을 입력해주세요" />
									<button type="submit" class="btn btn-default replyWriteBtn">등록</button>
									<button type="reset" class="btn btn-default">취소</button>
								</span>
							</c:if>
							<c:if test="${member.userId == null }">
								<span class="commenter-pic"> <img
									src="/resources/images/border/user.JPG"
									class="img-fluid">
								</span>
								<span class="commenter-name"> <input type="text"
									id="content" name="content" readonly placeholder="로그인 후 이용해주세요" />
								</span>
							</c:if>
						</form>
					</div>

					<c:forEach items="${replyList}" var="replyList">
						<div class="comment-box">

							<span class="commenter-pic"> <img
								src="/resources/images/border/user.JPG"
								class="img-fluid">
							</span> <span class="commenter-name"> <label for="name">${replyList.writer}</label>
								<span class="comment-time"> <fmt:formatDate
										value="${replyList.regdate}" pattern="yyyy-MM-dd" />
							</span>
							</span>
							<p class="comment-txt more">${replyList.content}</p>
							<c:if
								test="${mp_member.userId eq replyList.writer && mp_member.userId != null}">
								<button type="button" class="replyUpdateBtn"
									data-rno="${replyList.rno}">수정</button>
							</c:if>
							<c:if
								test="${mp_member.userId eq replyList.writer && mp_member.userId != null}">
								<button type="button" class="replyDeleteBtn"
									data-rno="${replyList.rno}">삭제</button>
							</c:if>
							<div class="comment-meta">
								<button class="comment-reply reply-popup">
									<i class="fa fa-reply-all" aria-hidden="true"></i> Reply
								</button>
							</div>
							<div class="comment-box add-comment reply-box">
								<span class="commenter-pic"> <img
									src="/resources/images/border/user.JPG"
									class="img-fluid">
								</span> <span class="commenter-name"> <input type="text"
									placeholder="댓글을 입력해주세요" name="Add Comment">
									<button type="submit" class="btn btn-default">등록</button>
									<button type="cancel" class="btn btn-default reply-popup">취소</button>
								</span>
							</div>


						</div>
					</c:forEach>
				</div>
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