<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>SESbank</title>
	<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		$("#navi>.gnb>ul>li:nth-child(3)>a").attr("class","select")
		date()
		$("#btn_write").on('click',function(){
			$("form").submit();
		})
	})
	
	function date(){
		var st_date = new Date().toISOString().substr(0, 10).replace('T', ' ');
		$("#today").html(st_date);
	
	}
</script>
</head>

<body><!-- 계좌현황서브 -->
	
	
	<div id="wrap"><!-- wrap -->
		
		<%@include file="../menuTop.jsp"%>

		<div id="contents"><!--내용-->
			<h1>고객문의 게시판<span></span></h1><!-- 내용제목 -->
			<form action="board_write.do" method="post" enctype="multipart/form-data">
				<table class="wr_board">
					<tr>
						<th>작성자</th>
						<td><input type="hidden"name="custid" value="${sessionScope.loginId}"/>${sessionScope.loginId}</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td id="today"></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title"/></td>
					</tr>
					<tr>
						<th colspan="2" >내용</th>
					</tr>
					<tr>
						<td colspan="2" ><textarea name="content"></textarea></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="file" name="upload"/></td>
					</tr>
				</table>
			</form>
			<p class="list_btn">
				<a href="board_list">취소</a>
				<a href="#" class="select" id="btn_write">등록</a>
			</p>
		</div>
		
		<%@include file="../menuBottom.jsp"%>

	</div>

</body>
</html>