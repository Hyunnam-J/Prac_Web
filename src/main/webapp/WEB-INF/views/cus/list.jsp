<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
<h1 style='text-align: center'>cus-list</h1>
<c:forEach items="${list}" var="l">
<div style='text-align: center'>${l.id}</div>

</c:forEach>

</body>
</html>