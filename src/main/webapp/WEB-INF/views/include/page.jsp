<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
span{
	vertical-align: middle;
}
.v-b{
	vertical-align: bottom;
}
</style>
</head>
<body>
	<c:if test='${pageVo.curBlock gt 1}'>
	<a onclick='page(1)' class='hover'><span class="material-symbols-outlined">keyboard_double_arrow_left</span></a>
	<a onclick='page(${pageVo.beginPage-pageVo.blockPage})' class='hover'><span class="material-symbols-outlined t-6">chevron_left</span></a>
	</c:if>	

	<c:forEach var='n' begin='${pageVo.beginPage}' end='${pageVo.endPage }'>
		<c:if test="${n eq pageVo.curPage}"><a class='hover v-b active'>${n}</a></c:if>
		<c:if test="${n ne pageVo.curPage}"><a onclick='page(${n})' class='hover v-b'>${n}</a></c:if>
	</c:forEach>
	
	<c:if test='${pageVo.curBlock lt pageVo.totalBlock}'>
	<a onclick='page(${pageVo.endPage+1})' class='hover'><span class="material-symbols-outlined">chevron_right</span></a>
	<a onclick='page(${pageVo.totalPage})' class='hover'><span class="material-symbols-outlined">keyboard_double_arrow_right</span></a>
	</c:if>
	
<script>
function page(n){
	const curPage = document.getElementById('curPage');
	curPage.setAttribute('value', n);
	form.submit();
}

</script>
</body>
</html>