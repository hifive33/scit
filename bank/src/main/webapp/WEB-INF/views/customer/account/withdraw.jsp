<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>출금<span>출금정보를 입력해 주세요</span></h1><!-- 내용제목 -->
<form action="withdraw.do" method="post">
	<ul class="basic_list">
		<li><span>&#47; 계좌구분</span></li>
		<li><span>&#47; 계좌번호</span><input type="text" name="accountno" class="wr_account" /></li>
		<li><span>&#47; 출금금액</span><input type="number" name="balance" min="0" class="wr_account" /></li>
	</ul>
</form>

<p class="list_btn">
	<a id="haveaccount">이전</a><a id="withdrawdo" class="select">출금</a>
</p>