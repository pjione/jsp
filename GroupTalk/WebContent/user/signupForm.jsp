<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <!-- Custom styles for this template -->
</head>
<body>
<%@ include file = "/header.jsp" %>
<link href="/css/sign-in.css" rel="stylesheet">
<body class="text-center">
	<main class="form-signin w-100 m-auto">
	  <form action = "signupCheck.jsp" method = "post" id = "joinFrm">
	    <img class="mb-4" src="/etc/main.jpg" alt="" width="200" height="160">
	    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
		<div class="form-floating">
	      <input type="text" class="form-control" id="id" name = "id" required onkeyup = "idChkr()">
	      <label for="id">아이디</label>
	      <span id = "idSpan"></span>
	    </div>
	    <div class="form-floating">
	      <input type="password" class="form-control" id="password" name = "password" required onkeyup = "pwChkr()">
	      <label for="password">비밀번호</label>
	    </div>
	    <div class="form-floating">
	      <input type="password" class="form-control" id="pwChk" name = "pwChk" required onkeyup = "pwChkr()">
	      <label for="pwChk">비밀번호 확인</label>
	      <span id = "pwSpan"></span>
	    </div>
		 <div class="form-floating">
	      <input type="text" class="form-control" name = "name" id = "name" required>
	      <label for="name">이름</label>
	    </div>
	    <div class="form-floating">
	      <input type="email" class="form-control" id="email" name = "email" required>
	      <label for="email">이메일[선택]</label>
	    </div>
	   <!--  <div class="checkbox mb-3">
	      <label>
	        <input type="checkbox" value="remember-me"> Remember me
	      </label>
	    </div> -->
	    <input type = "submit" class="w-100 btn btn-lg btn-primary" value = "sign in" id = "join">
	    <p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
	  </form>
	</main>
<%@ include file = "/footer.jsp" %>  
<script>


var idCnt = 0
var pwCnt = 0

$('#join').click(function(event){
	event.preventDefault();
	var idReg = /^[a-z0-9]{4,7}$/g;
	if((pwCnt==0)||("이미 사용중인 아이디" == $('#idSpan').text().trim())
			||(idCnt==0)){
		alert('아이디 및 비밀번호를 확인해주세요')
		
	}	
	else if($('#name').val()==''){
		alert('이름을 입력해주세요')
	}
	/* else if(emailCheck() == false){
		alert("이메일을 입력해주세요")
	} */
	else{
		$('#joinFrm').submit()
	}
})

function idChkr(){
	var idReg = /^[a-z0-9]{5,10}$/g;
 	if(!idReg.test($('#id').val())){
		$('#idSpan').text("영문자로 시작하는 5~10자 영문자/숫자만 가능").css("color","red");
		idCnt=0;
	}//이미 있는 아이디확인 ismember로
 	else{
 		$('#idSpan').text("사용가능한 아이디").css("color","blue")
 		idCnt=1;
	}
}
/* $('#idChkBtn').click(function(){
	if($('#id').val().length>=5){
		$.ajax({
			url : 'idChkProc.jsp',
			type : 'post',
			data : {
				'id':$('#id').val()
				},
			dataType : 'text',
			success: function(result){
				$('#idSpan').text(result)
			},
			error: function(XHR,status,error){
				console.log('error')
			}
		})
	}
	else{
		$('#idSpan').text('5자리 이상입력해주세요')
	}
	
}) */
/* $('#pwChkBtn').click(function(){
	if($('#pw').val().length >= 5 && $('#pwChk').val().length >= 5){
		if($('#pw').val()==$('#pwChk').val()){
			$('#pwSpan').text('비밀번호 일치')
		}else{
			$('#pwSpan').text('비밀번호 불일치')
		} 
	}
	else{
		$('#pwSpan').text('5자리 이상입력해주세요')
	}
	 
}) */
function pwChkr(){
	if($('#password').val().length >= 4 && $('#password').val().length <=10){
		if($('#password').val()==$('#pwChk').val()){
			$('#pwSpan').text('비밀번호 일치').css("color","blue")
			pwCnt = 1;
		}else{
			$('#pwSpan').text('비밀번호 불일치').css("color","red")
			pwCnt = 0;
		} 
	}
	else{
		$('#pwSpan').text('4~10자리를 입력해주세요').css("color","red")
		pwCnt = 0;
	}
	 
}
/* function setEmail(email3){		 
	var email2 = document.joinFrm.email2;
	if(email3.value == 'direct'){
		email2.readOnly = false;  
		email2.focus();			  
		email2.value = ''; 		  
	} else {
		email2.value = email3.value;
		email2.readOnly = true;
	}
}
function emailCheck(){
	var email1 = $('#email1').val().trim()
	var email2 = $('#email2').val().trim()
	
	if(email1 == '' || email2 == ''){
		return false;
	}
	else{ 
		$('#email').val(email1 + '@' + email2);
		return true;
	}
} */
</script> 
</body>
</html>