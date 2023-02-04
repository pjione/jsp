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
<%@ include file = "header.jsp" %>
 <link href="sign-in.css" rel="stylesheet">
<body class="text-center">
	<main class="form-signin w-100 m-auto">
	  <form action = "signupCheck.jsp" method = "post">
	    <img class="mb-4" src="/etc/main.jpg" alt="" width="200" height="160">
	    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
	
	    <div class="form-floating">
	      <input type="email" class="form-control" id="floatingInput" name = "id" required>
	      <label for="floatingInput">이메일</label>
	    </div>
	    <div class="form-floating">
	      <input type="password" class="form-control" id="floatingPassword" name = "password" required>
	      <label for="floatingPassword">비밀번호</label>
	    </div>
		 <div class="form-floating">
	      <input type="text" class="form-control" id="floatingInput2" name = "name" id = "name" required>
	      <label for="floatingInput">이름</label>
	    </div>
	    
	   <!--  <div class="checkbox mb-3">
	      <label>
	        <input type="checkbox" value="remember-me"> Remember me
	      </label>
	    </div> -->
	    <input type = "submit" class="w-100 btn btn-lg btn-primary" value = "sign in">
	    <p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
	  </form>
	</main>
<%@ include file = "footer.jsp" %>   
</body>
</html>