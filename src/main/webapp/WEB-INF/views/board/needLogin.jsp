<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
   <head>
      <!-- 합쳐지고 최소화된 최신 CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
      <!-- 부가적인 테마 -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       
       <title>게시판</title>
       
   </head>
   
   <body>
      <div class="container">
         <header>
            <h1> 게시판</h1>
         </header>
         <hr />
          
         <div>
            <%@include file="nav.jsp" %>
         </div>
            <c:if test="${member.userId == null}">
               <p>로그인 후에 게시물을 볼 수 있습니다.</p>
            </c:if>
         <hr />
      </div>
   </body>
</html>