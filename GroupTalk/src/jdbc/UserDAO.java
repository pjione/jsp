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

import com.mysql.cj.protocol.Resultset;

import util.ConnectionPool;

public class UserDAO {
	
	private String sql;
	private PreparedStatement pstmt;
	private Connection conn;
	private ResultSet rs;
	public UserDAO() {
		try {conn = ConnectionPool.get();} catch (NamingException | SQLException e) {e.printStackTrace();}
	}
	public boolean edit(String id, String password, String name, String email){
		sql = "UPDATE user SET password = ?, name = ?, email = ? where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, password);
			pstmt.setString(2, name);
			pstmt.setString(3, email);	
			pstmt.setString(4, id);
			if(pstmt.executeUpdate()==1) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			 if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
	         if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
		}
		return false;		
	}
	
	public boolean join(String id, String password, String name){
		sql = "INSERT INTO user(id,password,name,email) VALUES(?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			pstmt.setString(3, name);	
			pstmt.setString(4, name);
			if(pstmt.executeUpdate()==1) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			 if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
	         if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
		}
		return false;		
	}
	//회원 가입시 아이디가 이미 존재하는 지 여부 확인
	public boolean exist(String id) {
		sql = "SELECT * FROM user WHERE id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			return rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
			if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
			if (rs != null) try { rs.close(); } catch (SQLException e) {e.printStackTrace();}
		}
		return false;
	}
	// 회원 탈퇴
	public boolean delete(String id) {
		sql = "DELETE FROM user WHERE id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			if(pstmt.executeUpdate() == 1) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
			if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
		}
		return false;
	}
	//회원 로그인
	public int login(String id, String password) {
		
		sql = "SELECT * FROM user WHERE id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (!rs.next()) return -1; //디비에 회원 정보가 전혀 없는 경우
			if (!password.equals(rs.getString("password"))) return 0; // 비번만 틀린 경우
			return 1; // 아이디와 비번이 모두 일치하는 경우
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
			if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
			if (rs != null) try { rs.close(); } catch (SQLException e) {e.printStackTrace();}
		}
		return 2;
	}
	public List<UserDTO> list() {	
		sql = "SELECT * FROM user ORDER BY ts DESC";
		List<UserDTO> userList = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				userList.add(new UserDTO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
			if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
			if (rs != null) try { rs.close(); } catch (SQLException e) {e.printStackTrace();}
		}
		return userList;
	}	
	public String getListAJAX() {	
		sql = "SELECT * FROM user ORDER BY ts DESC";
		//List<FeedDTO> feedList = new ArrayList<>();
		JSONArray userList = new JSONArray();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				//feedList.add(new FeedDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4)));
				JSONObject obj = new JSONObject();
				obj.put("id", rs.getString(1));
				obj.put("password", rs.getString(2));
				obj.put("name", rs.getString(3));
				obj.put("ts", rs.getString(4));
				
				userList.add(obj);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
			if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
			if (rs != null) try { rs.close(); } catch (SQLException e) {e.printStackTrace();}
		}
		return userList.toJSONString();
	}	
}
