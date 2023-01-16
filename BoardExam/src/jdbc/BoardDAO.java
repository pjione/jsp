package jdbc;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import util.ConnectionPool;

public class BoardDAO {
	//테이블에 데이터를 입력하는 메서드
	
	public static int insert(String btitle, String bwriter, String bcontent) throws NamingException, SQLException {
	
		String sql = "INSERT INTO board(btitle,bwriter,bcontent) VALUES(?,?,?)";
		//커넥션 풀 사용
		Connection conn = ConnectionPool.get();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, btitle);
		pstmt.setString(2, bwriter);
		pstmt.setString(3, bcontent);
			
		return pstmt.executeUpdate();
		
	}
	public static List<BoardDTO> getList() throws NamingException, SQLException {
		
		String sql = "SELECT * FROM board";
		
		Connection conn = ConnectionPool.get();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		List<BoardDTO> bdtoList = new ArrayList<BoardDTO>();
		
		while(rs.next()) {
			bdtoList.add(new BoardDTO(rs.getString(1),
										rs.getString(2),
										rs.getString(3),
										rs.getString(4),
										rs.getString(5)));
		}
		
		return bdtoList;	
	}
	public static BoardDTO getDetail(String bno) throws NamingException, SQLException {
		String sql = "SELECT * FROM board WHERE bno = ?";
		Connection conn = ConnectionPool.get();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bno);
		
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		
		return new BoardDTO(rs.getString(1),
				rs.getString(2),
				rs.getString(3),
				rs.getString(4),
				rs.getString(5));
		
		
	}
}
