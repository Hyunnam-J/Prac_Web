<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#d-table{
	width: 800px;
	height: 340px;
}
#d-table th, #d-table td{
	padding: 5px;
}

#d-table > tr{
	height: 20px;
}
#d-table > tr th, #d-table > tr td {
	padding: 10px;
}
#d-table td{
	text-align: left
}

#d-btn{
	display: flex;
	justify-content: center;
	margin-top: 10px;
}
#d-btn input[type=button]{
	height: 30px;
	font-size: 17px;
	cursor: pointer;
}
#d-btn > input[type=button]:not(:first-child) {
 	margin-left: 10px;
}
</style>

</head>
<body>
<h1 style='text-align: center'>detail</h1>
	<table id='d-table'>
		<tr><th>title</th>
			<td colspan='6'>${vo.title}</td>
		</tr>
		<tr>
			<th>writer</th>
			<td colspan='2'>${vo.writer}</td>
			<th style='width: 140px'>Date Created</th>
			<td>${vo.writedate}</td>
			<th style='width: 60px'>views</th>
			<td style='text-align: end'>${vo.readcnt}</td>
		</tr>
		<tr><th height='200px'>content</th>
			<td colspan='6'>${vo.content}</td>
		</tr>
		<tr><th height='40px'>file</th>
			<td colspan='6'>
			<c:if test="${not empty vo.filename}">
			<span id='file_span' class="material-symbols-outlined">draft</span>${vo.filename}
			</c:if>
			</td>
			
		</tr>
	</table>
	<div id='d-btn'>
		<input type='button' class='btn-fill' value='modify'>
		<input type='button' class='btn-fill' value='reply' onclick='location="reply.bo?id=${vo.id}&curPage=${pageVo.curPage}"'>
		<input type='button' class='btn-empty' value='back' onclick='location="list.bo"'>
	</div>
</body>
</html>