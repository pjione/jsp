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

public class FeedDAO {
	
	private String sql;
	private PreparedStatement pstmt;
	private Connection conn;
	private ResultSet rs;
	public FeedDAO() {
		try {conn = ConnectionPool.get();} catch (NamingException | SQLException e) {e.printStackTrace();}
	}
	public boolean delete(String no) {
		sql = "DELETE FROM feed WHERE no = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			if(pstmt.executeUpdate() == 1) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
			if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
		}
		return false;
	}
	public boolean insert(String id, String content){
		sql = "INSERT INTO feed(id,content) VALUES(?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, content);
			if(pstmt.executeUpdate()==1) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			 if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
	         if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
		}
		return false;		
	}
	
	
//	public List<FeedDTO> getAllList() {	
//		sql = "SELECT * FROM feed ORDER BY ts DESC";
//		List<FeedDTO> feedList = new ArrayList<>();
//		try {
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				feedList.add(new FeedDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4)));
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
//			if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
//			if (rs != null) try { rs.close(); } catch (SQLException e) {e.printStackTrace();}
//		}
//		return feedList;
//	}	
	public List<FeedDTO> getList(String id) {	
		sql = "SELECT * FROM feed WHERE id = ? ORDER BY ts DESC";
		List<FeedDTO> feedList = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				feedList.add(new FeedDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
			if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
			if (rs != null) try { rs.close(); } catch (SQLException e) {e.printStackTrace();}
		}
		return feedList;
	}	

	public String getList() {	
		sql = "SELECT * FROM feed ORDER BY ts DESC";
		//List<FeedDTO> feedList = new ArrayList<>();
		JSONArray feedList = new JSONArray();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				//feedList.add(new FeedDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4)));
				JSONObject obj = new JSONObject();
				obj.put("no", rs.getInt(1));
				obj.put("id", rs.getString(2));
				obj.put("content", rs.getString(3));
				obj.put("ts", rs.getString(4));
				
				feedList.add(obj);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(Exception e) {e.printStackTrace();}
			if (conn != null) try { conn.close(); } catch(Exception e) {e.printStackTrace();}
			if (rs != null) try { rs.close(); } catch (SQLException e) {e.printStackTrace();}
		}
		return feedList.toJSONString();
	}	
}
