package jdbc6steps;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class dbconnclose {
	
	//DB 연결 공통부분 메서드
	public static Connection getConnection() {
	// 2 load JDBC Driver
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}catch(ClassNotFoundException err){
		System.out.println("JDBC Driver loading error<br>" + err.getMessage());
	}

	// step 3 create Connection OBject
	Connection conn = null;
	try{
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/","root","0000");
	}catch(SQLException err){
		System.out.println("Connection OBject error<br>" + err.getMessage());
	}
		return conn;
		
	}
	//DB 해제 공통부분 메서드
	public static void closeConnection(Statement pstmt, Connection conn) {
		//step 6 close Connection (java9부터 생략 가능)
		try {
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
	

