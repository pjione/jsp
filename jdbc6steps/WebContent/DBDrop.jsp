<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!--  step1 : import SQL Packages -->
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "dbconnect.inc" %>
<%
	
	
	//step 4 create Statement object
	PreparedStatement pstmt = conn.prepareStatement("DROP DATABASE test3");
	
	//step 5 excute SQL query
	pstmt.executeUpdate();
	
	
	
%>
<%@ include file = "dbclose.inc" %>

</body>
</html>