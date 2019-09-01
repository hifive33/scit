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
		$("#header > a[href=adm_answerlist]").parent().attr("class","select")
		$(".btn_reply").on('click', function(){
			var boardno = ${result.boardno}
			var replytext = $(this).parent().prev().children().val()
			$.ajax({
				method:'post'
				,url:'reply.do'
				,data:{
					'boardno':boardno
					,'replytext':replytext
				}
				,success:function(res){
					if(res == 'success') location.reload()
				}
			})
			return false
		})
	})
</script>
</head>

<body><!-- 계좌현황서브 -->
	
	
	<div id="wrap"><!-- wrap -->
		
		<%@include file="menuTop.jsp"%>

		<div id="adm_contents"><!--내용-->
			<h1>관리자 / 문의답변<span></span></h1><!-- 내용제목 -->
			
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
						<a href="../download?boardno=${result.boardno}">
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
					<span>${result.repdate != null ? '&lpar;'.concat(result.repdate).concat('&rpar;') : ''}</span>
					</th>
					<td>
						${result.replytext}
					</td>
				</tr>

				<tr><!-- 관리자답변등록 -->
					<th>답변</th>
					<td><textarea>${result.replytext}</textarea></td>
					<td><a href="" class="btn_reply">${result.replytext == null ? '등록' : '수정'}</a></td>
				</tr>
			</table>
			<p class="list_btn">
				<a href="../board_delete?flag=true&boardno=${result.boardno}" id="delete">삭제</a>
				<a href="adm_answerlist" class="select">목록</a>
			</p>

		</div>

		<%@include file="menuBottom.jsp"%>

	</div>



</body>
</html>