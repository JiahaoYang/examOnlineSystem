package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;


import entity.Question;

public class QuestionUtil {
	public ArrayList<Question> getQuestionsByType(String course, int cnt, int type) {
		String sql = "select * from question where ques_course=? and ques_type=? ";
		ArrayList<Question> allQuestions = new ArrayList<>();
		ArrayList<Question> randQuestions = new ArrayList<>();
		
		try (Connection conn = DBUtil.getConnection();
				PreparedStatement st = conn.prepareStatement(sql);) {
			st.setString(1, course);
			st.setInt(2, type);
			Question question = null;
			
			try (ResultSet rs = st.executeQuery();) {
				while (rs.next()) {
					question = new Question();
					question.setId(rs.getInt(1));
					question.setType(type);
					question.setCourse(course);
					question.setQues(rs.getString(4));
					question.setKeyA(rs.getString(5));
					question.setKeyB(rs.getString(6));
					question.setKeyC(rs.getString(7));
					question.setKeyD(rs.getString(8));
					question.setAnswer(rs.getString(9));
					allQuestions.add(question);
				}
				
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		Random rand = new Random();
		for (int i = 0; i < cnt; ++i) {
			int index = rand.nextInt(allQuestions.size());
			randQuestions.add(allQuestions.get(index));
			allQuestions.remove(index);
		}
		return randQuestions;
	}
	
	public List<Question> getAnswers() {
		List<Question> answers = new ArrayList<>();
		String sql = " select ques_id, ques_type, answer from question where "
				+ "ques_type in (1,2,3) order by ques_type, ques_type ";
		try (Connection conn = DBUtil.getConnection();
				Statement st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql)) {
			while (rs.next()) {
				Question question = new Question();
				question.setId(rs.getInt("ques_id"));
				question.setType(rs.getInt("ques_type"));
				question.setAnswer(rs.getString("answer"));
				
				answers.add(question);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return answers;
	}
	
	public ArrayList<Question> getAllQuestions() {
		ArrayList<Question> questions = new ArrayList<>();
		String sql = " select * from question order by ques_course, ques_type ";
		try (Connection conn = DBUtil.getConnection();
				Statement st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql)) {
			Question question = null;
			while (rs.next()) {
				question = new Question();
				question.setId(rs.getInt("ques_id"));
				question.setType(rs.getInt("ques_type"));
				question.setCourse(rs.getString("ques_course"));
				question.setQues(rs.getString("ques_content"));
				question.setKeyA(rs.getString("opt_a"));
				question.setKeyB(rs.getString("opt_b"));
				question.setKeyC(rs.getString("opt_c"));
				question.setKeyD(rs.getString("opt_d"));
				question.setAnswer(rs.getString("answer"));
				
				questions.add(question);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return questions;
	}
	
	public Question getQuestionById(int id) {
		Question question = null;
		String sql = " select * from question where ques_id=? ";
		try (Connection conn = DBUtil.getConnection();
				PreparedStatement st = conn.prepareStatement(sql)) {
			st.setInt(1, id);
			try (ResultSet rs = st.executeQuery()) {
				if (rs.next()) {
					question = new Question();
					question.setId(id);
					question.setType(rs.getInt("ques_type"));
					question.setCourse(rs.getString("ques_course"));
					question.setQues(rs.getString("ques_content"));
					question.setKeyA(rs.getString("opt_a"));
					question.setKeyB(rs.getString("opt_b"));
					question.setKeyC(rs.getString("opt_c"));
					question.setKeyD(rs.getString("opt_d"));
					question.setAnswer(rs.getString("answer"));
				}
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return question;
	}
	
	public boolean updateQuestion(Question question) {
		boolean flag = false;
		String sql = " update question set ques_type=?, ques_course=?, ques_content=?,"
						+ "opt_a=?, opt_b=?, opt_c=?, opt_d=?, answer=? where ques_id=? ";
		try (Connection conn = DBUtil.getConnection();
				PreparedStatement st = conn.prepareStatement(sql)) {
			st.setInt(1, question.getType());
			st.setString(2, question.getCourse());
			st.setString(3, question.getQues());
			st.setString(4, question.getKeyA());
			st.setString(5, question.getKeyB());
			st.setString(6, question.getKeyC());
			st.setString(7, question.getKeyD());
			st.setString(8, question.getAnswer());
			st.setInt(9, question.getId());
			
			int cnt = st.executeUpdate();
			if (cnt != 0)
				flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
}
