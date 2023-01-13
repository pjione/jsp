<%@page import="javax.websocket.SendResult"%>
<%@page import="org.apache.catalina.ha.backend.Sender"%>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="org.apache.tomcat.dbcp.dbcp2.PStmtKey"%>
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
	
	String sql = "SELECT * FROM student";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	//step 5 excute SQL query
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()){
		String hakbun = rs.getString("hakbun");
		String name = rs.getString("name");
		String dept = rs.getString("dept");
		String addr = rs.getString("addr");
		
		%>
		<%=hakbun %> |
		<%=name %> |
		<%=dept %> |
		<%=addr %><br>
		<% 
		
	}
	
	
	pstmt.close();
	conn.close();
	rs.close();
%>
	
</body>
</html>