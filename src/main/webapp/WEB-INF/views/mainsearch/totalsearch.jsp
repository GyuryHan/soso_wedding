<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 양식 데이터에러 필수 -->
<%
	response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
if (request.getProtocol().equals("HTTP/1.1"))
	response.setHeader("Cache-Control", "no-cache");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/main/allSearch.css">
<!-- <link rel="stylesheet" href="header-footer.css" type="text/css"> -->
<link rel="stylesheet" href="/resources/css/main/header-footer.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">

</head>

<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<body>



	<!-- 회원 header -->
	<div class="container">
		<div class="header">
			<%@ include file="../include/header2.jsp"%>
		</div>
		<!--header-->


		<div class="container">
			<div class="row">
				<div class="searchBar">
					<form form class="navbar-form navbar-center" role="search"
						action="/mainsearch/totalsearch" method="post">
						<input type="text" name="keyword" title="검색어를 입력해 주세요."
							id="keyword" keyword="${search.keyword}" value="${search.keyword}" />
						<button name="search" title="검색확인" type="submit" data-id="search">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						</button>
				</div>
				</form>
			</div>
			<div class="row searchbarText">
				<p>
					'${search.keyword}'에 대해
					<p id="red">'${count}'</p>
				건이 검색되었습니다.
			</div>

			<!-- 상점리스트 --><div class="row contents">
				<h2>상점</h2>
				<c:set var="loop_flag" value="false" />
				<c:forEach items="${goodslist}" var="keyword" varStatus="status">
					<c:if test="${status.count%4==1}">
					</c:if>
					<a href="/shop/view?n=${keyword.gdsNum}">
						<div class="line">
							<div class="col-sm-3 boxContents">
								<img src="${keyword.gdsThumbImg}">
							</div>
							<div class="col-sm-9">
								<h3>${keyword.gdsName}</h3>
								<p>${keyword.gdsDes}</p>
							</div>
					
					</a>
			
			</div>
			<%--  <c:if test="${status.count%4==0}">--%>

			<%--  </c:if>--%>

			</c:forEach>

			<form role="form" method="get">
				<div class="pull-right">
					<nav aria-label="...">
						<ul class="pager">
							<c:if test="${goodspaging.prev}">
								<li><a
									href="totalsearch${goodspaging.makeQuery(goodspaging.startPage-1)}&keyword=${search.keyword}&category=store">Previous</a></li>
							</c:if>
							<c:forEach begin="${goodspaging.startPage}"
								end="${goodspaging.endPage}" var="idx">
								<li><c:out
										value="${goodspaging.allcri.page == idx ? '' : '' }"></c:out>
									<a
									href="totalsearch${goodspaging.makeQuery(idx)}&keyword=${search.keyword}&category=store">${idx}</a>
								</li>
							</c:forEach>
							<c:if test="${goodspaging.next && goodspaging.endPage >0}">
								<li><a
									href="totalsearch${goodspaging.makeQuery(goodspaging.endPage+1)}&keyword=${search.keyword}&category=store">Next</a>
								</li>
							</c:if>
						</ul>
					</nav>
				</div>
			</form>

		</div>

		<!-- 후기게시판리스트 -->
		<div class="row contents">
			<h2>후기게시판</h2>
			<c:set var="loop_flag" value="false" />
			<c:forEach items="${reviewboardlist}" var="keyword"
				varStatus="status">
				<c:if test="${status.count%4==1}">
				</c:if>
				<a href="/reviewboard/readView?bno=${keyword.bno}">
					<div class="line2">
						<div class="col-sm-12">
							<h3>${keyword.title}</h3>
							<p>${keyword.content}</p>
						</div>
					</div>
				</a>
				<%--  <c:if test="${status.count%4==0}">--%>

				<%--  </c:if>--%>

			</c:forEach>

			<form role="form" method="get">
				<div class="pull-right">
					<nav aria-label="...">
						<ul class="pager">
							<c:if test="${reviewpaging.prev}">
								<li><a
									href="totalsearch${reviewpaging.makeQuery(reviewpaging.startPage-1)}&keyword=${search.keyword}&category=reviewboard">Previous</a>
								</li>
							</c:if>
							<c:forEach begin="${reviewpaging.startPage}"
								end="${reviewpaging.endPage}" var="idx">
								<li><c:out
										value="${reviewpaging.allcri.page == idx ? '' : '' }"></c:out>
									<a
									href="totalsearch${reviewpaging.makeQuery(idx)}&keyword=${search.keyword}&category=reviewboard">${idx}</a>
								</li>
							</c:forEach>
							<c:if test="${reviewpaging.next && reviewpaging.endPage >0}">
								<li><a
									href="totalsearch${reviewpaging.makeQuery(reviewpaging.endPage+1)}&keyword=${search.keyword}&category=reivewboard">Next</a>

								</li>
							</c:if>

						</ul>
					</nav>
				</div>
		
		</div>

		<!-- 자유게시판리스트 -->
		<div class="row contents">
			<h2>자유게시판</h2>
			<c:set var="loop_flag" value="false" />
			<c:forEach items="${boardlist}" var="keyword" varStatus="status">
				<c:if test="${status.count%4==1}">
				</c:if>
				<a href="/board/readView?bno=${keyword.bno}">
					<div class="line2">
						<div class="col-sm-12">
							<h3>${keyword.title}</h3>
							<p>${keyword.content}</p>
						</div>
					</div>
				</a>
				<%--  <c:if test="${status.count%4==0}">--%>

				<%--  </c:if>--%>
			</c:forEach>


			<form role="form" method="get">
				<div class="pull-right">
					<nav aria-label="...">
						<ul class="pager">
							<c:if test="${boardpaging.prev}">
								<li><a
									href="totalsearch${boardpaging.makeQuery(boardpaging.startPage-1)}&keyword=${search.keyword}&category=free">Previous</a>
								</li>
							</c:if>
							<c:forEach begin="${boardpaging.startPage}"
								end="${boardpaging.endPage}" var="idx">
								<li><c:out
										value="${boadpaging.allcri.page == idx ? '' : '' }"></c:out> <a
									href="totalsearch${reviewpaging.makeQuery(idx)}&keyword=${search.keyword}&category=free">${idx}</a>
								</li>
							</c:forEach>
							<c:if test="${boardpaging.next && boadpaging.endPage >0}">
								<li><a
									href="totalsearch${boardpaging.makeQuery(boardpaging.endPage+1)}&keyword=${search.keyword}&category=free">Next</a>
								</li>
							</c:if>

						</ul>
					</nav>
				</div>



			</form>
		</div>

		<!-- QNA게시판리스트 -->
		<div class="row contents">
			<h2>QnA게시판</h2>
			<c:set var="loop_flag" value="false" />
			<c:forEach items="${qnaboardlist}" var="keyword" varStatus="status">
				<c:if test="${status.count%4==1}">
				</c:if>
				<a href="/qnaboard/readView?bno=${keyword.bno}">
					<div class="line2">
						<div class="col-sm-12">
							<h3>${keyword.title}</h3>
							<p>${keyword.content}</p>
						</div>
					</div>
				</a>
				<%--  <c:if test="${status.count%4==0}">--%>

				<%--  </c:if>--%>
			</c:forEach>


			<form role="form" method="get">
				<div class="pull-right">
					<nav aria-label="...">
						<ul class="pager">
							<c:if test="${qnapaging.prev}">
								<li><a
									href="totalsearch${qnapaging.makeQuery(qnapaging.startPage-1)}&keyword=${search.keyword}&category=qna">Previous</a>
								</li>
							</c:if>
							<c:forEach begin="${qnapaging.startPage}"
								end="${qnapaging.endPage}" var="idx">
								<li><c:out
										value="${qnapaging.allcri.page == idx ? '' : '' }"></c:out> <a
									href="totalsearch${qnapaging.makeQuery(idx)}&keyword=${search.keyword}&category=qna">${idx}</a>
								</li>
							</c:forEach>
							<c:if test="${qnapaging.next && qnapaging.endPage >0}">
								<li><a
									href="totalsearch${qnapaging.makeQuery(qnapaging.endPage+1)}&keyword=${search.keyword}">Next</a>
								</li>
							</c:if>

						</ul>
					</nav>
				</div>
			</form>
		</div>

		<!-- footer -->
		<div class="footer">
			<%@ include file="../include/footer2.jsp"%>
		</div>
		<!--footer-->

		<!--container-->

		<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</body>
</html>