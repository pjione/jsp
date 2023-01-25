package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.NamingException;

import util.ConnectionPool;

public class UserDAO {
public static int join(String to, String pass, String name, String content) throws NamingException, SQLException {
		
		String sql = "INSERT INTO user VALUES(?,?,?,?)";
		//커넥션 풀 사용
		Connection conn = ConnectionPool.get();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, to);
		pstmt.setString(2, pass);
		pstmt.setString(3, name);
		pstmt.setString(4, content);
			
		return pstmt.executeUpdate();
		
	}
}
