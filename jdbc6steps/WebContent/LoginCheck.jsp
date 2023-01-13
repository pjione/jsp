<%@page import="javax.websocket.SendResult"%>
<%@page import="org.apache.catalina.ha.backend.Sender"%>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="org.apache.tomcat.dbcp.dbcp2.PStmtKey"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!--  step1 : import SQL Packages -->
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
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
	
	String sql = "SELECT * FROM student WHERE hakbun = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	String hakbun = request.getParameter("hakbun");
	pstmt.setString(1, hakbun);
	//step 5 excute SQL query
	ResultSet rs = pstmt.executeQuery();
	
	
	if(rs.next()){
		String dbhakbun = rs.getString("hakbun");
		String dbname = rs.getString("name");
	
		if(hakbun.equals(dbhakbun)){
			session.setAttribute("hakbun", dbhakbun);
			session.setAttribute("name", dbname);
			
			out.print(session.getAttribute("hakbun") + "(" + session.getAttribute("name") + ") 님 방문을 환영합니다.<br>");
		}
		
	}
	else{
		out.print("<script>alert('해당 학번은 존재하지 않습니다.');"
				+ "history.back();"
				+ "</script>");
	}
	
	pstmt.close();
	conn.close();
	rs.close();
%>
	
</body>
</html>