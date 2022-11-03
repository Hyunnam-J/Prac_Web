<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix='tiles'%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>    
<!DOCTYPE html>
<html>
<c:choose>
	<c:when test="${category eq 'cus'}"><c:set var='title' value=' - Customer' /></c:when>
	<c:when test="${category eq 'bo'}"><c:set var='title' value=' - Board' /></c:when>
	<c:when test="${category eq 'jo'}"><c:set var='title' value=' - Sing-up' /></c:when>
	<c:when test="${category eq 'login'}"><c:set var='title' value=' - Login' /></c:when>
</c:choose>
<head>
<meta charset="UTF-8">
<title>타이틀${title}</title>
<link rel='icon' href='imgs/logo-modified.png' type='image/x-icon'>
<link rel='stylesheet' href='css/common.css?<%=new java.util.Date()%>'>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

</head>
<body>
<tiles:insertAttribute name='header'/>
<tiles:insertAttribute name='container'/>
<tiles:insertAttribute name='footer'/>
<script src='https://code.jquery.com/jquery-3.6.1.min.js'></script>
</body>
</html>