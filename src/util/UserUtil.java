package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entity.User;

public class UserUtil {
	//验证用户名，密码，用户类型
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
	
	public int isSubmit(String userId, String course, String testTime) {
		int falg = 2;	//0：未提交，1：已提交，2：无记录
		String sql = " select falg from user_flag "
				+ "where user_id=? and course=? and test_time=? ";
		try (Connection conn = DBUtil.getConnection();
				PreparedStatement st = conn.prepareStatement(sql)) {
			st.setString(1, userId);
			st.setString(2, course);
			st.setString(3, testTime);
	
			try (ResultSet rs = st.executeQuery()) {
				if (rs.next()) 
					falg = rs.getInt(1);
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
}
