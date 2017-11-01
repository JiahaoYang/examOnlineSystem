package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entity.User;

public class UserUtil {
	
	public ArrayList<User> getAdmins() {
		String sql = " select user_id, user_name, user_type from user where user_type=1 order by user_id ";
		ArrayList<User> admins = new ArrayList<>();
		User admin = null;
		
		try (Connection conn = DBUtil.getConnection();
				Statement st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql)) { 
			
			while (rs.next()) {
				admin = new User();
				admin.setId(rs.getString("user_id"));
				admin.setName(rs.getString("user_name"));
				admin.setType(rs.getInt("user_type"));
				
				admins.add(admin);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return admins;
	}
	public boolean addUser(User user) {
		boolean flag = false;
		String sql = " insert user values(?,?,?,?) ";
		try (Connection conn = DBUtil.getConnection();
				PreparedStatement st = conn.prepareStatement(sql)) {
			st.setString(1, user.getId());
			st.setString(2, user.getName());
			st.setString(3, user.getPassword());
			st.setInt(4, user.getType());
			
			int cnt = st.executeUpdate();
			if (cnt != 0)
				flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public boolean deleteUser(String userId) {
		boolean flag = false;
		String sql = " delete from user where user_id=? ";
		try (Connection conn = DBUtil.getConnection();
				PreparedStatement st = conn.prepareStatement(sql)) {
			st.setString(1, userId);
			
			int cnt = st.executeUpdate();
			if (cnt != 0)
				flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public boolean checkUser(String userId, String password, int type) {
		boolean falg = false;
		String sql = " select * from user where user_id=? "
				+ "and password=? and user_type=? ";
		try (Connection conn = DBUtil.getConnection();
				PreparedStatement st = conn.prepareStatement(sql)) {
			st.setString(1, userId);
			st.setString(2, password);
			st.setInt(3, type);
			
			try (ResultSet rs = st.executeQuery()) {
				if (rs.next()) 
					falg = true;
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return falg;
	}
	
	//验证用户名，用户类型
	public boolean checkUser(String userId, int type) {
		boolean falg = false;
		String sql = " select * from user where user_id=? "
				+ "and user_type=? ";
		try (Connection conn = DBUtil.getConnection();
				PreparedStatement st = conn.prepareStatement(sql)) {
			st.setString(1, userId);
			st.setInt(2, type);
	
			try (ResultSet rs = st.executeQuery()) {
				if (rs.next()) 
					falg = true;
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return falg;
	}
	
	
	public User getUser(String userId) {
		String sql = " select * from user where user_id=? ";
		User user = null;
		
		try (Connection conn = DBUtil.getConnection();
				PreparedStatement st = conn.prepareStatement(sql);) {
			st.setString(1, userId);
			
			try (ResultSet rs = st.executeQuery()) {
				if (rs.next()) {
					user = new User();
					String name = rs.getString("user_name");
					int type = rs.getInt("user_type");
					
					user.setId(userId);
					user.setName(name);
					user.setType(type);
				}
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return user;
	}
	
	public ArrayList<User> getAllUsers() {
		String sql = " select user_id, user_name, user_type from user order by user_type, user_id ";
		ArrayList<User> users = new ArrayList<>();
		User user = null;
		
		try (Connection conn = DBUtil.getConnection();
				Statement st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql)) { 
			
			while (rs.next()) {
				user = new User();
				user.setId(rs.getString("user_id"));
				user.setName(rs.getString("user_name"));
				user.setType(rs.getInt("user_type"));
				
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;
	}
}
