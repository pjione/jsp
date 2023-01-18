package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.mysql.cj.protocol.Resultset;

import util.ConnectionPool;

public class MemberDAO {
public static int insert(String mname, String mid, String mpass, String mgender, String meamil) throws NamingException, SQLException {
		
		String sql = "INSERT INTO member (mname,mid,mpass,mgender,memail) VALUES(?,?,?,?,?)";
		//커넥션 풀 사용
		Connection conn = ConnectionPool.get();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, mname);
		pstmt.setString(2, mid);
		pstmt.setString(3, mpass);
		pstmt.setString(4, mgender);
		pstmt.setString(5, meamil);
			
		return pstmt.executeUpdate();
		
	}
public static int login(String mid, String mpass) throws NamingException, SQLException {
	
	//C R U D
	String sql = "SELECT mid, mpass FROM member WHERE mid=?";
	
	
	//커넥션 풀 사용
	Connection conn = ConnectionPool.get();
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, mid);

	
	ResultSet rs = pstmt.executeQuery();
	
	if (!rs.next()) return 1; //디비에 회원 정보가 전혀 없는 경우
	if (!mpass.equals(rs.getString(2))) return 2; // 비번만 틀린 경우
	
	return 0; // 아이디와 비번이 모두 일치하는 경우
		
	
}
public static int exist(String memail) throws NamingException, SQLException {
	String sql = "SELECT * FROM member WHERE memail = ?";
	
	Connection conn = ConnectionPool.get();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, memail);
	ResultSet rs = pstmt.executeQuery();
	
	if(!rs.next()) return 1;
	
	return 0;
}
}
