package jdbc;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import util.ConnectionPool;

public class UserDAO {
	PreparedStatement pstmt;
	ResultSet rs;
	Connection conn;
	String sql;
	public UserDAO(){
		try {
			conn = ConnectionPool.get();
		} catch (NamingException | SQLException e) {
		}
	}
	
	public static List<User> getList() throws NamingException, SQLException {
			
			String sql = "SELECT * FROM user2";
			
			Connection conn = ConnectionPool.get();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			List<User> userList = new ArrayList<User>();
			
			while(rs.next()) {
				userList.add(new User(rs.getString(1),
											rs.getInt(2),
											rs.getString(3),
											rs.getString(4)));
			}
			
			return userList;	
		}
	public List<User> search(String userName){
		sql = "SELECT * FROM user2 WHERE userName Like ?";
		List<User> userList = new ArrayList<User>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + userName + "%");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				userList.add(new User(rs.getString(1),
											rs.getInt(2),
											rs.getString(3),
											rs.getString(4)));
				
			}
			conn.close();
		} catch (SQLException e) {		
			e.printStackTrace();
		}
		
		return userList;	
	}
	public String getListJSON(){
		sql = "SELECT * FROM user2";
		JSONArray userList = new JSONArray();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("userName", rs.getString("userName"));
				obj.put("userAge", rs.getInt("userAge"));
				obj.put("userGender", rs.getString("userGender"));
				obj.put("userEmail", rs.getString("userEmail"));
				userList.add(obj);
				
			}
			conn.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userList.toJSONString();
	}

	public int register(User user) {
		String SQL = "INSERT INTO user2 VALUES (?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserName());
			pstmt.setInt(2, user.getUserAge());
			pstmt.setString(3, user.getUserGender());
			pstmt.setString(4, user.getUserEmail());
			return pstmt.executeUpdate(); // return 1 (행의 수)
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

}