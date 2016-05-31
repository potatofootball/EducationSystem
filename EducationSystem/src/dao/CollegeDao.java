package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.DBUtil;
import model.College;

public class CollegeDao {

	// 增加学院
	public static void addCollege(College college) {
		Connection conn = DBUtil.getConnection();
		try {
			String sql = "insert into college (number, name) values (?, ?)";
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, college.getNumber());
			ptmt.setString(2, college.getName());
			ptmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("增加学院失败");
			college = null;
		}
	}

	// 修改学院信息
	public static void updateCollege(College college) {
		Connection conn = DBUtil.getConnection();
		String sql = "update college set name = ? where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, college.getName());
			ptmt.setInt(2, college.getNumber());
			ptmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("修改学院信息失败");
		}
	}

	public static void delCollege(Integer number) {
		Connection conn = DBUtil.getConnection();
		String sql = "delete from college where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, number);
			ptmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("删除学院信息失败");
		}
	}

	public static void loadCollege() {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from college";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				new College(rs.getInt("number"), rs.getString("name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("学院信息加载失败");
		}
	}

}
