<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.page{
	text-align: center;
	font-size: 30px;
}
#b-post{
	font-size: 17px;
	margin-right: 55px;
}

#b-search{
	font-size: 17px;
	height: 31px;
	box-sizing: border-box;
}

#b-top{
	display: flex;
	justify-content: space-between;
	margin: 7px 0;
}

#b-select{
	width: 70px;
	height: 31px;
	box-sizing: border-box;
	text-align: center;
	font-size: 16px;
}

</style>

</head>
<h1 style='text-align: center'>Board</h1>
<body>
	<div id='b-top'>
		<div style='margin-left: 50px'>
			<select id='b-select'>
				<option>All</option>
			</select>
			<input type='text' id='b-search'>
			<a href='post.bo' class='btn-fill' id='b-post'>search</a>
		</div>
		<c:if test="${not empty loginInfo}">
		<a href='post.bo' class='btn-fill' id='b-post'>post</a>
		</c:if>
	</div>
	<form id='form' action="list.bo" method='get'>
		<input type='hidden' name='curPage' value='' id='curPage'>
		<table style='width:700px'>
			<colgroup>
				<col width='70px'>
				<col width='150px'>
				<col width='200px'>
				<col width='100px'>
				<col width='150px'>
			</colgroup>
			<tr>
				<th>No</th>
				<th>Title</th>
				<th>Content</th>
				<th>Writer</th>
				<th>Date created</th>
			</tr>
			<c:forEach items='${pageVo.list}' var='p'>
				<tr>
					<td>${p.id}</td>
					<td>${p.title}</td>
					<td>${p.content}</td>
					<td>${p.writer}</td>
					<td>${p.writedate}</td>
				</tr>
			</c:forEach>
		</table>
	</form>
	<div class='page'>
		<jsp:include page="/WEB-INF/views/include/page.jsp"/>
	</div>
</body>
</html>