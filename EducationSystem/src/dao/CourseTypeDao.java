package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.DBUtil;
import model.CourseType;

public class CourseTypeDao {
	// 增加调课信息
	public static boolean addCourseType(CourseType courseType) {
		Connection conn = DBUtil.getConnection();
		try {
			String sql = "insert into coursetype (number, name , ispickcourse) values (?, ?, ?)";
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, courseType.getNumber());
			ptmt.setString(2, courseType.getName());
			if (courseType.isPickCourse()) {
				ptmt.setInt(3, 0);
			} else {
				ptmt.setInt(3, 1);
			}
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("增加调课信息失败");
			return false;
		}
	}

	// 修改调课信息
	public static boolean updateCourseType(CourseType courseType) {
		Connection conn = DBUtil.getConnection();
		String sql = "update coursetype set name = ? , ispickcourse = ? where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, courseType.getName());
			if (courseType.isPickCourse()) {
				ptmt.setInt(2, 0);
			} else {
				ptmt.setInt(2, 1);
			}
			ptmt.setInt(3, courseType.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("修改调课信息失败");
			return false;
		}
	}

	// 删除调课信息
	public static boolean delCourseType(CourseType courseType) {
		Connection conn = DBUtil.getConnection();
		String sql = "delete from coursetype where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, courseType.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("删除调课信息失败");
			return false;
		}
	}

	// 初始加载调课信息
	public static boolean loadCourseType() {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from coursetype";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				new CourseType(rs.getInt("number"), rs.getString("name"), rs.getInt("ispickcourse"));
			}
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("调课信息加载失败");
			return false;
		}
	}
}
