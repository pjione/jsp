<%@page import="org.apache.tomcat.dbcp.dbcp2.PStmtKey"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!--  step1 : import SQL Packages -->
<%@ page import = "java.sql.*" %>
<% // 전송 받는 데이터 한글 처리 
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<Form action = "TBInsert.jsp">
	학번 <input type = "text" name = "hakbun"> 
	이름 <input type = "text" name = "name"> 
	전공<input type = "text" name = "dept"> 
	주소<input type = "text" name = "addr">
	<input type = "submit" value = "제출"> 
</Form>
</body>
</html>