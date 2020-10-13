<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
	li {list-style: none; display:inline; padding: 6px;}
</style>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<ul>
	<li><a href="/">홈페이지</a></li>
	<li><a href="/reviewboard/writeView">글 작성</a></li>
	<li>
		<c:if test="${member != null}"><a href="/member/signout">로그아웃</a></c:if>
		<c:if test="${member == null}"><a href="/member/signin">로그인</a></c:if>
	</li>
	<li>
		<c:if test="${member != null}">
			<p>${member.userId}님 안녕하세요.</p>
		</c:if>
	</li>
</ul>