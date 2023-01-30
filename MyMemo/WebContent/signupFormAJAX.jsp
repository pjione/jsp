<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
 <!-- Custom styles for this template -->
 <link href="sign-in.css" rel="stylesheet">
</head>
<body>
<%@ include file = "header.jsp" %>
<body class="text-center">
	<main class="form-signin w-100 m-auto">
	  
	    <img class="mb-4" src="http://austiny.snu.ac.kr/image/mine.jpg" alt="" width="72" height="57">
	    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
	
	    <div class="form-floating">
	      <input type="text" class="form-control" id="id" name = "id">
	      <label for="id">아이디</label>
	    </div>
	    <div class="form-floating">
	      <input type="password" class="form-control" id="password" name = "password">
	      <label for="password">비밀번호</label>
	    </div>
		 <div class="form-floating">
	      <input type="text" class="form-control"  id = "name" name = "name">
	      <label for="name">이름</label>
	    </div>
	    
	   <!--  <div class="checkbox mb-3">
	      <label>
	        <input type="checkbox" value="remember-me"> Remember me
	      </label>
	    </div> -->
	    <button class="w-100 btn btn-lg btn-primary" id = signin onclick = "signin()" type="submit">Sign in</button>
	    <p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
	  
	</main>
<%@ include file = "footer.jsp" %>   
<script>
function signin(){
	 $.ajax({
		 type : 'post',
			url : "signupCheckAJAX2.jsp",
			data : {
				id:encodeURIComponent(document.getElementById('id').value),
				password:(document.getElementById('password').value),
				name:(document.getElementById('name').value),
			},
			dataType : 'text',
			success : function(result) {
				var id = document.getElementById('id');
				var password = document.getElementById('password');
				var name = document.getElementById('name');
				id.value = "";
				password.value = "";
				name.value = "";

			},
			error : function(error) {
				console.log(error);
			}
					
		});
	
	
}

	
</script>
</body>
</html>