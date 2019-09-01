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
	$("#header > a[href=board_list]").attr("class","select")
	$("#delete").on('click',function(){
		var replytext = $(".adm_board tr td").html().trim()
		if(replytext!=''){
			alert("삭제할 수 없습니다.")
			return false;
		}
	})
})
</script>
</head>

<body><!-- 계좌현황서브 -->
	
	
	<div id="wrap"><!-- wrap -->
		
		<%@include file="../menuTop.jsp"%>

		<div id="contents"><!--내용-->
			<h1>고객문의 게시판<span></span></h1><!-- 내용제목 -->
			
			<table class="vw_board">
				<tr>
					<th>작성자</th>
					<td>${result.custid}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${result.regdate}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${result.title}</td>
				</tr>
				<tr>
					<th colspan="2">내용</th>
				</tr>
				<tr>
					<td colspan="2" class="table_contents">
					<pre>${result.content}</pre>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
					<c:if test="${result.originalfile != null }">
						<a href="download?boardno=${result.boardno}">
							${result.originalfile} </a>
					</c:if>
					<c:if test="${result.originalfile == null }">
						첨부된 파일이 없습니다.
					</c:if>
					</td>
				</tr>
			</table>
			
			<table class="adm_board">
				<tr>
					<th>ㄴ관리자<br />
					<span>(${result.repdate})</span>
					</th>
					<td>
					${result.replytext}
					</td>
				</tr>
			</table>
			
			<p class="list_btn">
			<c:if test="${sessionScope.loginId==result.custid}">
				<a href="board_update?boardno=${result.boardno}">수정</a>
				<a href="board_delete?boardno=${result.boardno}" id="delete">삭제</a>
			</c:if>
				<a href="board_list" class="select">목록</a>
			</p>
		</div>
		
		<%@include file="../menuBottom.jsp"%>

	</div>

</body>
</html>