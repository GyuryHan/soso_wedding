<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>kubg Admin</title>
	
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
<script src="/resources/bootstrap/bootstrap.min.js"></script>
	
<style>
*{
margin:0;
}
	body { font-family:'맑은 고딕', verdana; padding:0; margin:0; font-size:14px;}
	ul { padding:0; margin:0; list-style:none;  }
 
	div#root { width:100%; margin:0 auto; }
	
	header#header { font-size:60px; padding:20px 0; bakcground-color:#333333;}
	header#header h1 a { color:#fff; font-weight:bold; }
	
	nav#nav { padding:10px; text-align:right; }
	nav#nav ul li { display:inline-block; margin-left:10px; }
 
 		section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
	section#container::after { content:""; display:block; clear:both; }
	aside { float:left; width:200px; }
	div#container_box { float:right; width:calc(100% - 200px - 20px); }
	
	aside ul{
	background:#eee;
	padding:10px 0 10px 0;
	}
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0; color:#666;}
	aside ul li a:hover {  color:#666;}
	
	footer#footer { background:#f9f9f9; padding:20px; }
	footer#footer ul li { display:inline-block; margin-right:10px; } 
	.goods{
	background: url(/resources/images/admin/register/icon_menu_goods.png) center 0px no-repeat;
	vertical-algin:bottom;
}


.goods_text{
padding: 52px 0px 10px 0px;
font-weight:bold;
margin:0;
}

.li_title{
background:#6E7074;
height:35px;
line-height:2.5em;
text-align:left;
padding-left:20px;
}

.li_content{
height:35px;

text-align:left;
padding-left:20px;
}
.li_title span{

color:#fff;
font-weight:600;
}
</style>
		 
</head>
<body>
<div id="root">
	<header id="header">
		<div id="header_box">
			<%@ include file="include/header.jsp" %>
		</div>
	</header>
	
	<nav id="nav">
		<div id="nav_box">
			<%@ include file="include/nav.jsp" %>
		</div>
	</nav>
	
	<section id="container">
		<aside>
			<%@ include file="include/aside.jsp" %>
		</aside>
		<div id="container_box">
			본문 영역
		</div>
	</section>

	<footer id="footer">
		<div id="footer_box">
			<%@ include file="include/footer.jsp" %>
		</div>		
	</footer>

</div>
</body>
</html>
