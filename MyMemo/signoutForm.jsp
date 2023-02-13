<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<%@ include file = "/header.jsp" %>
	<link href="/css/sign-in.css" rel="stylesheet">
	<main class="form-signin w-100 m-auto">
	  <form action = "signoutCheck.jsp" method = "post" id = "outFrm">
	    <h1 class="h3 mb-3 fw-normal">회원탈퇴</h1>
		<div class="form-floating">
	      <input type="text" class="form-control" id="id" name = "id" readonly value ="<%=sid%>">
	      <label for="id">아이디</label>
	    </div>
	    <div class="form-floating">
	      <input type="password" class="form-control" id="password" name = "password" required>
	      <label for="password">비밀번호</label>
	    </div>
	    <input type = "submit" class="w-100 btn btn-lg btn-primary" value = "Edit" id = "out">
	    <p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
	  </form>
	</main>
<%@ include file = "/footer.jsp" %>  

</body>
</html>