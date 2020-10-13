
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

	$(document).ready(
			function() {
				var formObj = $("form[name='updateForm']");

				$(document).on("click", "#fileDel", function() {
					$(this).parent().remove();
				})

				fn_addFile();

				$(".cancel_btn").on(
						"click",
						function() {
							event.preventDefault();
							location.href = "/board/readView?bno=${update.bno}"
									+ "&page=${scri.page}"
									+ "&perPageNum=${scri.perPageNum}"
									+ "&searchType=${scri.searchType}"
									+ "&keyword=${scri.keyword}";
						})

				$(".update_btn").on("click", function() {
					if (fn_valiChk()) {
						return false;
					}
					formObj.attr("action", "/board/update");
					formObj.attr("method", "post");
					formObj.submit();
				})
			})

	function fn_valiChk() {
		var updateForm = $("form[name='updateForm'] .chk").length;
		for (var i = 0; i < updateForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
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

</head>

<body>

	<%@ include file="../include/header2.jsp"%>

	<!-- 헤더 끝 -->

	<div class="boardwrap">
		<div class="boardwrap2">
			<h2 id="h2">자유게시판</h2>
			<p>소소웨딩 고객님들께서 자유롭게 소통하는 게시판 입니다</p>
		</div>
		<div class="boardwrap3">
				<form name="updateForm" role="form" method="post" action="/board/update" enctype="multipart/form-data">
				<input type="hidden" name="bno" value="${update.bno}"
					readonly="readonly" /> <input type="hidden" id="page" name="page"
					value="${scri.page}"> <input type="hidden" id="perPageNum"
					name="perPageNum" value="${scri.perPageNum}"> <input
					type="hidden" id="searchType" name="searchType"
					value="${scri.searchType}"> <input type="hidden"
					id="keyword" name="keyword" value="${scri.keyword}"> <input
					type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> <input
					type="hidden" id="fileNameDel" name="fileNameDel[]" value="">

				<div class="row">
					<div class="col-25">
						<label for="date">날짜</label>
					</div>
					<div class="col-75">
						<!-- <input type="date" id="currentDate" name="date" placeholder="날짜"> -->
						<!--*** <input type="text" id="date"> -->
						<input type="text"
							value="<fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd" /> "
							readonly />

					</div>
				</div>

				<div class="row">
					<div class="col-25">
						<label for="name">작성자</label>
					</div>
					<div class="col-75">
						<input type="text" id="writer" name="writer" class="chk"
							value="${update.writer}" readonly="readonly" />
					</div>
				</div>

				<div class="row">
					<div class="col-25">
						<label for="categori">말머리</label>
					</div>
					<div class="col-75">
						<input type="text" id="header" name="header" readonly="readonly" class="chk"
							value="${update.header}">
					</div>
				</div>

				<div class="row">
					<div class="col-25">
						<label for="title">제목</label>
					</div>
					<div class="col-75">
						<input type="text" id="title" name="title" value="${update.title}"
							class="chk">
					</div>
				</div>

				<div class="row">
					<div class="col-25">
						<label for="subject">내용</label>
					</div>
					<div class="col-75">
						<textarea id="content" name="content" style="height: 200px"
							class="chk"><c:out value="${update.content}" /></textarea>
					</div>
				</div>
				
				<div class="row">
					<div class="col-25">
						<label for="title">파일첨부</label>
					</div>
					<div class="col-75">
						
						<p id="fileIndex" >
							<c:forEach var="file" items="${file}">
							<p class="upload">
								<input type="hidden" id="FILE_NO" name="FILE_NO_${var.index}"
										value="${file.FILE_NO }"> <input type="hidden"
										id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}">
									<a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
									<button id="fileDel"
										onclick="fn_del('${file.FILE_NO}','FILE_NO_${var.index}');"
										type="button">삭제</button><br>
								</p>		
							</c:forEach>
						</p>
					</div>
				</div>

				<div class="row" id="down-btn">
					<input type="button" class="update_btn resbtn" id="modify"
						value="수정완료"> 
						<input type="button" class="cancel_btn resbtn"
						id="cancel" value="취소"> 
						<input type="button"
						class="fileAdd_btn resbtn" id="reset" value="파일추가">
					<!-- 취소버튼 누르면 목록으로 가게 해주세요  -->
				</div>
			</form>
		</div>
	</div>

	<!-- footer -->
	<div class="footer">
		<%@ include file="../include/footer2.jsp"%>
	</div>
	<!--footer-->
</body>
</html>