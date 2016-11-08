package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.DBUtil;
import model.Course;

public class CourseDao {

	// 增加科目信息
	public static boolean addCourse(Course course) {
		Connection conn = DBUtil.getConnection();
		try {
			String sql = "insert into course (number, name, coursetype) values (? ,? ,?)";
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, course.getNumber());
			ptmt.setString(2, course.getName());
			ptmt.setInt(3, course.getCourseType().getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("增加科目信息失败");
			return false;
		}
	}

	// 修改科目信息
	public static boolean updateCourse(Course course) {
		Connection conn = DBUtil.getConnection();
		String sql = "update course set name = ? , coursetype = ? where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, course.getName());
			ptmt.setInt(2, course.getCourseType().getNumber());
			ptmt.setInt(3, course.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("修改科目信息失败");
			return false;
		}
	}

	// 删除科目信息
	public static boolean delCourse(Course course) {
		Connection conn = DBUtil.getConnection();
		String sql = "delete from course where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, course.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("删除科目信息失败");
			return false;
		}
	}

	// 初始加载科目信息
	public static boolean loadCourse() {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from course";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				new Course(rs.getInt("number"), rs.getString("name"), rs.getInt("coursetype"));
			}
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("科目信息加载失败");
			return false;
		}
	}
}
