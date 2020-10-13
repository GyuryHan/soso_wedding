<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<title>kubg company</title>
	
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
<link rel="stylesheet" href="/resources/css/company/c_main.css">
<script src="/resources/bootstrap/bootstrap.min.js"></script>
<script src="/resources/js/company/scroll.js"></script>
<script src="/resources/js/company/menu_fixed.js"></script>
	<link rel="stylesheet" href="/resources/css/main/header-footer.css">



<style>
/*상품목록 리스트*/
body{
padding-top:0;
}
.h_mb{
margin-bottom:0;
border-bottom:1.5px solid #333;
}

/*테이블 높이값*/
.th_he{
height:70px;
}

#container_box2 table { width:100%; } 
#container_box2 table th { font-size:20px; font-weight:bold;
							text-align:center; padding:10px; border-bottom:2px solid #333; }
#container_box2 table tr:hover { background:#eee; }
#container_box2 table td { padding:10px; text-align:center; }
#container_box2 table img { width:150px; height:auto; }
</style>

</head>
<body>
<div id="root">
	<header id="header">
		<div id="header_box">
			<%@ include file="../include/header.jsp" %>
		</div>
	</header>

	<nav id="nav">
		<div id="nav_box">
			<%@ include file="../include/nav.jsp" %>
		</div>
	</nav>
	
	<section id="container">
		<aside>
			<%@ include file="../include/aside.jsp" %>
		</aside>
		<div id="container_box2">
				<h3 class="goods_text_2 h_mb">상품 목록</h3>
			<table>
				<thead>
					<tr>
						<th class="th_he">썸네일</th>
						<th>이름</th>
						<th>카테고리</th>
						<th>가격</th>
						<th>수량</th>
						<th>등록날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list">
					<tr>
						<td>
							<img src="${list.gdsThumbImg}">
						</td>
						<td>
							<a href="/company/goods/view?n=${list.gdsNum}">${list.gdsName}</a>
						</td>
						<td>
							<!-- ${list.cateCode} -->
							${list.cateName}
						</td>
						<td>
							<fmt:formatNumber value="${list.gdsPrice}"  pattern="###,###,###"/>
						</td>
						<td>${list.gdsStock}</td>
						<td>
							<fmt:formatDate value="${list.gdsDate}" pattern="yyyy-MM-dd" />
						</td>
					</tr>			
					</c:forEach>
				</tbody>
			</table>
			
		</div>
	</section>


</div>

	<div class="footer">
      <%@ include file="../../include/footer2.jsp"%>
   </div>
</body>
</html>