<%@ page import = "jdbc.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% // 전송 받는 데이터 한글 처리 
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 목록</title>
</head>
<body>
<%
	String hakbun = request.getParameter("hakbun");
	StudentDTO student = StudentDAO.getDetail(hakbun);
%>
	<%=student.getHakbun() %>  |
	<%=student.getName() %>  |
	<%=student.getDept() %>  |
	<%=student.getAddr() %>  |

	
</body>
</html>