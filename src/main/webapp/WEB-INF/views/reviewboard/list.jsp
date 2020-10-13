
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>reviewBoard</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/board/style.css">
<link rel="stylesheet" href="/resources/css/main/header-footer.css">
<script src="http://code.jquery.com/jquery-1.11.0.js">
	
</script>
<script src="./assets/js/pager.js">
	
</script>
<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<div class="container-fluid">
		<%@ include file="../include/header2.jsp"%>
	</div>

	<div id="mainWrapper">
		<div class="text_box">
			<h2>
				<b> 후기 게시판 </b>
			</h2>

		</div>
		<!-- 검색 폼 영역 -->
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
						$('#searchBtn').click(
								function() {
									self.location = "list"
											+ '${pageMaker.makeQuery(1)}'
											+ "&searchType="
											+ $("select option:selected").val()
											+ "&keyword="
											+ encodeURIComponent($(
													'#txtKeyWord').val());
								});
					});
				</script>
			</div>


			<form action="/reviewboard/list" method="get">
				<select name="sort">
					<option value="NONE" selected>--정렬--</option>
					<option value="bno" selected>번호</option>
					<option value="regdate" selected>등록일</option>
					<option value="hit" selected>조회수</option>
				</select> <input type="submit" value="선택">
		
			<c:if test="${member.userId != null}">
				<div id='write-btn'>
					<a href="/reviewboard/writeView"> <input type='button'
						class="text_w" value='글쓰기' />
					</a>
				</div>
			</c:if>
			</form>
		</div>
	
	
		<ul id="boardline">
			<!-- 게시판 제목 -->
			<!-- <li>게시판 Title </li> -->

			<!-- 게시판 목록  -->
			<div class="test2">
				<div id="demo">

					<!-- Responsive table starts here -->
					<!-- For correct display on small screens you must add 'data-title' to each 'td' in your table -->
					<form role="form" method="get">
						<div class="table-responsive-vertical shadow-z-1">

							<!-- Table starts here -->
							<table id="table" class="table table-hover table-mc-light-blue">
								<colgroup>
									<col style="width: 7%">
									<col style="width: 15%">
									<col style="width: *%">
									<col style="width: 10%">
									<col style="width: 15%">
									<col style="width: 10%">
								</colgroup>
								<thead>
									<tr>
										<th>No</th>
										<th>말머리</th>
										<th>제목</th>
										<th>작성자</th>
										<th>등록일</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<!-- 주석 -->
									<c:forEach items="${list}" var="list">
										<tr>
											<td data-title="no"><c:out value="${list.bno}" /></td>
											<td data-title="cate"><c:out value="${list.header }" /></td>
											<td data-title="title"><c:if
													test="${member.userId != null && mp_member.userId eq mp_board.writer}">
													<a
														href="/reviewboard/readView?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
														<c:out value="${list.title}" />
													</a>
												</c:if> <c:if test="${member.userId == null}">
													<a href="/reviewboard/needLogin"> <c:out
															value="${list.title}" />
													</a>
												</c:if> <span class="badge bg-teal"><i
													class="fa fa-comment-o"></i>+${list.reply_cnt}</span></td>
											<td data-title="writer"><c:out value="${list.writer}" /></td>
											<td data-title="date"><fmt:formatDate
													value="${list.regdate}" pattern="yyyy-MM-dd" /></td>
											<td data-title="hit"><c:out value="${list.hit}" /></td>
										</tr>
									</c:forEach>


								</tbody>
							</table>



						</div>
					</form>

					<div id="paging">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
									<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							</c:if>
						</ul>
					</div>
					<!-- Table Constructor change table classes, you don't need it in your project -->
				</div>
			</div>
	</div>

	<!-- footer -->
	<div class="footer">
		<%@ include file="../include/footer2.jsp"%>
	</div>
	<!--footer-->


	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>

</html>