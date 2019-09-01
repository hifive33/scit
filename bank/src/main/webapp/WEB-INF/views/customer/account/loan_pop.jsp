<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>SESbank</title>
	<link rel="stylesheet" type="text/css" href="../resources/css/style.css" />
<script src="../resources/js/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		$("#select").on('click', function(){
			var accountno;
			$.each($("input[type=radio]"), function(index, item){
				if(item.checked) accountno = $(item).parent().next().html().trim()
			})
			$(opener.document.getElementById("transferno")).val(accountno)
			window.close()
		})
	})
</script>
</head>

<body>

<div class="popwrap">

<h2>출금계좌 선택</h2>
	<div style="">
		<table>
			<tr>
				<th>선택</th>
				<th>계좌번호</th>
				<th>잔고</th>
			</tr>
			<c:forEach var="item" items="${list}" varStatus="stat">
				<tr>
					<td><input type="radio" name="accountsel" ${stat.count == 1 ? 'checked' : ''}/></td>
					<td>${item.accountno}</td>
					<td><fmt:formatNumber value="${item.balance}" pattern="#,###" /></td>
				</tr>
			</c:forEach>
		</table>

		<p class="list_btn">
			<a id="select">선택</a>
		</p>
	</div>
</div>

</body>

</html>