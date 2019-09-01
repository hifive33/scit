<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>SESbank</title>
	<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
</head>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		$("#idfind").on('click', findid)
		$("#pwdfind").on('click', findpassword)
	})

	function idtab(){
		$("#idtab").css("display","")
		$("#passwordtab").css("display","none")
	}
	
	function passwordtab(){
		$("#idtab").css("display","none")
		$("#passwordtab").css("display","")
	}
	
	function findid(){
		var inputs = $("#idtab input")
		var name = $(inputs[0]).val()
		var email = $(inputs[1]).val()
		
		// 예외처리
		
		$.ajax({
			method:'post'
			,url:'findId'
			,data:{
				"name":name
				,"email":email
				}
			,success:function(res){
				if (res == "") alert("해당 회원이 없습니다.")
				else alert("ID : " + res)
			}
		})
		return false
	}
	
	function findpassword(){
		var inputs = $("#passwordtab input")
		var custid = $(inputs[0]).val()
		var name = $(inputs[1]).val()
		var email = $(inputs[2]).val()
		
		// 예외처리
		
		$.ajax({
			method:'post'
			,url:'findPassword'
			,data:{
				"custid":custid
				,"name":name
				,"email":email
				}
			,success:function(res){
				if (res == "") alert("해당 회원이 없습니다.")
				else alert("PASSWORD : " + res)
			}
		})
		return false
	}
</script>

<body><!-- 계좌현황서브 -->
	
	<div id="wrap"><!-- wrap -->
		
		<%@include file="../menuTop.jsp"%>

		<div id="contents"><!--내용-->
			<h1>고객센터<span>아이디, 패스워드 찾기</span></h1><!-- 내용제목 -->
			<div class="login_area">
				<img src="resources/images/login_icon.png" class="login_icon" />
				<form>
					<ul id="idtab" style="display:;"><!-- 아이디찾기 -->
						<li class=""><img src="resources/images/ico_login.png" width="14" /> Welcome SEBank</li>
						<li><a href="" onclick="return false;" class="findtitle_btn tab">아이디 찾기</a>&nbsp;<a href="" onclick="passwordtab(); return false;" class="findtitle_btn">패스워드 찾기</a></li>
						<li><input type="text" placeholder="이름" class="login_write" /></li>
						<li><input type="email" placeholder="이메일주소@도메인" class="login_write" /></li>
						<li><a id="idfind" class="btn_idfind">아이디 확인</a></li>
					</ul>
					<ul id="passwordtab" style="display:none;"><!-- 비밀번호찾기 -->
						<li class=""><img src="resources/images/ico_login.png" width="14" /> Welcome SEBank</li>
						<li><a href="" onclick="idtab(); return false;" class="findtitle_btn">아이디 찾기</a>&nbsp;<a href="" onclick="return false;" class="findtitle_btn tab"> 패스워드 찾기</a></li>
						<li><input type="text" placeholder="아이디" class="login_write" /></li>
						<li><input type="text" placeholder="이름" class="login_write" /></li>
						<li><input type="email" placeholder="이메일주소@도메인" class="login_write" /></li>
						<li><a id="pwdfind" class="btn_idfind">비밀번호 찾기</a></li>
					</ul>
					
				</form>
			</div>

		</div>

		<%@include file="../menuBottom.jsp"%>
		
	</div>
</body>
</html>