package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import util.ConnectionPool;

public class FboardDAO {
	
	public static int insert(String btitle, String bwriter, String bcontent, String bfile, String bfile2) throws NamingException, SQLException {
		
		String sql = "INSERT INTO fboard(btitle,bwriter,bcontent,bfile,bfile2) VALUES(?,?,?,?,?)";
		//커넥션 풀 사용
		Connection conn = ConnectionPool.get();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, btitle);
		pstmt.setString(2, bwriter);
		pstmt.setString(3, bcontent);
		pstmt.setString(4, bfile);
		pstmt.setString(5, bfile2);
			
		return pstmt.executeUpdate();
		
	}
public static List<FboardDTO> getList() throws NamingException, SQLException {
		
		String sql = "SELECT * FROM fboard";
		
		Connection conn = ConnectionPool.get();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		List<FboardDTO> fbdtoList = new ArrayList<FboardDTO>();
		
		while(rs.next()) {
			fbdtoList.add(new FboardDTO(rs.getString(1),
										rs.getString(2),
										rs.getString(3),
										rs.getString(4),
										rs.getString(5),
										rs.getString(6),
										rs.getString(7)));
		}
		
		return fbdtoList;	
	}
}
