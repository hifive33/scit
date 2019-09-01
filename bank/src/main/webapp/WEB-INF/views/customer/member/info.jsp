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
		$(".select").on('click', function(){
			$("form").submit();
			return false;
		})
	})
</script>

<body><!-- 계좌현황서브 -->
	
	<div id="wrap"><!-- wrap -->
		
		<%@include file="../menuTop.jsp"%>

		<div id="contents"><!--내용-->
			<h1>회원정보 수정<span></span></h1><!-- 내용제목 -->
			<div >
				<form action="info.do" method="post">
					<ul class="member_info"><!-- 회원가입 -->
									
						<li><label for="" id="" >회원구분</label><input type="radio" name="division" value="personal" checked /> 개인 <input type="radio" name="division" value="company" /> 법인</li>
						<li><label for="wr_id">아이디</label><input type="text" id="wr_id" value="${sessionScope.loginId}" name="custid" class="login_write" readonly="readonly" /></li>
						<li><label for="wr_pass">비밀번호</label><input type="password" id="wr_pass" name="password" class="login_write" /></li>
						<li><label for="wr_passchk">비밀번호 확인</label><input type="password" id="wr_passchk" class="login_write" /></li>
						<li><label for="wr_name">이름</label><input type="text" id="wr_name" name="name" value="${sessionScope.loginName}" class="login_write" /></li>
						<li><label for="wr_birnum">주민(사업자)번호</label><input type="text" id="wr_birnum" value="${sessionScope.loginIdno}" name="idno" class="login_write" readonly="readonly" /></li>
						<li><label for="wr_email">이메일</label><input type="email" id="wr_email" name="email" value="${sessionScope.loginEmail}" class="login_write" /></li>
						<li><label for="wr_address">주소</label><input type="text" id="wr_address" name="address" value="${sessionScope.loginAddress}" class="login_write" /></li>
						
					</ul>
								
					
				</form>
				<p class="list_btn">
						<a class="select">회원정보수정</a>
				</p>	
			</div>


		</div>

		<%@include file="../menuBottom.jsp"%>
		
	</div>
</body>
</html>