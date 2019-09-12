<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	date()
	$("#navi>.gnb>ul>li:nth-child(3)>a").attr("class","select")
	$("#btn_update").on('click',function(){
		$("form").submit();
		return false;
	})
	$("#filechange").on('click', function(){
		var str = '<input type="file" name="upload" />'
		$("#contents table tr:last-child td").html(str)
		$("#contents table tr:last-child td input").click()
	})
})

function date(){
	var st_date = new Date().toISOString().substr(0, 10).replace('T', ' ');
	$("#today").html(st_date);

}

</script>
<body><!-- 계좌현황서브 -->
	
	<div id="wrap"><!-- wrap -->

		<%@include file="../menuTop.jsp"%>
		
		<div id="contents"><!--내용-->
			<h1>고객문의 게시판<span></span></h1><!-- 내용제목 -->
			<form action="board_update.do" method="post" enctype="multipart/form-data">
			<table class="wr_board">
				<tr>
					<th>작성자</th>
					<td><input type="hidden"name="boardno" value="${model.boardno }"/><input type="hidden"name="custid" value="${sessionScope.loginId}"/>${sessionScope.loginId}</td>
				</tr>
				<tr>
					<th>수정일</th>
					<td id="today"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" value="${model.title }"/></td>
				</tr>
				<tr>
					<th colspan="2" >내용</th>
				</tr>
				<tr>
					<td colspan="2" ><textarea name="content">${model.content }</textarea></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<c:if test="${model.originalfile != null}">
						<td><button id="filechange">파일 바꾸기</button> ${model.originalfile}</td>
					</c:if>
					<c:if test="${model.originalfile == null}">
						<td><input type="file" name="upload" /></td>
					</c:if>
				</tr>
			</table>
			</form>
			<p class="list_btn">
				<a href="board_list">취소</a>
				<a href="#" class="select" id="btn_update">수정</a>
			</p>
		</div>

		<%@include file="../menuBottom.jsp"%>

	</div>

</body>
</html>