<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>SESbank</title>
	<link rel="stylesheet" type="text/css" href="../resources/css/style.css" />
<script src="../resources/js/jquery-3.4.1.min.js"></script>
<script>
	$(function(){
		$("#lookup").on('click', function(){
			$.ajax({
				method:'post'
				,url:'transfer.lookup'
				,data:"accountno="+$(".wr_idcheck").val()
				,success:function(res){
					console.log(res.name)
					if (res.name == null){
						$("#span1").css("display", "none")
						$("#span2").css("display", "")
					} else{
						$("#span1").css("display", "")
						$("#span2").css("display", "none")
						$("#span1 span").html('위 계좌는 '+res.name+'님 계좌입니다')
					}
						
				}
			})
		})
		$("#apply").on('click', function(){
			$(opener.document.getElementById("transferno")).val($("input[type=text]").val())
			window.close()
		})
	})
</script>
</head>

<body>

<div class="popwrap">

<h2>입금계좌 입력</h2>
	<div>
		<p class="list_btn">
			<input type="text" class="wr_idcheck" placeholder="2548-589-5841" /> <a id="lookup">조회</a><br /><br />
			<span id="span1" style="display:none;">
				<span>위 계좌는 유효한 계좌입니다</span><br /><br /><br /><a id="apply" class="select">적용</a>
			</span>
			<span id="span2" style="display:none;">
				<span>위 계좌는 존재하지않는 계좌입니다</span><br /><br /><br />
			</span>
		</p>
		
	</div>
</div>

</body>
</html>