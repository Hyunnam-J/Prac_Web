<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>    
<header>
	
	 <ul id='main-nav'>
	 	<li><a href='<c:url value='/' />'><img src='imgs/logo-modified.png'></a></li>
		<li><a href='practice.pr' class='${category eq "pr" ? 'active' : '' }'>Prac-JS</a></li>
		<li><a href='list.cus' class='${category eq "cus" ? 'active' : '' }'>Customer</a></li>
		<li><a href='list.bo' class='${category eq "bo" ? 'active' : '' }'>Board</a></li>
		<li><a href='' class='${category eq "b2o" ? 'active' : '' }'>What</a></li>
	</ul>
	 <ul id='sign-account'>
	 	<c:if test="${empty loginInfo}">
		<li><a href='login.jo' class='btn-empty'>Log-in</a></li>
		<li><a href='view.jo' class='btn-fill'>Create an Account</a></li>
		</c:if>
	 	<c:if test="${not empty loginInfo}">
		<li><a href='m' class='btn-empty'>My...</a></li>
		<li><a href='logout.jo' class='btn-fill'>Log-out</a></li>
		</c:if>
	</ul>
</header>

<style>
header{
	display: flex;
	justify-content: flex-end;
}

#main-nav {
	display: flex;
	justify-content: space-between;
	font-size: 20px;
}

#main-nav > li {
	margin-right: 25px;
}

#main-nav img {
	height: 30px;
	overflow: hidden;
	margin-right: 40px;
}


#sign-account{
	width: 250px;
	display: flex;
	justify-content: flex-end;
}

#sign-account > li > a{
	font-size: 15px;
}

#sign-account li:nth-child(2){
	margin-left: 5px;
}



.active {
	color: #cfb3b1;
}

</style>