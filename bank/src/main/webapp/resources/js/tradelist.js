/**
 * 
 */

$(function(){
	$("a[href=haveaccount]").attr("class","select")
	$("#deposit").on('click', function(){
		var accountno;
		var accounttype;
		
		$.each($("input[type=radio]"), function(index, item){
			if(item.checked) {
				accounttype = $(item).parent().next().html().trim()
				accountno = $(item).parent().next().next().html()
			}
		})
		
		if (accounttype == "대출계좌") {
			alert("대출계좌는 입금 불가")
			return false
		}
		$.ajax({
			method:'get'
			,url:'deposit'
			,success:function(res){
				$("#contents").html(res)
				$("#contents ul li:first-child span").after(accounttype)
				$("#contents ul li:nth-child(2) input").val(accountno)
				$("#haveaccount").on('click', function(){
					location.href = haveaccount
				})
				$("#depositdo").on('click', function(){
					var target = $("#contents ul li:nth-child(3) input")
					if(target.val() < 0 || target.val() == "") {
						alert("양수 입력")
						target.select()
						return false;
					}
					$("form").submit()
				})
			}
		})
	})
	$("#withdraw").on('click', function(){
		var accountno;
		var accounttype;
		
		$.each($("input[type=radio]"), function(index, item){
			if(item.checked) {
				accounttype = $(item).parent().next().html().trim()
				accountno = $(item).parent().next().next().html()
			}
		})
		
		if (accounttype != "예금계좌") {
			alert("예금계좌만 가능")
			return false
		}

		$.ajax({
			method:'get'
			,url:'withdraw'
			,success:function(res){
				$("#contents").html(res)
				$("#contents ul li:first-child span").after(accounttype)
				$("#contents ul li:nth-child(2) input").val(accountno)
				$("#haveaccount").on('click', function(){
					location.href = haveaccount
				})
				$("#withdrawdo").on('click', function(){
					var target = $("#contents ul li:nth-child(3) input")
					if(target.val() < 0 || target.val() == "") {
						alert("양수 입력")
						target.select()
						return false;
					}
					$.ajax({
						method:'get'
						,url:'getBalance'
						,data:'accountno='+accountno
						,success:function(res){
							if (res.balance < target.val()){
								alert("잔액부족")
								return false
							} else{
								$("form").submit()
							}
						}
					})
				})
			}
		})
	})
	$("#transfer").on('click', function(){
		var accountno;
		var accounttype;
		
		$.each($("input[type=radio]"), function(index, item){
			if(item.checked) {
				accounttype = $(item).parent().next().html().trim()
				accountno = $(item).parent().next().next().html()
			}
		})
		
		if (accounttype != "예금계좌") {
			alert("예금계좌만 가능")
			return false
		}

		$.ajax({
			method:'get'
			,url:'transfer'
			,success:function(res){
				$("#contents").html(res)
				$("#contents ul li:first-child span").after(accounttype)
				$("#contents ul li:nth-child(2) input").val(accountno)
				$("#haveaccount").on('click', function(){
					location.href = haveaccount
				})
				$("#transfer_pop1").on('click', function(){
					window.open('transfer_pop1?accountno='+$("input[name=accountno]").val(),'pop','resizable=no scrollbars=yes top=300 left=500 width=500 height=300');
				})
				$("#transfer_pop2").on('click', function(){
					window.open('transfer_pop2','pop','resizable=no scrollbars=yes top=300 left=500 width=400 height=250')
				})
				$("#transferdo").on('click', function(){
					var target = $("#contents ul li:nth-child(5) input")
					if(target.val() < 0 || target.val() == "") {
						alert("양수 입력")
						target.select()
						return false;
					}
					$.ajax({
						method:'get'
						,url:'getBalance'
						,data:'accountno='+accountno
						,success:function(res){
							if (res.balance < target.val()){
								alert("잔액부족")
								return false
							} else{
								$("form").submit()
							}
						}
					})
				})
			}
		})
	})
	$("#tradelist").on('click', function(){
		var accountno;
		var accounttype;
		
		$.each($("input[type=radio]"), function(index, item){
			if(item.checked) {
				accounttype = $(item).parent().next().html().trim()
				accountno = $(item).parent().next().next().html()
			}
		})

		$.ajax({
			method:'get'
			,url:'tradelist'
			,success:function(res){
				$("#contents").html(res)
				$("#contents ul li:first-child span").after(accountno)
				$("#contents ul li:first-child input").val(accountno)
				$("#haveaccount").on('click', function(){
					location.href = haveaccount
				})
				$.ajax({   
						method : "post"
						,url : "tradelist.do"
						,data : $("form").serialize()
						,success : function(res) {
							$("#inner").html(res)
							$("#inner").on('click', ".paging a", function(){
								var data = $("form").serialize()
								var currentPage = $(this).html()
								if (currentPage == '&lt;') {
									currentPage = parseInt($(this).next().html()) - parseInt($(this).attr('data-countPerPage'))
								}
								if (currentPage == '&gt;') {
									currentPage = parseInt($(this).prev().html()) + parseInt($(this).attr('data-countPerPage'))
								}
								data += "&currentPage=" + currentPage
								$.ajax({
									method : "post"
									,url : "tradelist.do"
									,data : data
									,success : function(res) {
										$("#inner").html(res)
									}
									,error : function(res) {
										console.log("error" + res)
									}
								})
							})
						}
						,error : function(res) {
							console.log("error" + res)
						}
					})
				$("#tradelistdo").on('click', function(){
					$.ajax({   
						method : "post"
						,url : "tradelist.do"
						,data : $("form").serialize()
						,success : function(res) {
							$("#inner").html(res)
							$("#inner").on('click', ".paging a", function(){
								var data = $("form").serialize()
								var currentPage = $(this).html()
								if (currentPage == '&lt;') {
									currentPage = $(this).next().html() - $(this).attr('data-countPerPage')
								}
								if (currentPage == '&gt;') {
									currentPage = $(this).prev().html() + $(this).attr('data-countPerPage')
								}
								data += "&currentPage=" + currentPage
								$.ajax({
									method : "post"
									,url : "tradelist.do"
									,data : data
									,success : function(res) {
										$("#inner").html(res)
									}
									,error : function(res) {
										console.log("error" + res)
									}
								})
							})
						}
						,error : function(res) {
							console.log("error" + res)
						}
					})
				})
			}
		})
	})
	$("#loan").on('click', function(){
		var accountno;
		var accounttype;
		
		$.each($("input[type=radio]"), function(index, item){
			if(item.checked) {
				accounttype = $(item).parent().next().html().trim()
				accountno = $(item).parent().next().next().html()
			}
		})

		if (accounttype != "대출계좌") {
			alert("대출계좌만 가능")
			return false
		}
		
		$.ajax({
			method:'get'
			,url:'loan'
			,success:function(res){
				$("#contents").html(res)
				$("#contents ul li:nth-child(2) input").val(accountno)
				$("#haveaccount").on('click', function(){
					location.href = haveaccount
				})
				$("#loando").on('click', function(){
					var target = $("#contents ul li:nth-child(4) input")
					if(target.val() < 0 || target.val() == "") {
						alert("양수 입력")
						target.select()
						return false;
					}
					$.ajax({
						method:'get'
						,url:'getBalance'
						,data:'accountno='+accountno
						,success:function(res){
							if (res.balance < target.val()){
								alert("상환한도초과")
								return false
							} else{
								$.ajax({
									method:'get'
									,url:'getBalance'
									,data:'accountno='+$("#transferno").val()
									,success:function(res){
										if (res.balance < target.val()){
											alert("출금계좌 한도초과")
											return false
										} else{
											$("form").submit()
										}
									}
								})
							}
						}
					})
				})
			}
		})
	})
})