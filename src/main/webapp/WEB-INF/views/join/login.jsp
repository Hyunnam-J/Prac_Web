<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#l-center{
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	text-align: center;
}
#l-box{
	border: 1px solid #cfd0d1;
	width: 500px;
	height: 300px;
	margin: 0 auto;
}
#l-img{
	width: 70px;
	margin-bottom: 30px;
	cursor: pointer;
}
#naver{
	background: url("imgs/naverlogin.png") no-repeat center;
	background-size: cover;
	border-color: #fff;
}
#kakao{
	background: url("imgs/kakaologin.png") no-repeat center;
	background-size: cover;
	border-color: #fff;
}
#l-center input[type=text], #l-center input[type=password]{
	width: 250px;
	height: 35px;
	padding: 10px;
	box-sizing: border-box;
	margin-bottom: 5px;
}

#l-center input[type=button]{
	width: 250px;
	height: 35px;
	padding: 0;
	box-sizing: border-box;
	margin-bottom: 5px;
}

::placeholder{
	font-size: 14px;
}
#l-center li{
	width: 400px;
}
#login{
	cursor: pointer;
	font-size: 20px;
}
#findPw{
	font-size: 17px;
	font-weight: normal; 
	cursor: pointer;
}

</style>
</head>
<body>
<div id='l-center'>
<a href="<c:url value='/'/>"><img src="imgs/logo-modified.png" id='l-img'></a>
	<div id='l-box'>
		<ul style='margin: 0; padding: 40px'>
			<li><input type='text' id='id' name='id' placeholder='ID'></li>
			<li><input type='password' id='pw' name='pw' placeholder='password'></li>
			<li><input type='button' onclick='login()' id='login' value='login' class='btn-fill'></li>
			<hr>
			<li><input type='button' id='naver'></li>
			<li><input type='button' id='kakao'></li>
		</ul>
	</div>
	<br>
	<a id='findPw'>find password</a>
</div>
<script>
const id = document.querySelector('#id');
const pw = document.querySelector('#pw');

//The enter key access function login()
pw.onkeyup = function(e){
	if(e.keyCode==13) login();
};

//Check id and pw before login
document.querySelector('#login').onclick = login();
function login(){
	$.ajax({
        url:'checkLogin.jo',
        data: { id:id.value, pw:pw.value },
        success: function(result) {
            if (result) {
            	location = '<c:url value="/"/>';
            }else {
            	alert('password do not match');
				id.focus();
            }
        }
    });	//ajax	
}//login()

</script>
</body>
</html>