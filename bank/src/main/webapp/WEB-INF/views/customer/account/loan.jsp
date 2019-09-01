<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>대출상환<span>상환정보를 입력해 주세요</span></h1><!-- 내용제목 -->
<form action="loan.do" method="post">
	<ul class="basic_list">
		<li><span>&#47; 계좌구분</span> 대출계좌</li>
		<li><span>&#47; 계좌번호</span><input type="text" name="accountno" class="wr_account" readonly="readonly" /></li>
		<li><span>&#47; 출금계좌번호</span><input type="text" name="transferno" id="transferno" class="wr_account" readonly="readonly" /><a href="#" onclick="window.open('loan_pop','pop','resizable=no scrollbars=yes top=300 left=500 width=500 height=300');return false">조회</a></li>
		<li><span>&#47; 상환금액</span><input type="text" name="amount" class="wr_account" /></li>
	</ul>
</form>

<p class="list_btn">
	<a id="haveaccount">이전</a><a id="loando" class="select">대출상환</a>
</p>