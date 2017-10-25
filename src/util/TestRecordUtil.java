package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import entity.TestRecord;

public class TestRecordUtil {
	//插入考生的做题记录（题号，题目id，学号，考生答案，分数...）
	public boolean insertRecord(ArrayList<TestRecord> records) {
		boolean flag = false;
		String sql = " insert test_record values(?,?,?,?,?,?,?,?) ";
		try (Connection conn = DBUtil.getConnection();
				PreparedStatement st = conn.prepareStatement(sql)) {
			conn.setAutoCommit(false);	//关闭自动提交（所有操作在同一时间执行）
			
			for (TestRecord record : records) {
				st.setString(1, record.getUserId());
				st.setString(2, record.getCourse());
				st.setInt(3, record.getQuesId());
				st.setInt(4, record.getQuesNum());
				st.setInt(5, record.getQuesType());
				st.setString(6, record.getStuAnswer());
				st.setDouble(7, record.getScore());
				st.setString(8, record.getTestTime());
				
				st.addBatch();
			}
			int[] state = st.executeBatch();
			conn.commit();
			if (state != null)
				flag = true;
		}  catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
}
