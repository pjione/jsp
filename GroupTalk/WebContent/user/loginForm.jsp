<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 
</head>
<body class="text-center">
	<%@ include file = "/header.jsp" %>
	<!-- Custom styles for this template -->
	<link href="/css/sign-in.css" rel="stylesheet">
	<main class="form-signin w-100 m-auto">
		<form action = "loginCheck.jsp" method = "post">
	    <img class="mb-4" src="/etc/main.jpg" alt="" width="200" height="160">
	    <h1 class="h3 mb-3 fw-normal">Please login</h1>
	
	    <div class="form-floating">
	      <input type="text" class="form-control" id="floatingInput" name = "id" required>
	      <label for="floatingInput">아이디</label>
	    </div>
	    <div class="form-floating">
	      <input type="password" class="form-control" id="floatingPassword" name = "password" required>
	      <label for="floatingPassword">패스워드</label>
	    </div>
	    <button class="w-100 btn btn-lg btn-primary" type="submit">Log in</button>
	    <p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
	  </form>
  </main>
  <%@ include file = "/footer.jsp" %>
</body>
</html>