<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#p-table{
	width: 600px;
	height: 400px;
}
#p-table th{
	font-size: 18px;
} 
#p-table input{
	width: -webkit-fill-available;
	height: -webkit-fill-available;
	margin: 3px;
}
#p-btn{
	display: flex;
	justify-content: center;
	margin-top: 10px;
}
#p-btn input[type=button]{
	height: 30px;
	font-size: 17px;
}
#p-btn > input:nth-child(2) {
	cursor: pointer;
 	margin-left: 10px;
}

#postSubmit{
	cursor: pointer;
}
</style>
</head>
<body>
<h1 style='text-align: center'>Post</h1>
<form id='postForm' method='post' action='insertPost.bo'>
	<table id='p-table'>
	<input type='hidden' name='writer' value='${loginInfo.id}'>
		<tr><th width='100px' height='30px'>title</th>
			<td><input type='text' id='title' name='title'></td>
		</tr>
		<tr><th>content</th>
			<td><textarea id='textarea' name='content'></textarea></td>
		</tr>
	</table>
</form>
<div id='p-btn'>
<input type='button' class='btn-fill' value='submit' id='postSubmit'>
<input type='button' class='btn-empty' value='cancel' onclick='location="list.bo"'>
</div>
<script>
document.querySelector('#postSubmit').onclick = function(){
	document.querySelector('#postForm').submit();
}
</script>
</body>
</html>