package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entity.TestSet;

public class TestSetUtil {
	
	public boolean insertTest(TestSet testSet) {
		boolean flag = false;
		String sql = " insert test_set values(?,?,?,?,?,?,?,?,?) ";
		
		try (Connection conn = DBUtil.getConnection();
				PreparedStatement st = conn.prepareStatement(sql)) {
			
			st.setString(1, testSet.getCourse());
			st.setInt(2, testSet.getJudgeCnt());
			st.setInt(3, testSet.getJudgeScore());
			st.setInt(4, testSet.getSingleCnt());
			st.setInt(5, testSet.getSingleScore());
			st.setInt(6, testSet.getMulCnt());
			st.setInt(7, testSet.getMulScore());
			st.setInt(8, testSet.getTotalTime());
			st.setString(9, testSet.getTestTime());
			
			int cnt = st.executeUpdate();
			if (cnt != 0)
				flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public boolean deleteTest(String course) {
		boolean flag = false;
		String sql = " delete from test_set where course=? ";
		try (Connection conn = DBUtil.getConnection();
				PreparedStatement st = conn.prepareStatement(sql)) {
			st.setString(1, course);
			
			int cnt = st.executeUpdate();
			if (cnt != 0)
				flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public boolean updateTest(TestSet testSet) {
		boolean flag = false;
		String sql = " update test_set set judge_ques_num=?, judge_ques_score=?, "
					+ "single_ques_num=?, single_ques_score=?, muti_ques_num=?, muti_ques_score=?,"
					+ "total_time=?, test_time=? where course=? ";
		try (Connection conn = DBUtil.getConnection();
				PreparedStatement st = conn.prepareStatement(sql)) {
			st.setInt(1, testSet.getJudgeCnt());
			st.setInt(2, testSet.getJudgeScore());
			st.setInt(3, testSet.getSingleCnt());
			st.setInt(4, testSet.getSingleScore());
			st.setInt(5, testSet.getMulCnt());
			st.setInt(6, testSet.getMulScore());
			st.setInt(7, testSet.getTotalTime());
			st.setString(8, testSet.getTestTime());
			st.setString(9, testSet.getCourse());
			
			int cnt = st.executeUpdate();
			if (cnt != 0)
				flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

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
	
	public ArrayList<TestSet> getAllTests() {
		String sql = " select * from test_set ";
		ArrayList<TestSet> tests = new ArrayList<>();
		TestSet ts = null;
		try (Connection conn = DBUtil.getConnection();
				Statement st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql)) {
	
				while (rs.next()) {
					ts = new TestSet();
					String course = rs.getString(1);
					int judgeCnt = rs.getInt(2);
					int judgeScore = rs.getInt(3);
					int singleCnt = rs.getInt(4);
					int singleScore = rs.getInt(5);
					int mulCnt = rs.getInt(6);
					int mulScore = rs.getInt(7);
					int totalTime = rs.getInt(8);
					String testTime = rs.getString(9);
					
					ts.setCourse(course);
					ts.setJudgeCnt(judgeCnt);
					ts.setJudgeScore(judgeScore);
					ts.setSingleCnt(singleCnt);
					ts.setSingleScore(singleScore);
					ts.setMulCnt(mulCnt);
					ts.setMulScore(mulScore);
					ts.setTotalTime(totalTime);
					ts.setTestTime(testTime);
					
					tests.add(ts);
				} 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tests;
	}
}
