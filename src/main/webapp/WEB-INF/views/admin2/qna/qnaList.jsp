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

<title>회원관리</title>

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
<script src="http://code.jquery.com/jquery-1.11.0.js"></script>



<style>
div#btns {
	   text-align:center;
        margin-left: 5px;
        margin-top: 25px;

}

div#paging {
	text-align: center;
}

.selectalign {
	margin-left: 10px;
    margin-top: 30px;
}
  .text_w{
           border-color: #c9a563;
            color: white;
            border-radius: 3.5px;
            box-sizing: border-box;
            border-width: 0;
            background-color: #B39477;
            font-size: 14px;
            font-weight: 500;
            padding: 4px 10px;
        }
select#selSearchOption{
         height:26px;
         }
         
         #txtKeyWord{
         height:26px;
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

					<li>
					<li class="active"><a href="/admin2/qna/qnaList"> <i
							class="ti-pencil-alt2"></i>
							<p>Q & A</p>
					</a></li>

					<li><a href="/admin2/goods/list"> <i class="ti-map"></i>
							<p>상품승인</p>
					</a></li>

					<li><a href="/admin2/goods/boardList"> <i class="ti-text"></i>
							<p>자유게시판</p>
					</a></li>

					<li><a href="/admin2/goods/user"> <i class="ti-user"></i>
							<p>회원정보</p>
					</a></li>
					<li><a href="/admin2/goods/company"> <i
							class="ti-view-list-alt"></i>
							<p>기업정보</p>
					</a></li>
					<li><a href="/admin2/review"> <i class="ti-view-list-alt"></i>
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
						<a class="navbar-brand" href="#">Q & A</a>
						
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

			<form role="form" method="get">
				<div class="content">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<div class="header">
										<h4 class="title">Q & A</h4>
										<p class="category">소소웨딩에게 궁금한 점을 물어봐주세요 친절하게 답변해드리겠습니다</p>
									</div>
									<div class="content table-responsive table-full-width">
										<table class="table table-striped">
											<thead>
												<th>No</th>
												<th>답변</th>
												<th>말머리</th>
												<th>제목</th>
												<th>작성자</th>
												<th>등록일</th>
												<th>조회수</th>
												<th>댓글수</th>
											</thead>
											<c:forEach items="${list}" var="list">
												<tr>
													<td data-title="no"><c:out value="${list.bno}" /></td>
													<td data-title="tnf">[<c:out value="${list.tnf }"/>]</td>
													<td data-title="cate"><c:out value="${list.header }" /></td>
													<td data-title="title"><a
														href="/admin2/qna/readView?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
															<c:out value="${list.title}" />
													</a></td>
													<td data-title="writer"><c:out value="${list.writer}" /></td>
													<td data-title="date"><fmt:formatDate
															value="${list.regdate}" pattern="yyyy-MM-dd" /></td>
													<td data-title="hit"><c:out value="${list.hit}" /></td>
													<td>${list.reply_cnt}</td>

												</tr>

											</c:forEach>

											</tbody>
										</table>
			</form>
			<!-- 검색 폼 영역 -->
			<div id="btns">
				<div class="t1">
					<div class="selectalign">
						<select id="selSearchOption" name="searchType">
							<option value="n"
								<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
							<option value="t"
								<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
							<option value="c"
								<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
							<option value="w"
								<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
							<option value="tc"
								<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
						</select> <input type="text" name="keyword" id="txtKeyWord"
							value="${scri.keyword}" /> <input type='button' class="text_w"
							value='검색' class="p1" id="searchBtn">
						<script>
							$(function() {
								$('#searchBtn')
										.click(
												function() {
													self.location = "company"
															+ '${pageMaker.makeQuery(1)}'
															+ "&searchType="
															+ $(
																	"select option:selected")
																	.val()
															+ "&keyword="
															+ encodeURIComponent($(
																	'#txtKeyWord')
																	.val());
												});
							});
						</script>
					</div>
				</div>


				<div id="paging">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li><a
								href="compnay${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
							<li
								<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								<a href="compnay${pageMaker.makeSearch(idx)}">${idx}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="company${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
						</c:if>
					</ul>
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