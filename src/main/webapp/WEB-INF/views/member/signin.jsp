<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
 <link rel="stylesheet" href="/resources/css/login/login.css" type="text/css">

<html>
<head>
   <title>kubg</title>
</head>
<!-- 카카오 추가  -->
<script src='https://developers.kakao.com/sdk/js/kakao.min.js'></script>
<body>
    <div class="main">
        <section class="login">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="/resources/images/login/login.jpg" alt="sing up image"></figure>
                        <button type="button" class="btn btn-default pull-right joinBtn" onclick="location.href='/member/register'">
                                <span class="glyphicon glyphicon-hand-right"></span> 회원가입</button>
                    </div>
                    <div class="signin-form">
                        <h2 class="form-title">Login</h2>
                        <form method="POST" class="register-form" id="login-form">
                            <div class="form-group">
                                <input type="text" name="userId" id="userId" required="required" placeholder="ID" />
                            </div>
                            <div class="form-group">
                                <input type="password" name="userPass" id="userPass" required="required"
                                    placeholder="Password"/>
                                <c:if test="${msg == false}">
                                    <p style="color:#f00;">존재하지않는 아이디이거나 비밀번호가 틀립니다.</p>
                                </c:if>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signin_btn" id="signin_btn" value="로그인" />
                                <button type="button" id="signin_cancel" onclick="location.href='/'">취소</button>
                            </div>
                        </form>
                       <div class="socials">
							<a href="https://kauth.kakao.com/oauth/authorize?client_id=50a9be3a49b8a6fa37a35fdad85aae49&redirect_uri=http://localhost:10001/oauth&response_type=code">
                            	<img src="/resources/images/register/Kakao.jpg"></a>
                            <a href="#"><img src="/resources/images/register/naver.jpg"></a>
                            <a href="#"><img src="/resources/images/register/facebook.jpg"></a>
							</div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>