<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<table>
	<tr>
		<th>거래일자</th>
		<th>시간</th>
		<th>출금</th>
		<th>입금</th>
		<th>내용</th>
		<th>잔액</th>
	</tr>
	<c:forEach var="item" items="${list}">
		<tr>
			<td>${fn:substring(item.eventdate,0,10)}</td>
			<td>${fn:substring(item.eventdate,10,19)}</td>
			<td>
				<c:if test="${item.eventtype eq 'withdraw' || item.eventtype eq 'transfer'}">
					<fmt:formatNumber value="${item.amount}" pattern="#,###" />
				</c:if>
			</td>
			<td>
				<c:if test="${item.eventtype eq 'deposit'}">
					<fmt:formatNumber value="${item.amount}" pattern="#,###" />
				</c:if>
			</td>
			<td>${item.eventrecord}</td>
			<td>${item.balance}</td>
		</tr>
	</c:forEach>
</table>
<p class="paging">
	<a data-countPerPage="${countPerPage}">&lt;</a>
	<c:forEach var="page" begin="1" end="${total}">
		<a ${page == currentPage ? 'class="select"' : ''}>${page}</a>
	</c:forEach>
	<a data-countPerPage="${countPerPage}">&gt;</a>
</p>
