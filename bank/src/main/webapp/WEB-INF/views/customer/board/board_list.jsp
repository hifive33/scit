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
	$("#btn_list").on("click",function(){
		$("#listform").submit();
	})
})
</script>
</head>

<body><!-- 계좌현황서브 -->
	
	
	<div id="wrap"><!-- wrap -->
		
		<%@include file="../menuTop.jsp"%>

		<div id="contents"><!--내용-->
			<h1>고객문의 게시판<span></span></h1><!-- 내용제목 -->
			
			<table>
				<tr>
					<th>No.</th>
					<th>문의내용</th>
					<th>일자</th>
					<th>작성자</th>
					<th>조회수</th>
				</tr>
				<c:forEach var="item" items="${list}" varStatus="stat">
				<tr>
					<td>${stat.count + navi.startRecord}</td>
					<td  class="board_title"><a href="board_view?boardno=${item.boardno}">${item.title}</a></td>
					<td>${item.regdate}</td>
					<td>${item.custid}</td>
					<td>${item.hitcount}</td>
				</tr>
				</c:forEach>
			</table>
			<p class="paging">
				<a href="board_list?currentPage=${navi.currentPage-navi.pagePerGroup} &searchItem=${searchItem}&searchWord=${sesarchWord}">&lt;</a>
				${navi.startPageGroup > 2 ? '...' : ''}
				<c:forEach var="page" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
					<a ${navi.currentPage == page ? 'class="select"' : ''}
					href="board_list?currentPage=${page}&searchItem=${searchItem}&searchWord=${sesarchWord}">${page}</a>
				</c:forEach>
				${navi.endPageGroup < navi.totalPageCount ? '...' : ''}
				<a href="board_list?currentPage=${navi.currentPage+navi.pagePerGroup} &searchItem=${searchItem}&searchWord=${sesarchWord}">&gt;</a>
				<a href="board_write" class="btn_write">글쓰기</a>
			</p>
		<form action="board_list" method="get" id="listform">
			<p class="board_search">
				<select name="searchItem" id="id">
					<option value="">전체</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="custid">작성자</option>
				</select>
				<input type="text" name="searchWord"/> <a href="#" id="btn_list">검색</a>
			</p>
		</form>
		</div>
		
		<%@include file="../menuBottom.jsp"%>

	</div>

</body>
</html>