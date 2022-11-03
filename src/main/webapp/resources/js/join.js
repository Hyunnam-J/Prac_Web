/**
 * 
 */
  
 var join = {
	param: function(c){
		if(c.getAttribute('id')=='id')				{	this.id(c)	}
		else if(c.getAttribute('id')=='email')		{	this.email(c)	}
		else if(c.getAttribute('id')=='pw')			{	this.pw(c)	}
		else if(c.getAttribute('id')=='pw_chk')		{	this.pw_chk(c)	}
	},//param
	
	email: function(c){
		var reg = /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/i;
		
		if((c.value)==''){
			c.classList.remove('valid') 
			c.classList.add('invalid')	
			div_e.innerText='Enter your email'
			div_e.style.color='red'
		}
		else if((c.value)==' '){ 
			c.classList.remove('valid') 
			c.classList.add('invalid')
		 	div_e.innerText='Enter without space'
		 	div_e.style.color='red'
		}
		else if(reg.test(c.value)){
			c.classList.remove('invalid') 
			c.classList.add('valid') 
			div_e.innerText='available email' 
			div_e.style.color='green'
		}
		else{ 
			c.classList.remove('valid') 
			c.classList.add('invalid')
			div_e.innerText='unavailable email' 
			div_e.style.color='red'
		}
	},//email
	
	pw: function(c){
		
		
		//8자 이상, 하나 이상의 숫자, 문자, 특수문자
		var reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
		if((c.value)==''){
			c.classList.remove('valid') 
			c.classList.add('invalid')
			div_p.innerText='Enter your password'
			div_p.style.color='red'
		}else if(c.value.toString().length<8){
			c.classList.remove('valid') 
			c.classList.add('invalid')
			div_p.innerText='must be at least 8 digits'
			div_p.style.color='red'
		}else if(reg.test(c.value)){
			c.classList.remove('invalid') 
			c.classList.add('valid')
			div_p.innerText='available password'
			div_p.style.color='green'
		
		}else{
			c.classList.remove('valid') 
			c.classList.add('invalid')
			div_p.innerText='8 digits and contains one or more letters, numbers, or special characters'
			div_p.style.color='red'
		}
	},//pw
	
	pw_chk: function(c){
		if(c.value==document.querySelector('#pw').value){
			c.classList.remove('invalid') 
			c.classList.add('valid')
			div_p_chk.innerText='available password'
			div_p_chk.style.color='green'
		}else{
			c.classList.remove('valid') 
			c.classList.add('invalid')
			div_p_chk.innerText='unavailable password'
			div_p_chk.style.color='red'
		}
	},//pw_chk
	
	id: function(c){
		c.classList.remove('validID')
		c.classList.add('invalidID')
		
		if((c.value)==''){
			c.classList.remove('valid') 
			c.classList.add('invalid')
			div_i.innerText='Enter your ID'	
			div_i.style.color='red'			
		}else if(c.value.toString().length<2){
			c.classList.remove('valid') 
			c.classList.add('invalid')
			div_i.innerText='at least two letters'	
			div_i.style.color='red'			
		}else if(c.value.toString().length>10){
			c.classList.remove('valid') 
			c.classList.add('invalid')
			div_i.innerText='up to ten letters'
			div_i.style.color='red'	
		}else{
			c.classList.remove('invalid') 
			c.classList.add('valid')
			div_i.innerText='available ID'
			div_i.style.color='green'	
		}
	},//id
	
	
 }//join
 
 
 