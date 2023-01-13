
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
	
	String sql = "INSERT INTO student VALUES(?,?,?,?)";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("hakbun"));
	pstmt.setString(2, request.getParameter("name"));
	pstmt.setString(3, request.getParameter("dept"));
	pstmt.setString(4, request.getParameter("addr"));
	
	//step 5 excute SQL query
	pstmt.executeUpdate();
	
	response.sendRedirect("TBList.jsp");
	
%>

</body>
</html>