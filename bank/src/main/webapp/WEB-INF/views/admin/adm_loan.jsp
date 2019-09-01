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
		$("a[href=adm_loan]").parent().attr("class","select")
		$("#approve").on('click', function(){
			var accountno;
			
			$.each($("input[type=radio]"), function(index, item){
				if(item.checked) {
					accountno = $(item).parent().next().next().html()
				}
			})
			
			location.href = 'adm_loan.do?accountno=' + accountno + '&action=approve'
		})
		$("#deny").on('click', function(){
			var accountno;
			
			$.each($("input[type=radio]"), function(index, item){
				if(item.checked) {
					accountno = $(item).parent().next().next().html()
				}
			})
			
			location.href = 'adm_loan.do?accountno=' + accountno + '&action=deny'
		})
	})
</script>
</head>

<body><!-- 계좌현황서브 -->
	<div id="wrap"><!-- wrap -->
		
		<%@include file="menuTop.jsp"%>

		<div id="adm_contents"><!--내용-->
			<h1>관리자 / 대출승인<span></span></h1><!-- 내용제목 -->
			<table>
				<tr>
					<th>선택</th>
					<th>신청자</th>
					<th>계좌번호</th>
					<th>대출금액</th>
					<th>대출기간</th>
					<th>(대출)이율</th>
				</tr>
				<c:forEach var="item" items="${list}" varStatus="stat">
					<tr>
						<td><input type="radio" name="loan_v" ${stat.count == 1 ? 'checked' : ''} /></td>
						<td>${item.custid}<br />(${item.years})</td>
						<td>${item.accountno}</td>
						<td>${item.balance}</td>
						<td>${item.startdeposit} ~ ${item.enddeposit}</td>
						<td>${item.interest}%</td>
					</tr>
				</c:forEach>
			</table>
			<p class="adm_paging">
				<a id="approve" class="select">승인</a><a id="deny">거절</a>
			</p>

		</div>

		<%@include file="menuBottom.jsp"%>

	</div>

</body>
</html>