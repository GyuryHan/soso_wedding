<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="/resources/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/resources/assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>회원관리</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
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
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="/resources/assets/css/themify-icons.css" rel="stylesheet">
 <script src="http://code.jquery.com/jquery-1.11.0.js"></script>

    <style>
    
       div#btns{
         text-align:center;
        margin-left: 5px;
        margin-top: 25px;

        }
        div#paging{
        text-align:center;
        }
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

        div#container_box {
            float: inherit;
           /* width: calc(100% - 200px - 20px); */
              margin-left: 55px;
              width: 100%;
        }

        #container_box table {
            width: 95%;
        }

        #container_box table th {
            font-size: 18px;
            text-align: center;
            padding: 10px;
            border-bottom: 2px solid rgb(204, 129, 32);
            color: #946e2e;
        }

        #container_box table tr:hover {
            background: #e3d9c8;
        }

        #container_box table td {
            padding: 10px;
            text-align: center;
        }

        #container_box table img {
            width: 150px;
            height: auto;
        }

        div#paging{
            text-align:center;
        }

        #btn{
            border-color: #c9a563;
            color: #4f3811;
            border-radius: 20px;
            box-sizing: border-box;
            border-width: 2px;
            /* background-color: #e3c58d; */
            font-size: 14px;
            font-weight: 500;
            padding: 5px 12px;
            }
         .selectalign{
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
            padding: 4px 15px;
        }
         select#selSearchOption{
         height:26px;
         }
        
        #txtKeyWord{
         height:26px;
                  }
        
    </style>

    <script type="text/javascript">
        function del(seq) {
            var chk = confirm("정말 삭제하시겠습니까?");
            if (chk) {
                location.href = 'delete?gdsNum=' + seq;
            }
        }
        function com(seq) {
            var chk = confirm("정말 승인하시겠습니까?");
            if (chk) {
                location.href = 'update2?gdsNum=' + seq;
            }
        }
        function can(seq) {
            var chk = confirm("정말 취소하시겠습니까?");
            if (chk) {
                location.href = 'update3?gdsNum=' + seq;
            }
        }   
    </script>
</head>

<body>
		<div class="wrapper">
        <div class="sidebar" data-background-color="white" data-active-color="danger">
     <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="/admin2/index" class="simple-text">
                        SOSO WEDDING ADMIN
                    </a>
                </div>

                <ul class="nav">
                    <li>
                        <a href="/admin2/index">
                            <i class="ti-panel"></i>
                            <p>MAIN</p>
                        </a>
                    </li>
                    <li>
                        <a href="/admin2/goods/notices">
                            <i class="ti-bell"></i>
                            <p>공지사항</p>
                        </a>
                    </li>

                    <li>
                        <a href="/admin2/qna/qnaList">
                            <i class="ti-pencil-alt2"></i>
                            <p>Q & A</p>
                        </a>
                    </li>

                    <li><li class="active">
                        <a href="/admin2/goods/list">
                            <i class="ti-map"></i>
                            <p>상품승인</p>
                        </a>
                    </li>

                    <li>
                        <a href="/admin2/goods/boardList">
                            <i class="ti-text"></i>
                            <p>자유게시판</p>
                        </a>
                    </li>

                    <li>
                        <a href="/admin2/goods/user">
                            <i class="ti-user"></i>
                            <p>회원정보</p>
                        </a>
                    </li>
                    <li>
                        <a href="/admin2/goods/company">
                            <i class="ti-view-list-alt"></i>
                            <p>기업정보</p>
                        </a>
                    </li>
                     <li>
                        <a href="/admin2/review">
                            <i class="ti-view-list-alt"></i>
                            <p>후기게시판</p>
                        </a>
                    </li>

                </ul>
            </div>
        </div>


        <div class="main-panel">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar bar1"></span>
                            <span class="icon-bar bar2"></span>
                            <span class="icon-bar bar3"></span>
                        </button>
                        <a class="navbar-brand" href="#">PERMISSION</a>
                    </div>

                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-right">
                             <li>
                                <a href="/">
                                    <i class="ti-panel"></i>
                                    <p>일반화면</p>
                                </a>
                            </li>
                            <li>
                                <a href="/member/signout">
                                    <i class="ti-settings"></i>
                                    <p>로그아웃</p>
                                </a>
                            </li>
                        </ul>

                    </div>

                </div>
            </nav>


            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="header">
                                    <h4 class="title">상품 승인</h4>
                                    <p class="category">업체에서 등록한 상품을 승인해주세요</p>
                                </div>
                                <div class="content table-responsive table-full-width">
                                    <div id="container_box">
                                        <!--  <h2>상품 목록</h2> -->
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th>썸네일</th>
                                                    <th>이름</th>
                                                    <th>카테고리</th>
                                                    <th>가격</th>
                                                    <th>수량</th>
                                                    <th>등록날짜</th>
                                                    <th>승인여부</th>
                                                </tr>
                                            </thead>
										<c:forEach items="${list}" var="list">
                                            <tbody>
                                        <tr>
                                            <td>
                                                <img src="${list.gdsThumbImg}">
                                            </td>
                                            <td>
                                                <a href="/admin2/goods/view?n=${list.gdsNum}">${list.gdsName}</a>
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
                                            <td><c:if test="${list.tnf eq 'T'}">
    											승인
												</c:if>
												<c:if test="${list.tnf eq 'F'}">
    											미승인
												</c:if>
												</td>
                                            <td>
                                                </tr>
											 </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

<!-- 검색 폼 영역 -->
			<div id="btns">
				<div class="t1">
					<div class="selectalign">
						<select id="selSearchOption" name="searchType">
							<option value="n"
								<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
							<option value="t"
								<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>상품명</option>
							<option value="c"
								<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>업체명</option>
							<option value="w"
								<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>카테고리</option>
							<option value="tc"
								<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>상품명+업체명 </option>
						</select> <input type="text" name="keyword" id="txtKeyWord"
							value="${scri.keyword}" /> <input type='button' class="text_w"
							value='검색' class="p1" id="searchBtn">
						<script>
							$(function() {
								$('#searchBtn')
										.click(
												function() {
													self.location = "list"
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
			</div>
                            </div>




                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 




</body>

<!--   Core JS Files   -->
<script src="/resources/assets/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="/resources/assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script src="/resources/assets/js/bootstrap-checkbox-radio.js"></script>

<!--  Charts Plugin -->
<script src="/resources/assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="/resources/assets/js/bootstrap-notify.js"></script>

<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>

<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
<script src="/resources/assets/js/paper-dashboard.js"></script>

<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
<script src="/resources/assets/js/demo.js"></script>


</html>