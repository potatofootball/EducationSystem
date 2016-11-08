package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.DBUtil;

public class SqlTest {

	public static void main(String[] args) {
		Connection conn = DBUtil.getConnection();
		String sql1 = "select * from teach";
		String sql2 = "update teach set semester = ? where number = ?";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql1);
			while (rs.next()) {
				PreparedStatement ptmt = conn.prepareStatement(sql2);
				if (rs.getInt("number") % 48 == 0) {
					ptmt.setInt(1, 48);
				} else {
					ptmt.setInt(1, rs.getInt("number") % 48);
				}
				ptmt.setInt(2, rs.getInt("number"));
				ptmt.execute();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
