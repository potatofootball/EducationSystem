package test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.DBUtil;

public class DBUtilTest {

	public static void main(String[] args) throws SQLException {
		Connection connection = DBUtil.getConnection();
		Statement stmt = connection.createStatement();
		stmt.executeQuery("select * from student");
		ResultSet rs = stmt.getResultSet();
		while (rs.next()) {
			System.out.println(rs.getInt("number"));
		}
	}
}
