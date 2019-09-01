<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>SESbank</title>
<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		$("input[name=custid]").on("keyup", function(){
			$.ajax({
				method:'post'
				,url:'idCheck'
				,data:'custid='+$(this).val()
				,success:function(res){
					if (res == 1){
						$(".login_area span").html("해당 아이디가 존재")
						$("#join").off('click')
					} else{
						$(".login_area span").html("")
						$("#join").on('click', function(){
							//예외 처리
							
							$("form").submit();
							return false;
						})
					}
				}
			})
		})
		
		$("#join").on('click', function(){
			//예외 처리
			
			$("form").submit();
			return false;
		})
	})
</script>
</head>
<body><!-- 계좌현황서브 -->
	
	<div id="wrap"><!-- wrap -->
		
		<%@include file="../menuTop.jsp"%>

		<div id="contents"><!--내용-->
			<h1>회원가입<span>가입항목을 입력해 주세요</span></h1><!-- 내용제목 -->
			<div class="login_area">
				<img src="resources/images/login_icon.png" class="login_icon" />
				<form action="join.do" method="post">
					<ul><!-- 회원가입 -->
						<li style="border-bottom:1px dotted #e7121c; padding-bottom:5px;"><img src="resources/images/ico_login.png" width="14" /> Welcome SEBank</li>
						<li class="grp_area"><label for="">회원구분</label><input type="radio" name="division" value="personal" checked /> 개인 <input type="radio" name="division" value="company" /> 법인</li>
						<li>
							<input type="text" placeholder="아이디" name="custid" class="login_write" /><br />
							<span></span>
						</li>
						<li><input type="password" placeholder="비밀번호" name="password" class="login_write" /></li>
						<li><input type="password" placeholder="비밀번호 확인" class="login_write" /></li>
						<li><input type="text" placeholder="이름" name="name" class="login_write" /></li>
						<li><input type="text" placeholder="주민(사업자)번호" name="idno" class="login_write" /></li>
						<li><input type="email" placeholder="이메일주소@도메인" name="email" class="login_write" /></li>
						<li><input type="text" placeholder="주소" name="address" class="login_write" /></li>
						<li><a id="join" class="btn_join">회원가입</a></li>
					</ul>
				</form>
			</div>
		</div>

		<%@include file="../menuBottom.jsp"%>

	</div>

</body>

</html>