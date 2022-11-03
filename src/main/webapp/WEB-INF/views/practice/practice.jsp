<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.th{
	width: 230px;
}

input[type=button]{
	width: 50px;
	display: inline-block;
	height: 24px;
	padding: 3px 15px;
	border: 1px solid #b48885;
	border-radius: 3px;
	background-color: #fff;
	color: #b48885;
	text-align: center;
	cursor: pointer;
}


.modal {
	display: none;
	width: 400px;
	height: 400px;
	position: fixed;
	background: orange;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}
.close{
	position: relative;
	left: 95%;
}
.close:hover{
	cursor: pointer;
	color: white;
}
.red{
	background: #9F7272;
}
.blue{
	background: #A8A7DC;
}
#p-table{
	text-align: left;
	border: 1px solid #b48885;
}
#p-btns{
	display: flex;
	justify-content: flex-end;
	margin-right: 40px;
}
#p-btns > div:not(first-child) {
	margin-left: 10px;
}
</style>
</head>
<body>
	<h1 style='text-align: center'>Prac-JS</h1>
	<form id='form' method='get' action='test9.pr'>
		<table id='p-table'>
			<tr>
				<th>1. Please enter your Name</th>
				<td><input type='text' id='test1'>
				practice</td>
				<td><input type='button' id='btn1' class='btn1' value='btn1'></td>
			</tr>
			<tr>
				<th class='th'>2. Length 6 </th>
				<td class='td'><input type='text' id='test2'>
				<span class='text2'>practice</span></td>
				<td><input type='button' id='btn2' class='btn2' value='btn2'></td>
			</tr>
			<tr>
				<th class='th'>3. Branch processing</th>
				<td class='td'><input type='text' id='test3' class='test3'>
				<span class='text3'>practice</span></td>
				<td><input type='button' id='btn3' class='btn3' value='btn3'></td>
			</tr>
			<tr>
				<th class='th'>4. Branch processing</th>
				<td class='td'><input type='text' id='test4' class='test4'>
				<span class='text4'>practice</span></td>
				<td><input type='button' id='btn4' class='btn4' value='btn4'></td>
			</tr>
			<tr>
				<th class='th'>5. Branch processing</th>
				<td class='td'><input type='text' id='test5' class='test5'>
				<span class='text5'>practice</span></td>
				<td><input type='button' id='btn5' class='btn5' value='btn5'></td>
			</tr>
			<tr>
				<th class='th'>6. Branch processing</th>
				<td class='td'><input type='text' id='test6' class='test6'>
				<span class='text6'>practice</span></td>
				<td><input type='button' id='btn6' class='btn6' value='btn6'></td>
			</tr>
			<tr>
				<th class='th'>7. Please enter your email</th>
				<td class='td'><input type='text' id='test7' class='test7'>
				<span class='text7'>practice</span></td>
				<td><input type='button' id='btn7' class='btn7' value='btn7'></td>
			</tr>
			<tr>
				<th class='th'>8. Select your job title</th>
				<td class='td'>
					<select id='test8' class='test8' style='width: 170px; height: 22px'>
						<option>직무 선택</option>
						<c:forEach items='${jobs }' var='j'>
							<option>${j.job_title }</option>
						</c:forEach>
					</select>
					<span class='text8'>Push the btn8</span>
				</td>
				<td><input type='button' id='btn8' class='btn8' value='btn8' onclick="location='test8.pr'"></td>
			</tr>
			<tr>
				<th class='th'>9. Use form tag</th>
				<td class='td'>
					<select id='test9' class='test9' style='width: 170px; height: 22px'
					onchange='console.log("change!")'>
						<option>부서 선택</option>
						<c:forEach items='${departments }' var='d'>
							<option>${d.department_name }</option>
						</c:forEach>
					</select>
					<span><input type='text' id='text9' 
					placeholder='Write department_name selected by you' 
					style='width: 250px'
					onkeyup='compare()'></span>
				</td>
				<td><input type='button' id='btn9' class='btn9' value='btn9' onclick="document.getElementById('form').submit()"></td>
			</tr>
			
			
			<div id='modal' class='modal'><span class='close'>&times;</span></div>
			
		</table>
	</form>
	<div id='p-btns' class='btn'>
		<div><input type='button' value='home' onclick='location="<c:url value='/' />"'></div>
		<div><input type='button' id='btn_test' class='btn_test' value='test'></div>
		<div><input type='button' id='btn_modal' class='btn_modal' value='modal'></div>
		<div><input type='button' id='btn_help' class='btn_help' value='help'></div>
	</div>
<script>
//test
//Push the test_btn and show alert & console
const btn_test = document.querySelector('.btn_test');
btn_test.onclick = function(){
	alert('g');
}
btn_test.addEventListener("click", function(){
	console.log('g')
});

//1.
//I want to know the values 'window.location.search' and 'new URLSearchParams(window.location.search)' 
const btn1 = document.querySelector('.btn1');
btn1.onclick = function(){
	console.log((window.location.search));	
	console.log(new URLSearchParams(window.location.search));
}
//Comparison of values
const urlParams = new URLSearchParams(window.location.search);
const key = urlParams.get('id');
const test1 = document.querySelector('#test1');
test1.onkeyup = function(){if((test1.value)==key){
	alert('g');
}}
test1.addEventListener("keyup", function(){
	if((test1.value)==key){
		console.log('g')
	}
});

//2.
//Change when length becomes 6 
const btn2 = document.querySelector('.btn2');
btn2.onclick = function(){
	console.log((test2.value.toString().length));	
	console.log((test2.toString().length));	
}
const show = {
		six: 'six!'
};
const t = document.querySelector('.text2');
const test2 = document.querySelector('#test2');
test2.onkeyup = function(){
	if((test2.value.toString().length) > 5){
		alert(show.six);
		t.innerText='six';
		t.style.color='red';
	}
};

//3, 4, 5, 6.
//Branch processing
const btns = document.querySelectorAll('#btn3, #btn4, #btn5, #btn6');
const tests = document.querySelectorAll('#test3, #test4, #test5, #test6');
const branch = {
		branch_status: function(e){
			if(e.target.id=='btn3'){
				alert(tests[0].value.toString());
			}else if(e.target.id=='btn4'){
				alert(tests[1].value.toString());
			}else if(e.target.id=='btn5'){
				tests[2].classList.add('red');
			}else if(e.target.id=='btn6'){
				tests[3].classList.add('blue');
			}//if
		}//branch_status
}//branch
for(var i = 0; i < btns.length; i++){
	btns[i].onclick = function(e){
		console.log(e);
		branch.branch_status(e);
	};
}

//7.
//Test regular expression
const test7 = document.querySelector('#test7');
const btn7 = document.querySelector('#btn7');
var reg = /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/i;
btn7.onclick = function(){
	if( reg.test( test7.value.toString() ) ) alert('true');
	else										alert('false');
}

//9.
const test9 = document.querySelector('#test9');
const text9 = document.querySelector('#text9');
const btn_help = document.querySelector('#btn_help');
function compare(){
	if(test9.value==text9.value) alert('success!')
}



//Modal
const btn_modal = document.querySelector('.btn_modal');
const modal = document.querySelector('.modal');
btn_modal.onclick = function(){
	modal.style.display = 'block';	
}
const close = document.querySelector('.close');
close.onclick = function(){
	modal.style.display = 'none';
}

</script>
</body>
</html>