<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>이체<span>이체정보를 입력해 주세요</span></h1><!-- 내용제목 -->
<form action="transfer.do" method="post">
	<ul class="basic_list">
		<li><span>&#47; 계좌구분</span></li>
		<li><span>&#47; 출금계좌번호</span><input type="text" name="accountno" class="wr_account" readonly="readonly"/></li>
		<li><span></span><input type="radio" id="transfer_pop1" checked name="add_account" />본인계좌 <input type="radio" id="transfer_pop2" name="add_account" />타인계좌</li>
		<li><span>&#47; 입금계좌번호</span><input id="transferno" name="transferno" type="text" class="wr_account" readonly="readonly" /><!-- <a href="#">조회</a> --></li>
		<li><span>&#47; 이체금액</span><input type="number" name="balance" min="0" class="wr_account" /></li>
	</ul>
</form>

<p class="list_btn">
	<a id="haveaccount">이전</a><a id="transferdo" class="select">이체</a>
</p>