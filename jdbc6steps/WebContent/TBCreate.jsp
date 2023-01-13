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
<%
	//quiz 1 테이블을 jsp로 생성
	//테이블명 student (univ DB 이용)
	//hakbun , name, dept, addr
	// 2 load JDBC Driver
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}catch(ClassNotFoundException err){
		out.print("JDBC Driver loading error<br>" + err.getMessage());
	}

	// step 3 create Connection OBject
	Connection conn = null;
	try{
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/univ","root","0000");
	}catch(SQLException err){
		out.print("Connection OBject error<br>" + err.getMessage());
	}
	
	//step 4 create Statement object
	String sql = "CREATE TABLE student("
			+"hakbun varchar(10),"
			+"name varchar(10),"
			+"dept varchar(20),"
			+"addr varchar(30),"
			+"primary key(hakbun))";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	//step 5 excute SQL query
	pstmt.executeUpdate();
	
%>

</body>
</html>