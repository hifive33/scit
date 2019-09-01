<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>SESbank</title>
	<link rel="stylesheet" type="text/css" href="../resources/css/style.css" />
<script src="../resources/js/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		$("a[href=addaccount]").attr("class","select")
	})
	function accountOpen(){
		$("form").submit()
	}
</script>
</head>

<body><!-- 계좌현황서브 -->
	
	
	<div id="wrap"><!-- wrap -->
		
		<%@include file="../menuTop.jsp"%>

		<div id="contents"><!--내용-->
			<h1>신규계좌 개설<span>적금계좌정보를 입력해 주세요</span></h1><!-- 내용제목 -->
			<form action="addaccount.do" method="post">
				<ul class="basic_list">
					<!-- 적금계좌 -->
					<li><span>&#47; 계좌구분</span>적금계좌<input type="hidden" name="accounttype" value="saving" /></li>
					<li><span>&#47; 계좌번호</span><input type="text" name="accountno" class="wr_account" placeholder="2354-258-25891" /> <!-- <a href="#">계좌번호 발급</a> --></li>
					<li><span>&#47; 월 납입금</span><input type="text" name="payment" class="wr_account" /></li>
					<li><span>&#47; 납입기간</span><input type="radio" name="years" value="1" checked />1년 <input type="radio" name="years" value="2" />2년 <input type="radio" name="years" value="3" />3년</li>
					<li><span>&#47; 이율</span><input type="text" name="interest" class="wr_account" /></li>
				</ul>
			</form>
			<p class="list_btn">
				<a href="" onclick="accountOpen(); return false;" class="select">계좌개설</a>
			</p>
			<p class="extext">
			※ 대출계좌는 승인 완료 후 계좌현황에서 확인하실 수 있습니다
			</p>


		</div>

		<%@include file="../menuBottom.jsp"%>

	</div>

</body>
</html>