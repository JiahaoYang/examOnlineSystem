package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entity.TestSet;

public class TestSetUtil {

	// 返回所有课程
	public ArrayList<String> getCourses() {
		String sql = " select distinct course from test_set ";
		ArrayList<String> courses = new ArrayList<>();

		try (Connection conn = DBUtil.getConnection();
				Statement st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql);) {
			while (rs.next()) {
				String course = rs.getString(1);
				courses.add(course);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return courses;
	}
	
	public TestSet getTestSet(String course, String testTime) {
		TestSet ts = null;
		String sql = " select * from test_set where course=? and test_time=? ";
		try (Connection conn = DBUtil.getConnection();
				PreparedStatement st = conn.prepareStatement(sql)) {
			st.setString(1, course);
			st.setString(2, testTime);
	
			try (ResultSet rs = st.executeQuery()) {
				if (rs.next()) {
					ts = new TestSet();
					int judgeCnt = rs.getInt(2);
					int judgeScore = rs.getInt(3);
					int singleCnt = rs.getInt(4);
					int singleScore = rs.getInt(5);
					int mulCnt = rs.getInt(6);
					int mulScore = rs.getInt(7);
					int totalTime = rs.getInt(8);
					
					ts.setCourse(course);
					ts.setJudgeCnt(judgeCnt);
					ts.setJudgeScore(judgeScore);
					ts.setSingleCnt(singleCnt);
					ts.setSingleScore(singleScore);
					ts.setMulCnt(mulCnt);
					ts.setMulScore(mulScore);
					ts.setTotalTime(totalTime);
					ts.setTestTime(testTime);
				}
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return ts;
	}
	
	public int getTotalScore(TestSet ts) {
		return ts.getJudgeCnt()*ts.getJudgeScore() + 
				ts.getSingleCnt()*ts.getSingleScore() + 
				ts.getMulCnt()*ts.getMulScore();
	}
}
