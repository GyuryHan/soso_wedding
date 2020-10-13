<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<title>kubg Admin</title>
	
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
<link rel="stylesheet" href="/resources/css/company/c_main.css">
<script src="/resources/bootstrap/bootstrap.min.js"></script>
<script src="/resources/js/company/scroll.js"></script>

<script src="/resources/js/company/menu_fixed.js"></script>
	<link rel="stylesheet" href="/resources/css/main/header-footer.css">



<style>
body{
padding-top:0;
}
/*
#container_box table { width:900px; } 
#container_box table th { font-size:20px; font-weight:bold;
							text-align:center; padding:10px; border-bottom:2px solid #666; }
#container_box table tr:hover { background:#eee; }
#container_box table td { padding:10px; text-align:center; }
#container_box table img { width:150px; height:auto; }
*/
	div#container_box2 ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
	div#container_box2 .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
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
		<h3 class="goods_text_2">주문 목록</h3>
		<ul class="orderList">
				<c:forEach items="${orderList}" var="orderList">
				<li>
				<div>
					<p><span>주문번호</span><a href="/company/shop/orderView?n=${orderList.orderId}">${orderList.orderId}</a></p>
					<p><span>주문자</span>${orderList.userId}</p>
					<p><span>수령인</span>${orderList.orderRec}</p>
					<p><span>주소</span>(${orderList.userAddr1}) ${orderList.userAddr2} ${orderList.userAddr3}</p>
					<p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" /> 원</p>
				</div>
				</li>
				</c:forEach>
			</ul>
			
		</div>
	</section>

	<div class="footer">
      <%@ include file="../../include/footer2.jsp"%>
   </div>

</div>

</body>
</html>