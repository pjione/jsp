<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
 <!-- Custom styles for this template -->
 <link href="sign-in.css" rel="stylesheet">
</head>
<body class="text-center">
	<%@ include file = "header.jsp" %>
	<main class="form-signin w-100 m-auto">
		<form action = "loginCheck.jsp" method = "post"m>
	    <img class="mb-4" src="http://austiny.snu.ac.kr/image/mine.jpg" alt="" width="72" height="57">
	    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
	
	    <div class="form-floating">
	      <input type="text" class="form-control" id="floatingInput" name = "id">
	      <label for="floatingInput">아이디</label>
	    </div>
	    <div class="form-floating">
	      <input type="password" class="form-control" id="floatingPassword" name = "password">
	      <label for="floatingPassword">패스워드</label>
	    </div>
	    <button class="w-100 btn btn-lg btn-primary" type="submit">Log in</button>
	    <p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
	  </form>
  </main>
  <%@ include file = "footer.jsp" %>
</body>
</html>