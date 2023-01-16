<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% // 전송 받는 데이터 한글 처리 
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Board</title>
</head>
<body>
<%
	String btitle = request.getParameter("btitle");
	String bwriter = "작성자";
	String bcontent = request.getParameter("bcontent");
	
	int result = BoardDAO.insert(btitle,bwriter,bcontent);
	
	if (result == 1) {
		out.print("등록 성공");
	} else {
		out.print("등록 실패");
	}

%>
</body>
</html>