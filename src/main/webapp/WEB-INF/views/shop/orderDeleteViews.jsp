

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
<title>mypage3</title>

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/user/order/mypage3.css">
<link rel="stylesheet" href="/resources/css/main/header-footer.css">
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
 <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">

</head>

<body>
	<div class="container-fluid">
		<%@ include file="../include/header2.jsp"%>
	</div>

	<div class="container">
		<div class="row all_wrap">
			<div class="col-sm-3 side_wrap">
				<h2>마이페이지</h2>
				<ul class="nav nav-pills nav-stacked">
					<li role="presentation"><a href="#">장바구니</a></li>
					<li role="presentation" ><a href="/shop/orderList">주문리스트</a></li>
					 <li role="presentation" class="active"><a href="/shop/orderDeleteViews">주문취소내역</a></li>
					<li role="presentation"><a href="#">내정보수정</a></li>
					<li role="presentation"><a href="#">회원탈퇴</a></li>
				</ul>
			</div>

			<div class="col-sm-9 rightWrap">
				<div class="row">
					<div class="col-sm-12">
						<h3>취소내역 확인</h3>

						<div class="content_wrap">
							<div class="orderTable">
								<h4 class="odTitle">
									주문번호<span>20200702385323</span>
								</h4>
								<table>
									<thead>
										<th class="productDescription">상품정보</th>
										<th class="productPrice">상품금액(수량)</th>
										<th class="compayInfo">판매자</th>
									</thead>
									<tbody>
										<td class="productDescription">
											<div>
												<span class="productThumb"><img src="/resources/images/main/hair/hair4.jpg"></span>
												<div class="names">
													<p class="kategorie">
														[메이크업]</span><span class="companyName">웜메이크업
													</p>
													<p class="productName">웜메이크업_서울</p>
													<p>  ㄴ   외 2건  </p>
												</div>
											</div>
										</td>
										<td class="productPrice">
											<div>350,000원</div>
											<div id="gray">(1개)</div>
										</td>
										<td class="compayInfo">
											<div>웜메이크업</div>
											<div id="gray">02)4443-2231</div>
										</td>
									</tbody>
								</table>
							</div>
						</div>
						<!--content_wrap-->
					</div>
					<!--col-sm-12-->
				</div>
				<!--row-->
			</div>
			<!--col-sm-9-->
		</div>
		<!--row -->
	</div>
	<!--container-->








	<div class="footer">
		<%@ include file="../include/footer2.jsp"%>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script>
		// 검색창 show, hide
		$(document).ready(function() {
			$(".headerSearch1").click(function() {
				$(".fullSearch").slideToggle("slideUp");
			});

			$(".searchClose").click(function() {
				$(".fullSearch").slideToggle("slideDown");
			});
		});

		// 사이드바
		$(document).ready(function() {
			$(".side_wrap li").click(function() {
				var menu = $(".side_wrap li");
				menu.removeClass("active");
				$(this).addClass("active");
			});
		})

		// 모달
		$('#myModal_cancel').modal();
	</script>
</body>

</html>




