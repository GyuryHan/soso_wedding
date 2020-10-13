<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>kubg Admin</title>

<script src="/resources/jquery/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="/resources/bootstrap/bootstrap-theme.min.css">
<script src="/resources/bootstrap/bootstrap.min.js"></script>

<style>
body {
	font-family: '맑은 고딕', verdana;
	padding: 0;
	margin: 0;
}

ul {
	padding: 0;
	margin: 0;
	list-style: none;
}

div#root {
	width: 90%;
	margin: 0 auto;
}

header#header {
	font-size: 60px;
	padding: 20px 0;
}

header#header h1 a {
	color: #000;
	font-weight: bold;
}

nav#nav {
	padding: 10px;
	text-align: right;
}

nav#nav ul li {
	display: inline-block;
	margin-left: 10px;
}

section#container {
	padding: 20px 0;
	border-top: 2px solid #eee;
	border-bottom: 2px solid #eee;
}

section#container::after {
	content: "";
	display: block;
	clear: both;
}

aside {
	float: left;
	width: 200px;
}

div#container_box {
	float: right;
	width: calc(100% - 200px - 20px);
}

aside ul li {
	text-align: center;
	margin-bottom: 10px;
}

aside ul li a {
	display: block;
	width: 100%;
	padding: 10px 0;
}

aside ul li a:hover {
	background: #eee;
}

footer#footer {
	background: #f9f9f9;
	padding: 20px;
}

footer#footer ul li {
	display: inline-block;
	margin-right: 10px;
}
</style>


<style>
.inputArea {
	margin: 10px 0;
}

select {
	width: 100px;
}

label {
	display: inline-block;
	width: 70px;
	padding: 5px;
}

label[for='gdsDes'] {
	display: block;
}

input {
	width: 150px;
}

textarea#gdsDes {
	width: 400px;
	height: 180px;
}

.oriImg {
	width: 1500px;
	height: auto;
}

.thumbImg {
	
}

.gdsDes img {
	max-width: 600px;
	height: auto;
}
</style>

