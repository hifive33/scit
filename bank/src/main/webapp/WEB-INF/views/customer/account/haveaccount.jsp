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
<script src="../resources/js/tradelist.js"></script>
</head>

<body><!-- 계좌현황서브 -->
	
	
	<div id="wrap"><!-- wrap -->
		
		<%@include file="../menuTop.jsp"%>

		<div id="contents"><!--내용-->
			<h1>보유계좌 현황</h1><!-- 내용제목 -->
			
			<table>
				<tr>
					<th>선택</th>
					<th>계좌종류</th>
					<th>계좌번호</th>
					<th>잔고</th>
					<th>납입(상환)기간</th>
					<th>대출(이율)</th>
				</tr>
				<c:forEach var="item" items="${list}" varStatus="stat">
					<tr>
						<td><input type="radio" name="backingname" ${stat.count == 1 ? 'checked' : '' } /></td>
						<td>
							<c:choose>
								<c:when test="${item.accounttype eq 'checking'}">예금계좌</c:when>
								<c:when test="${item.accounttype eq 'saving'}">적금계좌</c:when>
								<c:when test="${item.accounttype eq 'loan'}">대출계좌</c:when>
							</c:choose>
						</td>
						<td>${item.accountno}</td>
						<td>
							<c:if test="${item.balance eq 0}">
								-
							</c:if>
							<c:if test="${item.balance ne 0}">
								<fmt:formatNumber value="${item.balance}" pattern="#,###" />
							</c:if>
						</td>
						<td>${item.startdeposit eq null ? '' : item.startdeposit.concat(' ~ ')}${item.enddeposit eq null ? '' : item.enddeposit}</td>
						<td>${item.interest eq 0 ? '' : item.interest}${item.interest eq 0 ? '' : '%'}</td>
					</tr>
				</c:forEach>
			</table>

			<p class="list_btn">
				<a id="deposit">입금</a>
				<a id="withdraw">출금</a>
				<a id="transfer">이체</a>
				<a id="tradelist">거래내역</a>
				<a id="loan">대출상환</a>
			</p>



		</div>

		<%@include file="../menuBottom.jsp"%>

	</div>

</body>
</html>