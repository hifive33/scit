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
		$("#navi>.gnb>ul>li:nth-child(2)>a").attr("class","select")
		$("#setaccount").on('click', function(){
			$.ajax({
				method:'get'
				,url:'setaccount'
				,success:function(res){
					$("input[name=accountno]").val(res)
				}
			})
		})
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
			<h1>신규계좌 개설<span>예금계좌정보를 입력해 주세요</span></h1><!-- 내용제목 -->
			<form action="addaccount.do" method="post">
				<ul class="basic_list">
					<!-- 예금계좌 -->
					
					<li><span>&#47; 계좌구분</span>예금계좌<input type="hidden" name="accounttype" value="checking" /></li>
					<li><span>&#47; 계좌번호</span><input type="text" name="accountno" class="wr_account" placeholder="2354-258-25891" /> <a id="setaccount">계좌번호 발급</a></li>
					<li><span>&#47; 초기잔고</span><input type="text" name="balance" class="wr_account" /></li>
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