</head>
<body>
	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp"%>
			</div>
		</header>

		<nav id="nav">
			<div id="nav_box">
				<%@ include file="../include/nav.jsp"%>
			</div>
		</nav>

		<section id="container">
			<aside>
				<%@ include file="../include/aside.jsp"%>
			</aside>
			<div id="container_box">
				<h2>상품 조회</h2>

				<form role="form" method="post" autocomplete="off">

					<input type="hidden" name="n" value="${goods.gdsNum}" />

					<div class="inputArea">
						<label>1차 분류</label> <span class="category1"></span> <label>2차
							분류</label> <span class="category2">${goods.cateCode}</span>
					</div>

					<div class="inputArea">
						<label for="gdsName">상품명</label> <span>${goods.gdsName}</span>
					</div>

					<div class="inputArea">
						<label for="gdsPrice">상품가격</label> <span><fmt:formatNumber
								value="${goods.gdsPrice}" pattern="###,###,###" /></span>
					</div>

					<div class="inputArea">
						<label for="gdsStock">상품수량</label> <span>${goods.gdsStock}</span>
					</div>

					<div class="inputArea">
						<label for="gdsDes">상품소개</label>

						<!--  <span>${goods.gdsDes}</span>  -->

						<div class="gdsDes">${goods.gdsDes}</div>

					</div>
					<div class="inputArea">
						<label for="comName">업체명</label> <span>${goods.comName} </span>

					</div>
					<div class="inputArea">
						<label for="comSubway">인근 지하철</label> <span>${goods.comSubway}
						</span>
					</div>
					<div class="inputArea">
						<label for="comArea">지역</label> <span>${goods.comArea}</span>
					</div>
					<c:choose>
						<c:when test="${goods.cateCode == 101}">
							<div class="inputArea">
								<label for="h_type">홀타입</label> <span>${weddingvo.h_type}</span>
							</div>
							<div class="inputArea">
								<label for="oddnum">홀수</label> <span>${weddingvo.oddnum}</span>
							</div>
							<div class="inputArea">
								<label for="seat">좌석수(인원)</label> <span>${weddingvo.seat}</span>
							</div>
							<div class="inputArea">
								<label for="w_type">예식타입</label> <span>${weddingvo.w_type}</span>
							</div>
							<div class="inputArea">
								<label for="m_menu">식사메뉴</label> <span>
									${weddingvo.m_menu}</span>
							</div>
							<div class="inputArea">
								<label for="comArea">식사비용</label> <span>
									${weddingvo.m_cost}</span>
							</div>
						</c:when>
						<c:when test="${goods.cateCode == 102}">
							<div class="inputArea">
								<label for="d_type">드레스타입</label> <span>${dressvo.d_type}</span>
							</div>
							<div class="inputArea">
								<label for="mater">소재</label> <span>${dressvo.mater}</span>
							</div>
							<div class="inputArea">
								<label for="d_size">사이즈</label> <span>${dressvo.d_size}</span>
							</div>
							<div class="inputArea">
								<label for="d_concept">드레스컨셉</label> <span>${dressvo.d_concept}</span>
							</div>
							<div class="inputArea">
								<label for="w_shoewh">웨딩슈즈</label> <span>
									${dressvo.w_shoewh}</span>
							</div>
							<div class="inputArea">
								<label for="as_wh">A/S</label> <span>
									${dressvo.as_wh}</span>
							</div>
						</c:when>
						<c:when test="${goods.cateCode == 103}">
							<div class="inputArea">
								<label for="hair_ch">헤어담당</label> <span>${hairmakeupvo.hair_ch}</span>
							</div>
							<div class="inputArea">
								<label for="makeup_ch">메이크업답당</label> <span>${hairmakeupvo.makeup_ch}</span>
							</div>
							<div class="inputArea">
								<label for="nailart_wh">네일아트</label> <span>${hairmakeupvo.nailart_wh}</span>
							</div>
							<div class="inputArea">
								<label for="formula">예식타입</label> <span>${hairmakeupvo.formula}</span>
							</div>
						</c:when>
						<c:when test="${goods.cateCode == 104}">
							<div class="inputArea">
								<label for="r_num">룸 갯수</label> <span>${studiovo.r_num}</span>
							</div>
							<div class="inputArea">
								<label for="seat">인원</label> <span>${studiovo.seat}</span>
							</div>
							<div class="inputArea">
								<label for="cam_rent_wh">카메라대여</label> <span>${studiovo.cam_rent_wh}</span>
							</div>
							<div class="inputArea">
								<label for="lens_rent_wh">렌즈대여</label> <span>${studiovo.lens_rent_wh}</span>
							</div>
							<div class="inputArea">
								<label for="pet_comp_wh">반려동물</label> <span>
									${studiovo.pet_comp_wh}</span>
							</div>
							<div class="inputArea">
								<label for="night_comp_wh">야간촬영</label> <span>
									${studiovo.night_comp_wh}</span>
							</div>
						</c:when>
						<c:when test="${goods.cateCode == 105}">
							<div class="inputArea">
								<label for="prod_comp">상품구성</label> <span>${snapshotdvdvo.prod_comp}</span>
							</div>
							<div class="inputArea">
								 <label for="shooting_step">촬영스탭</label> <span>${snapshotdvdvo.shooting_step}</span>
							</div>
							<div class="inputArea">
								<label for="shooting_eq">촬영장비</label> <span>${snapshotdvdvo.shooting_eq}</span>
							</div>
							<div class="inputArea">
								<label for="runtime">러닝타임</label> <span>${snapshotdvdvo.runtime}</span>
							</div>
							<div class="inputArea">
								<label for="prod_proc">제작과정</label> <span>
									${snapshotdvdvo.prod_proc}</span>
							</div>
						</c:when>
						<c:when test="${goods.cateCode == 106}">
							<div class="inputArea">
								<label for="prod_comp">상품구성</label> <span>${mendressvo.prod_comp}</span>
							</div>
							<div class="inputArea">
								<label for="manufacturer">제조사</label> <span>${mendressvo.manufacturer}</span>
							</div>
							<div class="inputArea">
								<label for="mater">소재</label> <span>${mendressvo.mater}</span>
							</div>
							<div class="inputArea">
								<label for="c_r_wh">맞춤/대여</label> <span>${mendressvo.c_r_wh}</span>
							</div>
							<div class="inputArea">
								<label for="rent_per">대여기간</label> <span>
									${mendressvo.rent_per}</span>
							</div>
							<div class="inputArea">
								<label for="prod_per">제작기간</label> <span>
									${mendressvo.prod_per}</span>
							</div>
						</c:when>
						<c:when test="${goods.cateCode == 107}">
							<div class="inputArea">
								<label for="prod_comp">상품구성</label> <span>${hanbokgvo.prod_comp}</span>
							</div>
							<div class="inputArea">
								<label for="rent_purch_method">대여구매방법</label> <span>${hanbokgvo.rent_purch_method}</span>
							</div>
							<div class="inputArea">
								<label for="retrun_collect_method">수령반납방법</label> <span>${hanbokgvo.retrun_collect_method}</span>
							</div>
							<div class="inputArea">
								<label for="fitting_cost">피팅비</label> <span>${hanbokgvo.fitting_cost}</span>
							</div>
							<div class="inputArea">
								<label for="as_wh">A/S</label> <span>
									${hanbokgvo.as_wh}</span>
							</div>
						</c:when>
						<c:when test="${goods.cateCode == 108}">
							<div class="inputArea">
								<label for="prod_comp">상품구성</label> <span>${bouquetgvo.prod_comp}</span>
							</div>
							<div class="inputArea">
								<label for="standard">규격</label> <span>${bouquetgvo.standard}</span>
							</div>
							<div class="inputArea">
								<label for="mater">소재</label> <span>${bouquetgvo.mater}</span>
							</div>
							<div class="inputArea">
								<label for="color">색상</label> <span>${bouquetgvo.color}</span>
							</div>
							<div class="inputArea">
								<label for="sale_ava_time">판매가능시기</label> <span>
									${bouquetgvo.sale_ava_time}</span>
							</div>
						</c:when>
						<c:when test="${goods.cateCode == 109}">
							<div class="inputArea">
								<label for="prod_comp">상품구성</label> <span>${invitvo.prod_comp}</span>
							</div>
							<div class="inputArea">
								<label for="prod_per">제작기간</label> <span>${invitvo.prod_per}</span>
							</div>
							<div class="inputArea">
								<label for="standard">규격</label> <span>${invitvo.standard}</span>
							</div>
							<div class="inputArea">
								<label for="m_invit">모바일청첩장</label> <span>${invitvo.m_invit}</span>
							</div>
							<div class="inputArea">
								<label for="i_concept">컨셉</label> <span>
									${invitvo.i_concept}</span>
							</div>
						</c:when>
						<c:otherwise>
							<p style="font-color: red">조건에 해당하지 않습니다</p>
						</c:otherwise>
					</c:choose>


					<div class="inputArea">
						<label for="gdsImg">이미지</label>
						<p>원본 이미지</p>
						<img src="${goods.gdsImg}" class="oriImg" />

						<p>썸네일</p>
						<img src="${goods.gdsThumbImg}" class="thumbImg" />
					</div>

					<div class="inputArea">
						<button type="button" id="modify_Btn" class="btn btn-warning">수정</button>
						<button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>

						<script>
							var formObj = $("form[role='form']");

							$("#modify_Btn").click(function() {
								formObj.attr("action", "/admin/goods/modify");
								formObj.attr("method", "get")
								formObj.submit();
							});

							$("#delete_Btn").click(
									function() {

										var con = confirm("정말로 삭제하시겠습니까?");

										if (con) {
											formObj.attr("action",
													"/admin/goods/delete");
											formObj.submit();
										}
									});
						</script>
					</div>

				</form>

			</div>
		</section>

		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp"%>
			</div>
		</footer>

	</div>

</body>
</html>