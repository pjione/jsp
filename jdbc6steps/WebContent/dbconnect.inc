
<%
	// 2 load JDBC Driver
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}catch(ClassNotFoundException err){
		out.print("JDBC Driver loading error<br>" + err.getMessage());
	}

	// step 3 create Connection OBject
	Connection conn = null;
	try{
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/","root","0000");
	}catch(SQLException err){
		out.print("Connection OBject error<br>" + err.getMessage());
	}
%>
	