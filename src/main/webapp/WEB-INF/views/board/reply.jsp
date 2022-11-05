<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#r-table{
	width: 600px;
	height: 400px;
}
#r-table th{
	font-size: 18px;
} 
#r-table input{
	width: -webkit-fill-available;
	height: -webkit-fill-available;
	margin: 3px;
}
#r-btn{
	display: flex;
	justify-content: center;
	margin-top: 10px;
}
#r-btn input[type=button]{
	height: 30px;
	font-size: 17px;
}
#p-btn > input:nth-child(2) {
	cursor: pointer;
 	margin-left: 10px;
}

#replySubmit{
	cursor: pointer;
}
</style>
</head>
<body>
<h1 style='text-align: center'>Reply</h1>
<form id='replyForm' method='post' action='insertReply.bo'>
	<table id='r-table'>
	<input type='hidden' name='writer' value='${loginInfo.id}'>
	<input type='hidden' name='root' value='${vo.root}'>
	<input type='hidden' name='step' value='${vo.step}'>
	<input type='hidden' name='indent' value='${vo.indent}'>
	<input type='hidden' name='curPage' value='${pageVo.curPage}'>
		<tr><th width='100px' height='30px'>title</th>
			<td><input type='text' id='title' name='title'></td>
		</tr>
		<tr><th>content</th>
			<td><textarea id='textarea' name='content'></textarea></td>
		</tr>
	</table>
</form>
<div id='r-btn'>
<input type='button' class='btn-fill' value='submit' id='replySubmit'>
<input type='button' class='btn-empty' value='cancel' onclick='location="list.bo"'>
</div>
<script>
document.querySelector('#replySubmit').onclick = function(){
	document.querySelector('#replyForm').submit();
}
</script>
</body>
</html>