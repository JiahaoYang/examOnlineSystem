package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entity.Paper;

public class PaperUtil {
	public boolean createPaper(String userId, String course, int score) {
		boolean flag = false;
		String sql = " insert paper(user_id, paper_course, score) values(?,?,?) ";
		try (Connection conn = DBUtil.getConnection();
				PreparedStatement st = conn.prepareStatement(sql)) {
			st.setString(1, userId);
			st.setString(2, course);
			st.setInt(3, score);
			
			int cnt = st.executeUpdate();
			if (cnt != 0)
				flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public ArrayList<Paper> getPapers(String course) {
		ArrayList<Paper> papers = new ArrayList<>();
		String sql = " select user_id, score from paper where paper_course=? ";
		Paper paper = null;
		
		try (Connection conn = DBUtil.getConnection();
				PreparedStatement st = conn.prepareStatement(sql)) {
			
			st.setString(1, course);
			try (ResultSet rs = st.executeQuery()) {
				while (rs.next()) {
					paper = new Paper();
					paper.setCourse(course);
					paper.setUserId(rs.getString("user_id"));
					paper.setScore(rs.getInt("score"));
					
					papers.add(paper);
				}
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return papers;
	}
}
