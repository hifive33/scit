<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="header"><!-- 상단 -->
	<div id="top"><!-- 멤버 -->
		<c:if test="${empty sessionScope.loginId}">
			<a href='<c:url value="/"/>'>로그인</a><a href="<c:url value='/join' />">회원가입</a>&nbsp;&nbsp;&nbsp;
		</c:if>
		<c:if test="${not empty sessionScope.loginId}">
			<a href="<c:url value='/info' />">회원정보수정</a><a href="<c:url value='/logout' />">로그아웃</a>&nbsp;&nbsp;&nbsp;
		</c:if>
	</div>
	<div id="navi">
	<a href='<c:url value="/"/>'><img src="<c:url value='/resources/images/logo.png' />" width="150" /></a>
		<div class="gnb"><!-- 네비게이션 -->
			<ul>
				<li><a href="<c:url value='/account/haveaccount' />">보유계좌현황</a>
					<!-- <ul>
					   <li><a href="#">서브메뉴1</a></li>
					   <li><a href="#">서브메뉴2</a></li>
					   <li><a href="#">서브메뉴3</a></li>
					</ul> -->
				</li>

				<li><a href="<c:url value='/account/addaccount' />">신규계좌개설</a>
					<ul>
					   <li><a href="<c:url value='/account/addaccount_1' />">예금계좌</a></li>
					   <li><a href="<c:url value='/account/addaccount_2' />">적금계좌</a></li>
					   <li><a href="<c:url value='/account/addaccount_3' />">대출계좌</a></li>
					</ul>
				</li>
				<li><a href="<c:url value='/board_list' />">고객문의게시판</a>
					<!-- <ul>
					   <li><a href="#">서브메뉴1</a></li>
					   <li><a href="#">서브메뉴2</a></li>
					   <li><a href="#">서브메뉴3</a></li>
					</ul> -->
				</li>
			</ul>
		</div>
	</div>
</div>