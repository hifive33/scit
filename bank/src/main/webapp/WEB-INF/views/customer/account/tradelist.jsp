<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h1>거래내역 조회<span></span></h1><!-- 내용제목 -->
<form action="tradelist.do" method="post">
	<ul class="basic_list">
		<li><span>&#47; 조회계좌번호</span><input type="hidden" name="accountno" /></li>
		<li><span>&#47; 조회기간선택</span><input type="date" name="fromdate" class="wr_date" /> ~ <input type="date" name="todate" class="wr_date"  /></li>
		<li><span>조회내용</span><input type="radio" name="eventtype" value="" checked />전체 <input type="radio" name="eventtype" value="deposit" />입금내역 <input type="radio" name="eventtype" value="withdraw" />출금내역</li>
		<li><span>&#47; 조회결과순서</span> <input type="radio" name="order" value="desc" checked />최근거래순서  <input type="radio" name="order" value="asc" />과거거래순서</li>
	</ul>
</form>
<p class="list_btn">
	<a id="haveaccount">이전</a><a id="tradelistdo" class="select">조회</a>
</p>
<div id="inner">
	<table>
		<tr>
			<th>거래일자</th>
			<th>시간</th>
			<th>출금</th>
			<th>입금</th>
			<th>내용</th>
			<th>잔액</th>
		</tr>
	</table>
</div>