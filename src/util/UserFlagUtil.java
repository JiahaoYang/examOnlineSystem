package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserFlagUtil {
	public int isSubmit(String userId, String course, String testTime) {
		int flag = 2;	//0：未提交，1：已提交，2：无记录
		String sql = " select flag from user_flag "
				+ "where user_id=? and course=? and test_time=? ";
		try (Connection conn = DBUtil.getConnection();
				PreparedStatement st = conn.prepareStatement(sql)) {
			st.setString(1, userId);
			st.setString(2, course);
			st.setString(3, testTime);
	
			try (ResultSet rs = st.executeQuery()) {
				if (rs.next()) 
					flag = rs.getInt(1);
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return flag;
	}
	
	public boolean setUserFlag(String userId, String course, String testTime) {
		boolean flag = false;
		String sql = "";
		if (this.isSubmit(userId, course, testTime) != 2)
			sql = " update user_flag set flag = 1 where "
					+ "user_id=? and course=? and test_time=? ";
		else
			sql = " insert user_flag(user_id, course, test_ime, flag) values(?,?,?,1) ";
		try (Connection conn = DBUtil.getConnection();
				PreparedStatement st = conn.prepareStatement(sql)) {
			st.setString(1, userId);
			st.setString(2, course);
			st.setString(3, testTime);
			
			int cnt = st.executeUpdate();
			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
}
