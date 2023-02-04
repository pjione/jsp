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
	<form action = "signoutCheck.jsp" method = "post">
		id<input type = "text" name = "id">
		password<input type = "password" name = "password">
		<input type = "submit" value = "submit">
	</form>
</body>
</html>