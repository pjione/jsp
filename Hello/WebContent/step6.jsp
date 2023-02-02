<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Step 1 import SQL Packages  -->
<%@ page import="java.sql.*" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//Step 2 load JDBC Driver
	try {
		Class.forName("com.mysql.jdbc.Driver");
	}catch(ClassNotFoundException err) {
		out.print("JDBC Driver loading error<br>" + err.getMessage());
	}

// Step 3 create Connection Object 

	Connection conn = null;

	try {
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pjwon1120","pjwon1120","asdf6570875");
	}catch(SQLException err) {
		out.print("Connection Object error<br>" + err.getMessage());
	}

// Step 4 create Statement Object

	String sql = "CREATE TABLE student("
			+ "hakbun	varchar(10),"
			+ "name		varchar(10),"	
			+ "dept 	varchar(20),"	
			+ "addr		varchar(30),"
			+ "primary key(hakbun))";
	

	PreparedStatement pstmt = conn.prepareStatement(sql);

// Step 5 excute SQL Query

	pstmt.executeUpdate();
	
//	Step 6 close Connection 

	pstmt.close();
	conn.close();

%>
</body>
</html>