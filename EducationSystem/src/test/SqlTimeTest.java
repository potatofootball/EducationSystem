package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.DBUtil;

public class SqlTimeTest {

	public static void main(String[] args) {
		Connection conn = DBUtil.getConnection();
		String sql = "insert into test (time) values (?)";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setDate(1, new java.sql.Date(new java.util.Date().getTime()));
			ptmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
//		String sql = "select * from test";
//		try {
//			Statement stmt = conn.createStatement();
//			ResultSet rs = stmt.executeQuery(sql);
//			while (rs.next()) {
//				java.sql.Date sqlDate = rs.getDate("time");
//				System.out.println(new java.util.Date(sqlDate.getTime()));
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
	}
}
