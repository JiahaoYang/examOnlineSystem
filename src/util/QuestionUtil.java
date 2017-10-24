package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

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
}
