<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>SESbank</title>
	<link rel="stylesheet" type="text/css" href="resources/css/style.css" />

</head>
<body>

<div class="popwrap">

<h2>ID중복확인</h2>
	<div style="display:none;">
		[<span>test1</span>] 아이디는 사용가능합니다.
		<p class="list_btn">
		<a href="#">적용</a>
		</p>
	</div>
	<div style="display:;">
		[<span>test1</span>] 아이디는 이미 사용중입니다.
		<p class="list_btn">
		<input type="text" class="wr_idcheck" /> <a href="#">중복확인</a>
		</p>
	</div>
</div>

</body>
</html>