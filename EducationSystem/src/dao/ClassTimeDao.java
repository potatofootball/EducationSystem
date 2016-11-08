package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.DBUtil;
import model.ClassTime;

public class ClassTimeDao {

	// 增加上课时间信息
	public static boolean addClassTime(ClassTime classTime) {
		Connection conn = DBUtil.getConnection();
		try {
			String sql = "insert into classtime (number, name, time) values (?, ?, ?)";
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, classTime.getNumber());
			ptmt.setString(2, classTime.getName());
			ptmt.setString(3, classTime.getTime());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("增加上课时间信息失败");
			return false;
		}
	}

	// 修改上课时间信息
	public static boolean updateClassTime(ClassTime classTime) {
		Connection conn = DBUtil.getConnection();
		String sql = "update classtime set name = ? ,time = ? where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, classTime.getName());
			ptmt.setString(2, classTime.getTime());
			ptmt.setInt(3, classTime.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("修改上课时间信息失败");
			return false;
		}
	}

	// 删除上课时间信息
	public static boolean delClassTime(ClassTime classTime) {
		Connection conn = DBUtil.getConnection();
		String sql = "delete from classtime where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, classTime.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("删除上课时间信息失败");
			return false;
		}
	}

	// 初始加载上课时间信息
	public static boolean loadClassTime() {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from classtime";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				new ClassTime(rs.getInt("number"), rs.getString("name"), rs.getString("time"));
			}
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("上课时间信息加载失败");
			return false;
		}
	}
}
