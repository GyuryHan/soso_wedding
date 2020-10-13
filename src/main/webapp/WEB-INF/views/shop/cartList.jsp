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
<title>cart_4-1</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/user/cart/cart_4-1.css" type="text/css">
<link rel="stylesheet" href="/resources/css/main/header-footer.css"
	type="text/css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>

<body>
	<div class="container-fluid">
		<%@ include file="../include/header2.jsp"%>
	</div>
	<!--container-fluid-->

	<div class="container">
		<div class="row topInfo">
			<div class="col-sm-6">
				<h3>장바구니</h3>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb">
					<li class="active">장바구니</li>
					<li>주문/결제</li>
					<li>완료</li>
				</ol>
			</div>
		</div>

		<div class="table-responsive">
			<form id="cartform" role="form" method="post">
				<table class="table">
					<thead>
						<tr>
							<th>
								<div class="checkbox">
									<label> <input type="checkbox" name="allCheck"
										id="allCheck"> <span class="cr"><i
											class="cr-icon glyphicon glyphicon-ok"></i></span> <script>
												$("#allCheck")
														.click(
																function() {
																	var chk = $(
																			"#allCheck")
																			.prop(
																					"checked");
																	if (chk) {
																		$(
																				".chBox")
																				.prop(
																						"checked",
																						true);
																	} else {
																		$(
																				".chBox")
																				.prop(
																						"checked",
																						false);
																	}
																});
											</script>
									</label>
								</div>
							</th>
							<th id="kategorie">상품구분</th>
							<th>상품정보</th>
							<th>상품번호</th>
							<th>판매가</th>
							<th>수량</th>
							<th>합계</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="sum" value="0" />
						<c:forEach items="${cartList}" var="cartList" varStatus="status">
							<tr>
								<td class="check">
									<div class="checkbox">
										<label> <input type="checkbox" name="chBox"
											class="chBox" data-cartNum="${cartList.cartNum}"> <span
											class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
										</label>
									</div>
								</td>
								<td class="kategorie"> [${goods[status.index].cateName}]</td>
								<td class="productDescription">
									<div>
										<span class="productThumb"> <img
											src="${cartList.gdsThumbImg}" /></span>
										<div class="names">
											<span class="companyName">${goods[status.index].comName}</span> <span
												class="productName">${cartList.gdsName}_${goods[status.index].comArea}</span>
										</div>
									</div>
								</td>
								<td class="productNum">no.${cartList.gdsNum}</td>
								<td class="price">
									<div>
										<fmt:formatNumber pattern="###,###,###"
											value="${cartList.gdsPrice}" />
										원
									</div>
								</td>
								<td class="count">
									<div class="cartStock">
										<input type="text" class="numBox"
											value="${cartList.cartStock}" readonly="readonly" />개 <input
											type="hidden" value="${view.gdsStock}"
											class="gdsStock_hidden" />
										<script src="/resources/js/user/shop/stockBtn.js"></script>
									</div>
								</td>
								<td class="totalPrice">
									<div>
										<fmt:formatNumber pattern="###,###,###"
											value="${cartList.gdsPrice * cartList.cartStock}" />
										원
									</div>
								</td>
							</tr>
							<c:set var="sum"
								value="${sum + (cartList.gdsPrice * cartList.cartStock)}" />
						</c:forEach>
					</tbody>
				</table>
			</form>

		</div>

		<div class="mbTotal">
			<strong>총 주문금액</strong> <span> <span class="mbTotalPrice"><fmt:formatNumber
						pattern="###,###,###" value="${sum}" /></span> 원
			</span>
		</div>

		<div class="row button">
			<button type="button" class="btn btn-primary btn-lg selectDelete_btn">선택상품삭제</button>
			<a href="/shop/list?c=100&l=1"><button type="button"
					class="btn btn-primary btn-lg">쇼핑계속하기</button></a>
			<button type="button" class="btn btn-primary btn-lg btnOrder" onclick="location.href='/shop/order2' ">선택상품주문</button>
		</div>
		<script>
			$(".selectDelete_btn").click(function() {
				var confirm_val = confirm("정말 삭제하시겠습니까?");

				if (confirm_val) {
					var checkArr = new Array();

					// 체크된 체크박스의 갯수만큼 반복
					$("input[class='chBox']:checked").each(function() {
						checkArr.push($(this).attr("data-cartNum")); // 배열에 데이터 삽입
					});

					$.ajax({
						url : "/shop/deleteCart",
						type : "post",
						data : {
							chbox : checkArr
						},
						success : function(result) {

							if (result == 1) {
								location.href = "/shop/cartList";
							} else {
								alert("삭제 실패");
							}
						}
					});
				}
			});
		</script>

	</div>
	<!--container-->

	<!-- footer -->
	<div class="footer">
		<%@ include file="../include/footer2.jsp"%>
	</div>
	<!--footer-->


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</body>

</html>