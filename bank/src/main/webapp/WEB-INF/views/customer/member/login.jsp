<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>SESbank</title>
	<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
</head>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		$(".btn_login").on('click', function(){
			// 예외처리
			
			$("form").submit();
			return false;
		})
		$(".btn_join").on('click', function(){
			location.href = "join"
			return false;
		})
		$(".btn_findid").on('click', function(){
			location.href = "find_idpw"
			return false;
		})
	})
</script>

<body><!-- 계좌현황서브 -->
	
	<div id="wrap"><!-- wrap -->
		
		<%@include file="../menuTop.jsp"%>

		<div id="contents"><!--내용-->
			<h1>로그인</h1><!-- 내용제목 -->
			<div class="login_area">
				<img src="resources/images/login_icon.png" class="login_icon" />
				<form action="login.do" method="post">
					<ul>
						<li class=""><img src="resources/images/ico_login.png" width="14" /> SE Bank Login</li>
						<li><input type="text" placeholder="아이디" name="custid" class="login_write" /></li>
						<li><input type="password" placeholder="비밀번호" name="password" class="login_write" /></li>
						<li><a class="btn_login">로그인</a></li>
						<li><a class="btn_join">회원가입</a></li>
						<li><a class="btn_findid">아이디 / 비밀번호 찾기</a></li>
					</ul>
				</form>
			</div>
		</div>

		<%@include file="../menuBottom.jsp"%>
		
	</div>
</body>
</html>