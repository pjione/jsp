<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if(session.getAttribute("sid") == null){
			out.print("로그인한 회원만 접근 가능한 페이지 입니다.");
		} else{
			out.print(session.getAttribute("sid") + "님 환영합니다.");
		}
	%>
</body>
</html>