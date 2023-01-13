<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!--  step1 : import SQL Packages -->
<%@ page import = "java.sql.*" %>
<%@ page import = "jdbc6steps.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	
	Connection conn = dbconnclose.getConnection();
	//step 4 create Statement object
	PreparedStatement pstmt = conn.prepareStatement("DROP DATABASE test6");
	
	//step 5 excute SQL query
	pstmt.executeUpdate();
	
	dbconnclose.closeConnection(pstmt, conn);
	
%>


</body>
</html>