<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>입금<span>입금정보를 입력해 주세요</span></h1><!-- 내용제목 -->
<form action="deposit.do" method="post">
	<ul class="basic_list">
		<li><span>&#47; 계좌구분</span></li>
		<li><span>&#47; 계좌번호</span><input type="text" name="accountno" class="wr_account" readonly="readonly" /></li>
		<li><span>&#47; 입금금액</span><input type="number" name="balance" min="0" class="wr_account" /></li>
	</ul>
</form>

<p class="list_btn">
	<a id="haveaccount">이전</a><a id="depositdo" class="select">입금</a>
</p>
