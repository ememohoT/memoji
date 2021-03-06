<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Sign Up</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/main.css">
<!--===============================================================================================-->
	<style>
		#idChkArea{
			text-align: right;
			padding-right: 14px;
			transform: translateY(-20px);
		}
		#idChk {
			color: #5e42a6;
			font-size: 14px;
		}
		#idChk:hover {
			color: #999;
		}
	</style>
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form p-l-55 p-r-55 p-t-178" method="post">
					<span class="login100-form-title">
						????????????
					</span>

					<div class="wrap-input100 validate-input m-b-16" data-validate="???????????? ??????????????????!!!">
						<input class="input100" type="text" name="userId" id="userId" maxlength="15"
							oninput="chkId()" placeholder="???????????? ??????????????????">
						<span class="focus-input100"></span>
					</div>
					<div id="idChkArea">
						<button type="button" id="idChk" onclick="fnIdChk()" value="N">????????????</button>
					<!-- <button type="button" id="idChk">????????????</button> -->
					</div>

					<div class="wrap-input100 validate-input m-b-16" data-validate = "??????????????? ??????????????????!!!">
						<input class="input100" type="password" name="userPass" id="userPass" placeholder="??????????????? ??????????????????">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "??????????????? ??????????????????!!!">
						<input class="input100" type="password" name="userPassChk" id="userPassChk" placeholder="??????????????? ?????? ??? ??????????????????">
						<span class="focus-input100"></span>
					</div>

					<div class="text-right p-t-13 p-b-23">
					</div> 

					<div class="container-login100-form-btn">
						<button id="joinBtn" class="login100-form-btn">
							????????????
						</button>
					</div>

					<div class="flex-col-c p-t-170 p-b-40">
						<span class="txt1 p-b-9">
							?????? ???????????? ????????????????
						</span>

						<a href="../#three" class="txt3">
							???????????????
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
<!--===============================================================================================-->
	<script src="../resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="../resources/vendor/bootstrap/js/popper.js"></script>
	<script src="../resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../resources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="../resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="../resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(function(){
		
		$("#joinBtn").click(function(){
			
			let userId = $("#userId").val();
			let userIdLen = userId.length;
			let uIdReg = /[^a-z|A-Z|0-9|_]/g;
			let idChkVal = $("#idChk").val();
			let userPass = $("#userPass").val();
			let userPassChk = $("#userPassChk").val();
			
			if (userId == ""){
   				alert("???????????? ???????????????.")
   				$("#userId").focus();
   				return false;
   			}
			else if (userIdLen <= 5){
   				alert("???????????? 6?????? ?????? 15?????? ?????? / ??????, ??????, _??? ?????? ???????????????.");
   				$("#userId").focus();
   				return false;
   			} 
			else if (uIdReg.test(userId)){
   				alert("???????????? 6?????? ?????? 15?????? ?????? / ??????, ??????, _??? ?????? ???????????????.");
   				$("#userId").focus();
   				return false;
   			}
			else if (idChkVal == "N"){
				alert("????????? ?????? ????????? ????????????.")
   				$("#userId").focus();
   				return false;
			}
			else if (userPass == ""){
   				alert("??????????????? ???????????????.")
   				$("#userPass").focus();
   				return false;
   			}
   			else if (userPass != userPassChk){
   				alert("??????????????? ???????????? ????????????.");
   				$("#userPassChk").val("");
   				$("#userPassChk").focus();
   				return false;   				
   			}
   			else {
   				$("#joinBtn").submit();
   			}
		})
		
	/* 
	 	$("#idChk").click(function(){
			var query = {userId : $("#userId").val()};
			     
			$.ajax({
				url : "/memo/idChk",
				type : "post",
				data : query,
				success : function(data) {
			 
					if(data == 1) {
			   			alert("?????? ???????????? ??????????????????.")
			  		} else {
			   			alert("?????? ????????? ??????????????????.")           
			  		}
			 	}
			});
	 	});
		 */
		
	})
	 
	function fnIdChk(){
		
		
		$.ajax({
			url : "/memo/idChk",
			type : "post",
			dataType : "json",
			data : {"userId" : $("#userId").val()},
			success : function(data){
				if($("#userId").val() == "" || $("#userId").val() == null){
					alert("???????????? ??????????????????.")
					$("#userId").focus();
					return false;
				}
				
				else {
					if(data == 1){
						alert("?????? ???????????? ??????????????????.");
						$("#userId").focus();
						
					} else if(data == 0){
						$("#idChk").attr("value", "Y");
						alert("??????????????? ??????????????????.");
						$("#userPass").focus();
						
					}
				}
			}
		}) 
		/* ajax end */
		
	}
	/* fnIdChk() end */
	  
</script>
</html>